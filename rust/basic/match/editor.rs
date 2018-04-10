#[derive(Debug, PartialEq)]
enum Mode {
    Edit,
    Quited,
}

#[derive(Debug, PartialEq)]
struct Color {
    r: i32,
    g: i32,
    b: i32,
}

#[derive(Debug, PartialEq)]
struct Editor {
    color: Color,
    status: Mode,
    cursor: (i32, i32),
    file_mem: String,
}

enum Message<'a> {
    Quit,
    ChangeColor(i32, i32, i32),
    Move { x: i32, y: i32 },
    Write(&'a str),
}

impl Editor {
    fn new() -> Editor {
        Editor {
            color: Color { r: 0, g: 0, b: 0 },
            status: Mode::Edit,
            cursor: (0, 0),
            file_mem: String::new(),
        }
    }
    fn quit(&mut self) {
        self.status = Mode::Quited;
    }
    fn change_color(&mut self, r: i32, g: i32, b: i32) {
        self.color = Color { r: r, g: g, b: b };
    }
    fn write(&mut self, new_input: &str) {
        self.file_mem.push_str(new_input);
    }

    fn execute(&mut self, command: Message) -> &mut Self {
        use Message::*;
        match command {
            Quit => self.quit(),
            ChangeColor(r, g, b) => self.change_color(r, g, b),
            Write(input) => self.write(input),
            Move { x, y } => self.cursor = (x, y),
        };
        self
    }
}

fn main() {
    println!("Editor Example")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn editor_new() {
        assert_eq!(
            Editor::new(),
            Editor {
                color: Color { r: 0, g: 0, b: 0 },
                status: Mode::Edit,
                cursor: (0, 0),
                file_mem: String::new(),
            }
        );
    }

    #[test]
    fn editor_write() {
        let mut editor = Editor::new();
        editor.write("int main() {}");
        assert_eq!(editor.file_mem, String::from("int main() {}"));
    }

    #[test]
    fn editor_quit() {
        let mut editor = Editor::new();
        editor.quit();
        assert_eq!(editor.status, Mode::Quited);
    }

    #[test]
    fn editor_change_color() {
        let mut editor = Editor::new();
        editor.change_color(255, 255, 255);
        assert_eq!(
            editor.color,
            Color {
                r: 255,
                g: 255,
                b: 255,
            }
        );
    }

    #[test]
    fn editor_execute_by_message() {
        let mut editor = Editor::new();
        editor.execute(Message::Quit);
        assert_eq!(editor.status, Mode::Quited);
    }
}
