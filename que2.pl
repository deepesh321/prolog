directlyreachable(braavos,tyrosh).
directlyreachable(tyrosh,dorne).
directlyreachable(tyrosh,volantis).
directlyreachable(karhold,braavos).
directlyreachable(braavos,gulltown).
directlyreachable(gulltown,tyrosh).
directlyreachable(volantis,dorne).
directlyreachable(karhold,gulltown).

reachable_or_not(City1,City2,Visited) :-
  directlyreachable(City1,X) , 
  not(member(X,Visited)) , 
  ( City2 = X ; reachable_or_not(X,City2,[City1|Visited]) ) , !.

reachable(City1,City2) :-
  reachable_or_not(City1,City2,[]).

improve_reachable(City1,City2,[City1,City2]):-
  directlyreachable(City1,City2).

improve_reachable(City1,City2,Path) :-
  directlyreachable(City1,Second),
  improve_reachable(Second,City2,RemainingPath),
  Path = [City1|RemainingPath].