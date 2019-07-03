with Ada.Text_IO;

procedure Hello is
    package IO renames Ada.Text_IO;
begin
    IO.Put_Line("Hello, world!");
end Hello;
