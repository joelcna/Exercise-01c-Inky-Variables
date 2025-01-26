/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/
VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR gold = 50
VAR scroll = 0
-> memory

== memory ==
Before you stands the cavern of Josh. You wish your childhood friend pet was with you now. The cave might be less intimidating then. What was your pet's name?

* [Charlie]
    ~ pet_name = "Charlie" 
    -> cave_mouth
* [Susan]
    ~ pet_name = "Susan"
    -> cave_mouth
* [Spot]
    ~ pet_name = "Spot"
    -> cave_mouth


== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now!

You have {gold} gold and {torches} torches

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.

You have {gold} gold and {torches} torches
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west. The path diverges in two ways.
{pet_name == "Spot": Spot would love it here in the west| }
{scroll > 0: The scroll makes you feel eerie...}
You have {gold} gold and {torches} torches
+ [Go left] -> west_tunnel_left
+ [Go right] -> west_tunnel_right


+ [Go Back] -> cave_mouth
-> END

== west_tunnel_left ==
You are met by a bandit.
+ [Run back to the west tunnel] -> west_tunnel
+ [Fight the bandit] -> bandit_fight

== bandit_fight ==
~ gold = 0
The bandit takes all your money and you're forced to flee back to the west tunnel.

+[Return to west tunnel] -> west_tunnel


== west_tunnel_right ==
You find a small chest.

+ [Open the chest] -> chest_opening
+ [Return to the west tunnel] -> west_tunnel
== chest_opening ==
There is a mysterious scroll in the chest.

+[Take the scroll] -> scroll_taken
+[Do not take the scroll and return to the west tunnel] -> west_tunnel


== scroll_taken ==
~ scroll = 1
You take the scroll. Nothing happens but you sense a chill down your spine.

+ [Return to the west tunnel] -> west_tunnel

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
~ gold = gold + 1000
You now have {gold} gold
-> END