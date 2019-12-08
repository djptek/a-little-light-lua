-- array is indexed from 0 (not 1) 
function buildArray(iterator)
  local arr = {}
  for v in iterator do
    -- print (#arr, v, arr[0])
    if arr[0] == nil
      then arr[#arr] = v
    else
      arr[#arr + 1] = v
    end
  end
  return arr
end

-- 
function addId(x,y,id)
  print (x, y, id, board)
  -- is this new column?
  if board[x] == nil then board[x] = {} end
  -- is this new row?
  if board[x][y] == nil then 
    board[x][y] = {}
    board[x][y][id] = 1
  -- not (yet) interested if a wire repeats a coord
  elseif board[x][y][id] == nil then
    -- new wire intersection
    manhat = math.abs(x) + math.abs(y)
    board[x][y][id] = 1
    if minManhat == nil then 
      minManhat = manhat
    else 
      minManhat = math.min(minManhat, manhat)
    end
  end
end

--
function trace(arr, id)
  steps = buildArray(string.gmatch(arr,"([LRUD]%d+),"))
  x = 0
  y = 0
  -- don't add that point 
  for i=0,#steps do 
    delta = tonumber(string.match(steps[i],"[LRUD](%d+)"))
    dirn = string.match(steps[i],"([LRUD])")
    print (dirn, delta)
    if dirn == "L" then 
      nextx = x - delta
      for i=x-1,nextx,-1 do addId(i,y,id) end
      x = nextx 
    elseif dirn == "R" then
      nextx = x + delta
      for i=x+1,nextx,1 do addId(i,y,id) end
      x = nextx 
    elseif dirn == "D" then
      nexty = y - delta
      for i=y-1,nexty,-1 do addId(x,i,id) end
      y = nexty 
    elseif dirn == "U" then
      nexty = y + delta
      for i=y+1,nexty,1 do addId(x,i,id) end
      y = nexty 
    else
      print ("Unexpected input" .. steps[i])
      break
    end
  end
  return program
end 

--
paths = io.lines("input")
board = {}
minManhat = nil
-- ids from 1 so can use # 
id = 1 
for path in paths do
  trace(path, id)
  id = id + 1
end
print (minManhat)

