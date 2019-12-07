function readAll(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end

function buildArray(iterator)
  local arr = {}
  for v in iterator do
    -- print (#arr, v, arr[0])
    if arr[0] == nil
      then arr[#arr] = tonumber(v)
    else
      arr[#arr + 1] = tonumber(v)
    end
  end
  return arr
end

function serializeArray(arr)
  local s = tostring(arr[0])
  for i=1,#arr-1 do
     s = s .. "," .. tostring(arr[i])
  end
  return s
end

-- main
  function compute(a1, a2)
  raw = readAll("input")
  local program = buildArray(string.gmatch(raw,"(%d+),"))
  program[1] = a1
  program[2] = a2
  
  -- print ("input is", serializeArray(program)) 
  for i=0,#program,4 do 
    -- print (i, program[i])
    if program[i] == 1 
      then program[program[i+3]] = 
        program[program[i+1]] + program[program[i+2]]
    elseif program[i] == 2 
      then program[program[i+3]] = 
        program[program[i+1]] * program[program[i+2]]
    elseif program[i] == 99
      then break
    else 
      print ("Error - found ",program[i]," at ",i)
    end
  end
  return program
end 

target= 19690720
output=-1
for a1=0,99 do
  for a2=0,99 do
    output=compute(a1,a2)
    -- print (a1, a2, output[0])
    if output[0] == target 
      then 
        print (output[0])
        print ("noun ", a1)
        print ("verb ", a2)
        print ("100 * noun + verb", 100 * a1 + a2)
      break
    end
  end
  if output[0] == target then break end
end
