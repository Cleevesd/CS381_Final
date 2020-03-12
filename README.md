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
| PushN 12 <br/> PushN 3 <br/> Add |15 |
| PushN 12 <br/> PushN 3 <br/> Subtract |9 |
| PushN 12 <br/> PushN 3 <br/> Multiply |36 |
| PushN 12 <br/> PushN 3 <br/> Divide |4 |
| PushN 12 <br/> PushN 3 <br/> Mod |0|
| PushN 12 <br/> PushN 3 <br/> ToThe |1729|
| PushN 12 <br/> PushN 3 <br/> Mod <br/> PushN 0 <br/> IfElse [PushN 7, PushN 8, Mul] [PushN 3, PushN 4, Add] <br/> |56|