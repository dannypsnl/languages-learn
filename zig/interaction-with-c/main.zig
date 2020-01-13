const c = @cImport({
    @cInclude("add.h");
});
const warn = @import("std").debug.warn;

pub fn main() void {
    const result = c.add(1, 2);
    warn("add from c: {}\n", result);
}
