const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const exe = b.addExecutable("main", "main.zig");

    exe.linkSystemLibrary("c");
    exe.addIncludeDir(".");
    exe.install();

    b.default_step.dependOn(&exe.step);
}
