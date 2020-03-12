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

data Type = I Int
        | B Bool
        | S String
        | P Prog
  deriving (Eq, Show)

data Cmd = Push Type
         | Mul
         | Sub
         | Div
         | Add
         | Eql
         | Tothe
         | Mod
         | IfElse
  deriving (Eq, Show)


type TypeInt = Int

type Stack = [Either Type TypeInt]

type Domain = Stack -> (Maybe Stack)

-- String Concatanation

stringCont :: String -> String -> Prog
stringCont l r = [Push (S l), Push (S r), Add]

catString :: Prog
catString = stringCont "Test" "Concatanation"

ex1 :: Prog
ex1 = [Push (S "Test"), Push (S "Concatenation"), Add]

ex2 :: Prog
ex2 = [Push (I 3), Push (I 4), Mul]

ex3 :: Prog
ex3 = [Push (I 5), Push (I 4), Sub]

ex4 :: Prog
ex4 = [Push (I 12), Push (I 4), Div]

ex5 :: Prog
ex5 = [Push (I 4), Push (S "test"), Add]

ex6 :: Prog
ex6 = [Push (I 4), Push (S "test"), Sub]

ex7 :: Prog
ex7 = [Push (I 4), Push (S "test"), Mul]

ex8 :: Prog
ex8 = [Push (I 4), Push (S "test"), Div]

ex9 :: Prog
ex9 = [Push (S "test"), Push (I 4), Add]

ex10 :: Prog
ex10 = [Push (S "test"), Push (I 4), Sub]

ex11 :: Prog
ex11 = [Push (S "test"), Push (I 4), Mul]

ex12 :: Prog
ex12 = [Push (S "test"), Push (I 4), Div]

ex13 :: Prog
ex13 = [Push (I 9), Push (I 3), Mod]

ex14 :: Prog
ex14 = [Push (I 10), Push (I 3), Mod]

ex15 :: Prog
ex15 = [Push (I 6), Push (I 5), Add, Push (I 11), Eql]

ex16 :: Prog
ex16 = [Push (I 6), Push (I 5), Add, Push (I 12), Eql]

-- 7. Define the semantics of a StackLang command (ignore If at first).
cmd :: Cmd -> Domain
cmd (Push i)     = \s -> (Just (Left i : s))
cmd Add          = \s -> case s of
                           (Left i : Left j : s') -> case (i,j) of -- Add uses + or ++ based on if string or int
                                                       (I i', I j') -> (Just (Left (I (j' + i')) : s'))
                                                       (S i', S j') -> (Just (Left (S (j' ++ i')) : s'))
                                                       _ -> (Nothing)
cmd Sub          = \s -> case s of
                           (Left i : Left j : s') -> case (i,j) of -- Add uses + or ++ based on if string or int
                                                       (I i', I j') -> (Just (Left (I (j' - i')) : s'))
                                                       _ -> (Nothing)
cmd Mul          = \s -> case s of
                           (Left i : Left j : s') -> case i of
                                                       (I i') -> case j of
                                                                     (I j') -> (Just (Left (I (j' * i')) : s'))
                                                                     _ -> (Nothing)
                                                       _ -> (Nothing)
cmd Div         = \s -> case s of
                           (Left i : Left j : s') -> case i of
                                                       (I j') -> case j of
                                                                     (I i') -> (Just (Left (I (i' `div` j')) : s'))
                                                                     _ -> (Nothing)
                                                       _ -> (Nothing)
cmd Mod         = \s -> case s of
                           (Left i : Left j : s') -> case i of
                                                       (I j') -> case j of
                                                                     (I i') -> (Just (Left (I (i' `mod` j')) : s'))
                                                                     _ -> (Nothing)
                                                       _ -> (Nothing)
cmd Tothe          = \s -> case s of
                           (Left i : Left j : s') -> case (i,j) of -- Add uses + or ++ based on if string or int
                                                       (I i', I j') -> (Just (Left (I (j' ^ i')) : s'))
                                                       _ -> (Nothing)
cmd Eql          = \s -> case s of
                           (Left i  : Left j  : s') -> (Just (Left (B (j == i)) : s'))
                           _ -> (Nothing)


-- 8. Define the semantics of a StackLang program.
prog :: Prog -> Domain
prog []    = \s -> (Just s)
prog (c:p) = \s -> case cmd c s of
                     (Just s') -> prog p s'
                     _ -> (Nothing)

-- | Run a program on an initially empty stack.
--
--   >>> run ex1
--   (Nothing, Just [Left (S "TestConcatenation")])
--   >>> run (genSum [1..10])
--   Just [Left 55]
--
--   >>> run [PushN 3, Add, PushN 4]
--   Nothing
--
run :: Prog -> (Maybe Stack)
run p = prog p []