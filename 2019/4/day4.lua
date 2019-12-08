function hasDouble(p)
  s = tostring(p)
  for c in string.gmatch(s,".") do
    if c == last then return true end
    last = c
  end
  return false
end

function isIncreasing(p)
  s = tostring(p)
  last = 0
  for c in string.gmatch(s,".") do
    cnum = tonumber(c)
    if cnum < last then return false end
    last = cnum
  end
  return true
end

c = 0
for p=165432,707912 do
  if hasDouble(p) and
     isIncreasing(p) then 
    print (p)
    c = c + 1
  end
end
print ("total", c)
  
