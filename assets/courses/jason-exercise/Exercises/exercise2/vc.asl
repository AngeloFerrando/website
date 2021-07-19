
/*

Very simple vacuum cleaner agent in a world that has only four locations.

Perceptions:
. dirty: the current location has dirty
. clean: the current location is clean
. pos(X,Y): the agent position.

Actions:
. suck: clean the current location
. left, right, up, down: move the agent

*/

// TODO: the code of the agent
!clean. // initial goal to clean
!pause. // initial goal to break

// plan to clean the house
+!clean : clean <- !move; !clean.
+!clean : dirty <- suck; !move; !clean.
-!clean         <- !clean.

/* TO-DO */
/* 
Modify the move plan to make it general (thus for any pos(X,Y)). 
The robot must be able to visit all the environment (NxN).
*/
// hint: in the following we are supposing the grid dimension 2x2 (it will not be always 2!!)
// hint: size(N) is a perception added by the environment to inform the agent about the grid dimension
+!move : pos(0, 0) <- right.
+!move : pos(1, 0) <- down.
+!move : pos(1, 1) <- left.
+!move : pos(0, 1) <- up.

/* TO-DO */
/*
After the robot has cleaned all, it must come back to the first position in order to restart to clean the house again and again!
*/
// plan to come at the first position
//+!go_home : ... <- ... 

+!pause
  <- .wait(2000);     // suspend this intention (the pause) for 2 seconds
     .suspend(clean); // suspend the clean intention
     .print("I'm having a break, alright.");
     .wait(1000);     // suspend this intention again for 1 second
     .print(cleaning);
     .resume(clean);  // resume the clean intention
     !pause.
