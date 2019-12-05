masses = io.lines("input")
sum = 0
for mass in masses do 
   sum = sum + (math.floor(mass/3)-2) 
end
print (sum)

