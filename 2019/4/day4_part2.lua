-- array is indexed from 1 
function buildArray(iterator)
  local arr = {}
  for v in iterator do arr[#arr+1] = v end
  return arr
end

function hasPureDouble(p)
  s = tostring(p)
  a = buildArray(string.gmatch(s,"."))
  for i=1,#a do
    --print (a[i-1], a[i], a[i+1], a[i+2])
    if a[i-1] ~= a[i] and
       a[i+1] == a[i] and
       a[i+2] ~= a[i] then return true end
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
  if hasPureDouble(p) and
     isIncreasing(p) then 
    print (p)
    c = c + 1
  end
end
print ("total", c)
  
