child(brandonstark,lyarrastark).
child(benjenstark,lyarrastark).
child(benjenstark,rickardstark).
child(lyannastark,rickardstark).
child(eddardstark,lyarrastark).
child(lyannastark,lyarrastark).
child(eddardstark,rickardstark).
child(brandonstark,rickardstark).
child(rickonstark,eddardstark).
child(robbstark,catelynstark).
child(sansastark,eddardstark).
child(aryastark,eddardstark).
child(sansastark,catelynstark).
child(robbstark,eddardstark).
child(aryastark,catelynstark).
child(branstark,catelynstark).
child(rickonstark,catelynstark).
child(branstark,eddardstark).
child(rhaenystargaryen,rhaegartargaryen).
child(aegontargaryen,rhaegartargaryen).
child(rhaenystargaryen,eliamartell).
child(aegontargaryen,eliamartell).
child(jonsnow,rhaegartargaryen).
child(jonsnow,lyannastark).
child(rhaegartargaryen,rhaellatargaryen).
child(viserystargaryen,aerystargaryen).
child(daenerystargaryen,aerystargaryen).
child(viserystargaryen,rhaellatargaryen).
child(daenerystargaryen,rhaellatargaryen).
child(rhaegartargaryen,aerystargaryen).

female(sansastark).
female(lyarrastark).
female(catelynstark).
female(lyannastark).
female(daenerystargaryen).
female(aryastark).
female(rhaenystargaryen).
female(rhaellatargaryen).
female(eliamartell).


spouse(rhaegartargaryen,lyannastark).
spouse(rhaellatargaryen,aerystargaryen).
spouse(eddardstark,catelynstark).
spouse(lyarrastark,rickardstark).
spouse(aerystargaryen,rhaellatargaryen).
spouse(rhaegartargaryen,eliamartell).
spouse(eliamartell,rhaegartargaryen).
spouse(rickardstark,lyarrastark).
spouse(catelynstark,eddardstark).
spouse(lyannastark,rhaegartargaryen).


male(robbstark).
male(aegontargaryen).
male(rickardstark).
male(jonsnow).
male(aerystargaryen).
male(rhaegartargaryen).
male(eddardstark).
male(branstark).
male(rickonstark).
male(viserystargaryen).
male(brandonstark).
male(benjenstark).

husband(X,Y):-
  male(X),
  spouse(X,Y).


sisters(X,Y):-
  female(X),
  female(Y),
  child(X,Parent),
  child(Y,Parent), 
  X \= Y.

siblings(X,Y):-
  ((female(X) , male(Y)) ; (male(X) , female(Y))),
  child(X,Parent) ,
  child(Y,Parent).

mother(X,Y):-
  female(X) , 
  child(Y,X).

grandson(X,Y):-
  male(X),
  grandchild(X,Y).

granddaughter(X,Y):-
  female(X),
  grandchild(X,Y).

descendant(X,Y):-
  child(X,Y) ; (child(X,Parent),
  descendant(Parent,Y)).

father(X,Y):-
  male(X) , 
  child(Y,X).

aunt(X,Y):-
  female(X) , 
 (siblings(X,Parent);sisters(X,Parent)), 
  child(Y,Parent).

uncle(X,Y):-
  male(X),
 (siblings(X,Parent);brothers(X,Parent)),
  child(Y,Parent).

grandchild(X,Y):-
  child(Parent,Y),
  child(X,Parent).

wife(X,Y):-
  female(X),
  spouse(X,Y).

brothers(X,Y):-
  male(X),
  male(Y),
  child(X,Parent),
  child(Y,Parent), 
  X \= Y.