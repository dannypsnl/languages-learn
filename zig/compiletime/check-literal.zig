fn positive_int(comptime i: i64) i64 {
    comptime {
        if (i < 0) {
            @compileError("negative int");
        }
    }
    return i;
}

test "compile time check literal" {
    const x: i64 = positive_int(-1);
}
