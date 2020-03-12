# Popper

Ryan Sisco *siscor@oregonstate.edu*

Christopher Miyasako *miyasakc@oregonstate.edu*

Dakota Cleeves *cleevesd@oregonstate.edu*

Tianchi Wu *wutia@oregonstate.edu*

## Intro:
The language that we will be implementing for this project will 
called Popper. It will have a Stack-Based language paradigm and
will be capable of manipulating strings as lists of chars,
handling int and boolean values, and handling functions created
by the users.

## Expected Output:

| Input | Output |
| --- |---	|
| run [Push (I 12), Push (I 3), Add] |Just [Left (I 15)] |
| run [Push (I 12), Push (I 3), Subtract] |Just [Left (I 9)]|
| run [Push (I 12), Push (I 3), Multiply] |Just [Left (I 36)]|
| run [Push (I 12), Push (I 3), Divide] |Just [Left (I 4)]|
| run [Push (I 12), Push (I 3), Mod] |Just [Left (I 0)]|
| run [Push (I 12), Push (I 3), ToThe] |Just [Left (I 1729)]|
| run [Push (I 12), Push (I 3), Mod, PushN 0, IfElse [PushN 7, PushN 8, Mul] [PushN 3, PushN 4, Add]] |Just [Left (I 56)]|
| run [Push (I 12), Push (S "myString"), Add] | Nothing |
| run [Push (S "Hello"), Push (S "World"), Add] | Just [Left (S "HelloWorld")] |

