# x, y without type, this is a generic function
function f(x, y)
    x + y
end

println(f(1, 2))
# 3
g = f # g is f
println(g(1, 2))

function with_return()
    return "I have return"
end
println(with_return())

function hypot(x, y)
    x = abs(x)
    y = abs(y)
    if x > y
        r = y/x
        return x*sqrt(1+r*r)
    end
    if y == 0
        return zero(x)
    end
    r = x/y
    return y*sqrt(1+r*r)
end

println(hypot(3, 4))
# 5

println(+(1, 2, 3) == (1 + 2 + 3))
# operator is function
