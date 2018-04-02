println('x')
# x
println(Char(120))
# x
println(Char(0x110000))
println(isvalid(Char(0x110000)))
# false
println(Int('\0'))
# 0
println(Int('\t'))
# 9
println(Int('\n'))
# 10

v = [1, 2, 3]
println("v: $v")
# v: [1, 2, 3]

println(search("xylophone", 'o'))
# 4
println(search("xylophone", 'o', 5))
# 7                              ^ from
println(search("xylophone", 'o', 8))
# 0                              ^ from
println(repeat(".:Z:.", 10))
# .:Z:..:Z:..:Z:..:Z:..:Z:..:Z:..:Z:..:Z:..:Z:..:Z:.
