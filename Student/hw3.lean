/-!
# Homework #3

Near final DRAFT. 

The purpose of this homework is to strengthen your
understanding of function composition and of enumerated
and product data types. 
-/

/-!
## Problem #1

Define a function of the following polymorphic type:
{α β γ : Type} → (β → γ) → (α → β) → (α → γ). Call it
*funkom*. After the implicit type arguments it should
take two function arguments and return a function as
a result. 
-/

-- Answer below
def funkom {α β γ : Type}: (β → γ) → (α → β) → (α → γ)
| g, f => (fun a => g (f a))


/-! 
## Problem #2

Define a function of the following polymorphic type:
{α β : Type} → (a : α) → (b : β) → α × β. Call it mkop.
-/

-- Answer below
def mkop {α β : Type} : (a: α) → (b : β) → α × β
| a, b => (a, b)



/-! 
## Problem #3

Define a function of the following polymorphic type:
{α β : Type} → α × β → α. Call it op_left.
-/

-- Answer below
def op_left : {α β : Type} → α × β → α := Prod.fst



/-! 
## Problem #4

Define a function of the following polymorphic type:
{α β : Type} → α × β → β. Call it op_right.
-/

-- Answer below
def op_right : {α β : Type} → α × β → β := Prod.snd


/-! #5
## Problem #5

Define a data type called *Day*, the values of which
are the names of the seven days of the week: *sunday,
monday, etc. 

Some days are work days and some days are play
days. Define a data type, *kind*, with two values,
*work* and *play*.

Now define a function, *day2kind*, that takes a *day*
as an argument and returns the *kind* of day it is as
a result. Specify *day2kind* so that weekdays (monday
through friday) are *work* days and weekend days are
*play* days.

Next, define a data type, *reward*, with two values,
*money* and *health*.

Now define a function, *kind2reward*, from *kind* to 
*reward* where *reward work* is *money* and *reward play* 
is *health*.

Finally, use your *funkom* function to produce a new
function that takes a day and returns the corresponding
reward. Call it *day2reward*.

Include test cases using #reduce to show that the reward
from each weekday is *money* and the reward from a weekend
day is *health*.
-/

inductive Day : Type
|sunday
|monday
|tuesday
|wednesday
|thursday
|friday
|saturday

inductive kind : Type
|work
|play

open Day
open kind

def day2kind: Day → kind
| monday => work
| tuesday => work
| wednesday => work
| thursday => work
| friday => work
| saturday => play
| sunday => play

inductive reward : Type
|money
|health

open reward

def kind2reward : kind → reward
|work => money
|play => health

def day2reward: Day → reward := funkom kind2reward day2kind

#check day2reward monday



/-!
Problem #6

Consider the outputs of the following #check commands. 
-/

#check Nat × Nat × Nat
#check Nat × (Nat × Nat)
#check (Nat × Nat) × Nat

/-!
Is × left associative or right associative?

Answer here: Left

Define a function, *triple*, of the following type:
{ α β γ : Type } → α → β → γ → (α × β × γ)  
-/

-- Here:


def triple: { α β γ : Type } → α → β → γ → (α × β × γ)
| a, b, c => ( a b c)



/-!
Define three functions, call them *first*, *second*, 
and *third*, each of which takes any such triple as
an argument and that returns, respectively, it first,
second, and third elements.
-/

-- Here:

/-!
Write three test cases using #eval to show that when 
you apply each of these "elimination" functions to a
triple (that you can make up) it returns the correct
element of that triple.  
-/

-- Here:

/-!
Use #check to check the type of a term (that you can
make up) of type (Nat × String) × Bool. 
-/




