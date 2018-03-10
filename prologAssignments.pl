% Code base for the Prolog Programming Assignment 2018.
% Entered by Stuart Hansen
% Completed by: Bryce Sulin

% Here are some men
man(stuart).
man(kurt).
man(mark).
man(rayond).
man(august).
man(hans).
man(ryan).
man(adam).
man(max).

% Here are some women.
woman(erica).
woman(susan).
woman(elaine).
woman(viola).
woman(ida).
woman(florence).
woman(marissa).
woman(annika).
woman(kaita).

% For our purposes, we will always put the woman's name first in the
% marriage facts.
married(erica, stuart).
married(susan, mark).
married(elaine, raymond).
married(viola, august).
married(ida, hans).
married(marissa, ryan).
married(annika, adam).

% For our purposes, the parent's name always comes first
parent(susan, marissa).
parent(mark, marissa).
parent(susan, annika).
parent(mark, annika).
parent(elaine, mark).
parent(raymond, mark).
parent(elaine, stuart).
parent(raymond, stuart).
parent(elaine, kurt).
parent(raymond, kurt).
parent(viola, elaine).
parent(august, elaine).
parent(ida, raymond).
parent(hans, raymond).

% X is Y's Grandparent
grandParent(X,Y):-parent(X,Z),parent(Z,Y).

% X is Y's Grandmother
grandMother(X,Y):-grandParent(X,Y),woman(X).


% ********************************************
% Binary Search Trees (Test Cases)
tree1(t(6, t(4, t(2, nil, nil), t(5, nil, nil)), t(9, t(7, nil, nil), nil))).
tree2(t(8, t(5, nil, t(7, nil, nil)), t(9, nil, t(11, nil, nil)))). 

% ********************************************
% Prolog Programming Assignment Rules:

% 1. X is Y’s mother-in-law
motherInLaw(X,Y):-parent(X,Z),married(Z,Y),woman(X).
motherInLaw(X,Y):-parent(X,Z),married(Y,Z),woman(X).

% 2. Flatten Predicate
myFlatten([], []) :- !.
myFlatten([List|Lists], X) :-
    !,
    myFlatten(List, NewList),
    myFlatten(Lists, NewLists),
    append(NewList, NewLists, X).
myFlatten(List, [List]).

% 3. Insertion Sort
insert(X, [], [X]):- !.
insert(X, [X1|L1], [X, X1|L1]):- X=<X1, !.
insert(X, [X1|L1], [X1|List]):- insert(X, L1, List).

insertionSort([], []):- !.
insertionSort([X|List], Sorted):- insertionSort(List, Sorted1), insert(X, Sorted1, Sorted).

% 4A. PreOrder
preOrder(t(K,L,R), X):-preOrder(L,LL), preOrder(R, LR),
append([K|LL], LR, X).
preOrder(nil, []). 

% 4B. PostOrder
postOrder(t(K,L,R), X):-postOrder(L,LL), postOrder(R, LR),
append(LL, LR,R1), append(R1, [K], X).
postOrder(nil, []). 
