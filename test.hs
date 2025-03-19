checkPassword :: String -> String
checkPassword "swordfish" = "You're in."
checkPassword "mellon" = "You're in."
checkPassword _ = "ACCESS DENIED!"

postagePrice :: Integer -> Integer
postagePrice x = if x < 500 then 250 
    else if x <= 5000 then (300 + x - 500) else 6000


step :: Integer -> Integer
step n = div n 3

ilog3 :: Integer -> Integer
ilog3 0 = 0
ilog3 n = 1 + ilog3 (step n)