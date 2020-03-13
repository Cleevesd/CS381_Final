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

## Expected:

| Operation | Input | Output |
| --- | --- |---	|
| Add | run [Push (I 12), Push (I 3), Add] |Just [Left (I 15)] |
| Sub | run [Push (I 12), Push (I 3), Subtract] |Just [Left (I 9)]|
| Mul | run [Push (I 12), Push (I 3), Multiply] |Just [Left (I 36)]|
| Div | run [Push (I 12), Push (I 3), Divide] |Just [Left (I 4)]|
| Mod | run [Push (I 12), Push (I 3), Mod] |Just [Left (I 0)]|
| Tothe | run [Push (I 12), Push (I 3), ToThe] |Just [Left (I 1729)]|
| Ifelse | run [Push (I 12), Push (I 3), Mod, Push (I 0), Eql, IfElse [Push (I 7), Push (I 8), Mul] [Push (I 3), Push (I 4), Add]] |Just [Left (I 56)]|
| Dupe | run [Push (I 12), Dupe] | Just [Left (I 12), Left (I 12)] |
| Swap | run [Push (I 12), Push (I 13), Push (S "Swapped!"), Swap] | Just [Left (I 13),Left (S "Swapped!"),Left (I 12)] |
| While | run [Push (I 1), While [Push (B True)] [Push (I 1)]] | *Pumps the stack recurisvely, no output* |
| Eql | run [Push (I 1), Push (I 1), Eql] | Just [Left (B True)] |
| NEql | run [Push (I 1), Push (I 1), NEql] | Just [Left (B False)] |


## Unexpected:

| Operation | Input | Output |
| --- | --- |---	|
| Add | run [Push (I 12), Push (S "myString"), Add] | Nothing |
| Sub | run [Push (I 12), Push (S "myString"), Sub] | Nothing |
| Mul | run [Push (S "Can't"), Push (S "Multiply"), Mul] | Nothing |
| Div | run [Push (I 12), Push (S "myString"), Div] | Nothing |
| Tothe | run [Push (I 12), Push (S "myString"), Tothe] | Nothing |
| Ifelse | run [Push (I 12), Push (I 3), Mod, Push (I 0), IfElse [Push (I 7), Push (I 8), Mul] [Push (I 3), Push (I 4), Add]] | Nothing |
| Mod | run [Push (I 12), Push (S "myString"), Mod] | Nothing |
| Dupe | run [Dupe] | Nothing |
| Swap | run [Push (I 12), Swap, Push (I 12)] | Nothing |
| Eql | run [Push (I 1), Push (S "myString"), Eql] | Nothing |
| NEql | run [Push (I 1), Push (S "myString"), NEql] | Nothing |