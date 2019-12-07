function readAll(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end

function buildArray(iterator)
  local arr = {}
  for v in iterator do
    print (#arr, v, arr[0])
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
raw = readAll("input")
print ("program is ",raw)
local program = buildArray(string.gmatch(raw,"(%d+),"))

-- setup: replace position 1 with the value 12 
program[1] = 12
-- and replace position 2 with the value 2
program[2] = 2

print ("input is", serializeArray(program)) 
for i=0,#program,4 do 
  -- print (i, program[i])
  if program[i] == 1 
  -- Opcode 1 adds together numbers read from two positions and stores the 
  -- result in a third position. The three integers immediately after the 
  -- opcode tell you these three positions - the first two indicate the 
  -- positions from which you should read the input values, and the third 
  -- indicates the position at which the output should be stored
    then program[program[i+3]] = 
      program[program[i+1]] + program[program[i+2]]
  elseif program[i] == 2 
  -- works exactly like opcode 1, except it multiplies the two inputs 
  -- instead of adding them. Again, the three integers after the opcode 
  -- indicate where the inputs and outputs are, not their values
    then program[program[i+3]] = 
      program[program[i+1]] * program[program[i+2]]
  elseif program[i] == 99
    -- then print ("position 0", program[0]) 
    then print ("output is", serializeArray(program)) 
  else 
    print ("Error - found ",program[i]," at ",i)
  end
end

