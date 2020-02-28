module Popper where

import Prelude hiding (Num)

-- 
-- POPPER SYNTAX
--
-- num      ==  integer
-- bool     ==  `true` or `false`
-- string   ==  standard string
-- prog     ==  [cmd, cmd, cmd...] 
-- cmd      ==  num
--          ==  bool
--          ==  string
--          ==  `multiply`
--          ==  `divide`
--          ==  `add`
--          ==  `subtract`
--          ==  `tothe` (This command is for exponents like 2 tothe 3 results in 8)
--          ==  `mod`   (This is modulo, will be done with recursion until lessthan then return)

type Prog = [Cmd]

data Cmd = PushN Int
         | PushB Bool
         | PushS String
         | Multiply
         | Divide
         | Add
         | Subtract
         | Tothe
         | Mod
  deriving (Eq, Show)