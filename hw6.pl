https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
:- use_module(library(clpfd)).


% Define the relations described below. You may test your code using SWI-Prolog
% by entering consult(hw6) or [hw6] as a query in swipl, when you have started
% swipl in the directory containing this file.

% ----
% Example. Define a relation swap/2 which relates a pair to its mirrored 
% version. We will use -/2 to represent pairs, e.g., X-Y.
%
% ?- swap(a-b, b-a).
% true.
% 
% ?- swap(1-2,X).
% X = 2-1.
% 
% ?- swap(X, hello-goodbye).
% X = goodbye-hello.
% 
% ?- swap(P, Q).
% P = _A-_B,
% Q = _B-_A.

swap(X-Y, Y-X).


% ----
% 1. Define a relation zip/3 that relates three lists of the same length, where
% each element of the third list is a pair containing the corresponding
% elements of the first two lists.
% 
% ?- zip([1,2],[a,b],[1-a,2-b]).
% true.
% 
% ?- zip([1,2],[a,b],L).
% L = [1-a, 2-b].
% 
% ?- zip([1],[2,3],L).
% false.

zip(_,_,_) :- false.


% ----
% 2. Define a relation sorted/1 that holds when its argument is a list of
% integers in non-decreasing order.
% 
% ?- sorted([]).
% true.
% 
% ?- sorted([1,2,100,255]).
% true .
% 
% ?- sorted([1,2,100,25]).
% false.
% 
% ?- sorted([1,X,1,20]).
% X = 1.

sorted(_) :- false.


% ----
% 3. Define a relation symmetric/1 that holds when its argument is a binary
% tree that is equal to its mirror image (the tree created by switching the
% left and right children of every node).
%
% Suggestion: Consider defining a helper relation mirror/2.
%
% ?- symmetric(tip).
% true.
% 
% ?- symmetric(bin(tip, 1, bin(tip, 2, tip))).
% false.
% 
% ?- symmetric(bin(bin(tip, 0, tip), 1, bin(tip, 2, tip))).
% false.
% 
% ?- symmetric(bin(bin(tip, 1, bin(tip, 2, tip)), foo, bin(bin(tip, 2, tip), 1, tip))).
% true.
% 
% ?- symmetric(bin(bin(tip, 1, bin(tip, 2, tip)), foo, R)).
% R = bin(bin(tip, 2, tip), 1, tip).

symmetric(_) :- false.


% ----
% 4. Consider the relation inorder/2, which relates a binary tree to a list
% containing the labels of the binary tree, where the labels for a node's left
% descendents occur before the node and its right descendents occur after.

inorder(A, B) :- inorder(A, [], B).

inorder(tip, A, A).
inorder(bin(L, X, R), T, A) :-
	inorder(L, [X|B], A),
	inorder(R, T, B).

% Define a relation preorder/2 that relates a binary tree to a list containing
% the labels of the binary tree, where the labels for a node's left descendents
% occur between the label for the node and the label for its right descendents.
% 
% ?- preorder(tip, L).
% L = [].
%
% ?- preorder(bin(bin(tip,2,tip),3,bin(tip,4,tip)), L).
% L = [3, 2, 4].
% 
% ?- preorder(bin(bin(tip,2,tip),3,bin(tip,4,bin(tip,5,tip))), L).
% L = [3, 2, 4, 5].
% 
% ?- preorder(bin(bin(tip,2,tip),3,bin(bin(tip,6,tip),4,bin(tip,5,tip))),
% L = [3, 2, 4, 6, 5].
% 
% ?- preorder(bin(bin(tip,A,tip),B,tip), [1,2]).
% A = 2,
% B = 1.

preorder(_, _) :- false.
