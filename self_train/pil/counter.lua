function newCounter()
    local i = 0
    return function()
        i = i + 1
        return i
    end
end

function newCounter2()
    local i = 0
    i = i + 1
    return i
end

-- clousure 
c1 = newCounter() 
print("c1 = ", c1())
print("c1 = ", c1())

-- complile error here.
c2 = newCounter2()
print("c2 = ", c2())
print("c2 = ", c2())
