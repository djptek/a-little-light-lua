function fuel (mass)
   --print (mass)
   return math.max(math.floor(mass/3)-2,0)
end

function compensated_fuel (mass)
   load_fuel = mass
   total = 0
   repeat
      load_fuel = fuel (load_fuel)
      total = total + load_fuel
   until ( load_fuel == 0 )
   return total
end 

masses = io.lines("input")
sum = 0
for mass in masses do 
   --sum = sum + (math.floor(mass/3)-2) 
   sum = sum + (compensated_fuel(mass))
end
print (sum)

