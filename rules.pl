/* 
 *This file contains rules for the Hexagonal Chess game for each piece and thus giving the valid moves that are possible
 */

/* =================================================================================================================================*/ 
/* PAWN MOVES START HERE */

getPawnMoves(piecePosition(Piece,Turn,X,Y), Board, Moves) :- getPawnMovesForInitialPosition(piecePosition(Piece,Turn,X,Y), Board, TempMoves),
                                                             addPawnAttackMoves(piecePosition(Piece,Turn,X,Y), Board, TempMoves, Moves).


getPawnMoves(piecePosition(Piece,Turn,X,Y), Board, Moves) :- getPawnMovesForOtherPosition(piecePosition(Piece,Turn,X,Y), Board, TempMoves),
                                                             addPawnAttackMoves(piecePosition(Piece,Turn,X,Y), Board, TempMoves, Moves).
                                                                                          


/*
 * Moves for initial positions of the pawn  
 */

/*Single move possibilities*/

%(1,2) -> (1,3)
getPawnMovesForInitial(piecePosition(Piece,0,1,2), Board, TempMoves) :- isVacant(piecePosition(_,_,1,3), Board), !,
                                                                        TempMoves = [['pawn',1,2,1,3]].

getPawnMovesForInitial(piecePosition(Piece,0,1,2), Board, TempMoves) :- \+isVacant(piecePosition(_,_,1,3), Board), !,
                                                                        TempMoves = [].

%(9,6) -> (9,7)
getPawnMovesForInitial(piecePosition(Piece,0,9,6), Board, TempMoves) :- isVacant(piecePosition(_,_,9,7), Board), !,
                                                                        TempMoves = [['pawn',9,6,9,7]].

getPawnMovesForInitial(piecePosition(Piece,0,9,6), Board, TempMoves) :- \+isVacant(piecePosition(_,_,9,7), Board), !,
                                                                        TempMoves = [].

%(1,5) -> (1,4)
getPawnMovesForInitial(piecePosition(Piece,1,1,5), Board, TempMoves) :- isVacant(piecePosition(_,_,1,4), Board), !,
                                                                        TempMoves = [['pawn',1,5,1,4]].

getPawnMovesForInitial(piecePosition(Piece,1,1,5), Board, TempMoves) :- \+isVacant(piecePosition(_,_,1,4), Board), !,
                                                                        TempMoves = [].


%(9,9) -> (9,8)
getPawnMovesForInitial(piecePosition(Piece,1,9,9), Board, TempMoves) :- isVacant(piecePosition(_,_,9,8), Board), !,
                                                                        TempMoves = [['pawn',9,9,9,8]].

getPawnMovesForInitial(piecePosition(Piece,1,9,9), Board, TempMoves) :- \+isVacant(piecePosition(_,_,X,Y), Board), !,
                                                                        TempMoves = [].

/* Double Move possibilites */
%(2,2)
getPawnMovesForInitial(piecePosition(Piece,0,2,2), Board, TempMoves) :- \+isVacant(piecePosition(_,_,2,3), Board), !,
                                                                        TempMoves = [].

getPawnMovesForInitial(piecePosition(Piece,0,2,2), Board, TempMoves) :- isVacant(piecePosition(_,_,2,3), Board),
                                                                        isVacant(piecePosition(_,_,2,4), Board), !,
                                                                        TempMoves = [['pawn',2,2,2,3],['pawn',2,2,2,4]].
                                                                           
getPawnMovesForInitial(piecePosition(Piece,0,2,2), Board, TempMoves) :- isVacant(piecePosition(_,_,2,3), Board),
                                                                        \+isVacant(piecePosition(_,_,2,4), Board), !,
                                                                        TempMoves = [['pawn',2,2,2,3]].
                                                                           

%(3,2)
getPawnMovesForInitial(piecePosition(Piece,0,3,2), Board, TempMoves) :- \+isVacant(piecePosition(_,_,3,3), Board), !,
                                                                        TempMoves = [].

getPawnMovesForInitial(piecePosition(Piece,0,3,2), Board, TempMoves) :- isVacant(piecePosition(_,_,3,3), Board),
                                                                        isVacant(piecePosition(_,_,3,4), Board), !,
                                                                        TempMoves = [['pawn',3,2,3,3],['pawn',3,2,3,4]].
                                                                           
getPawnMovesForInitial(piecePosition(Piece,0,3,2), Board, TempMoves) :- isVacant(piecePosition(_,_,3,3), Board),
                                                                        \+isVacant(piecePosition(_,_,3,4), Board), !,
                                                                        TempMoves = [['pawn',3,2,3,3]].
                                                                           

%(7,4)
getPawnMovesForInitial(piecePosition(Piece,0,7,4), Board, TempMoves) :- \+isVacant(piecePosition(_,_,7,5), Board), !,
                                                                        TempMoves = [].

getPawnMovesForInitial(piecePosition(Piece,0,7,4), Board, TempMoves) :- isVacant(piecePosition(_,_,7,5), Board),
                                                                        isVacant(piecePosition(_,_,7,6), Board), !,
                                                                        TempMoves = [['pawn',7,4,7,5],['pawn',7,4,7,6]].
                                                                           
getPawnMovesForInitial(piecePosition(Piece,0,7,5), Board, TempMoves) :- isVacant(piecePosition(_,_,7,5), Board),
                                                                        \+isVacant(piecePosition(_,_,7,5), Board), !,
                                                                        TempMoves = [['pawn',7,4,7,5]].
                                                                           
%(8,5)

getPawnMovesForInitial(piecePosition(Piece,0,8,5), Board, TempMoves) :- \+isVacant(piecePosition(_,_,8,6), Board), !,
                                                                        TempMoves = [].

getPawnMovesForInitial(piecePosition(Piece,0,8,5), Board, TempMoves) :- isVacant(piecePosition(_,_,8,6), Board),
                                                                        isVacant(piecePosition(_,_,8,7), Board), !,
                                                                        TempMoves = [['pawn',8,5,8,6],['pawn',8,5,8,7]].
                                                                           
getPawnMovesForInitial(piecePosition(Piece,0,2,2), Board, TempMoves) :- isVacant(piecePosition(_,_,8,6), Board),
                                                                        \+isVacant(piecePosition(_,_,8,7), Board), !,
                                                                        TempMoves = [['pawn',8,5,8,6]].
                                                                        
% Opponent's pieces                                                                        
%(2,6)
getPawnMovesForInitial(piecePosition(Piece,1,2,6), Board, TempMoves) :- \+isVacant(piecePosition(_,_,2,5), Board), !,
                                                                        TempMoves = [].

getPawnMovesForInitial(piecePosition(Piece,1,2,6), Board, TempMoves) :- isVacant(piecePosition(_,_,2,5), Board),
                                                                        isVacant(piecePosition(_,_,2,4), Board), !,
                                                                        TempMoves = [['pawn',2,6,2,5],['pawn',2,6,2,4]].
                                                                           
getPawnMovesForInitial(piecePosition(Piece,1,2,6), Board, TempMoves) :- isVacant(piecePosition(_,_,2,5), Board),
                                                                        \+isVacant(piecePosition(_,_,2,4), Board), !,
                                                                        TempMoves = [['pawn',2,6,2,5]].
                                                                           
%(3,7)

getPawnMovesForInitial(piecePosition(Piece,1,3,7), Board, TempMoves) :- \+isVacant(piecePosition(_,_,3,6), Board), !,
                                                                        TempMoves = [].

getPawnMovesForInitial(piecePosition(Piece,1,3,7), Board, TempMoves) :- isVacant(piecePosition(_,_,3,6), Board),
                                                                        isVacant(piecePosition(_,_,3,5) !,
                                                                        TempMoves = [['pawn',3,7,3,6],['pawn',3,7,3,5]].
                                                                           
getPawnMovesForInitial(piecePosition(Piece,1,3,7), Board, TempMoves) :- isVacant(piecePosition(_,_,3,6), Board),
                                                                        \+isVacant(piecePosition(_,_,3,5) !,
                                                                        TempMoves = [['pawn',3,7,3,6]].
                                                                           
%(7,9)

getPawnMovesForInitial(piecePosition(Piece,1,7,9), Board, TempMoves) :- \+isVacant(piecePosition(_,_,7,8), Board), !,
                                                                        TempMoves = [].

getPawnMovesForInitial(piecePosition(Piece,1,7,9), Board, TempMoves) :- isVacant(piecePosition(_,_,7,8), Board),
                                                                        isVacant(piecePosition(_,_,7,7), Board), !,
                                                                        TempMoves = [['pawn',7,9,7,8],['pawn',7,9,7,7]].
                                                                           
getPawnMovesForInitial(piecePosition(Piece,1,7,9), Board, TempMoves) :- isVacant(piecePosition(_,_,7,8), Board),
                                                                        \+isVacant(piecePosition(_,_,7,7), Board), !,
                                                                        TempMoves = [['pawn',7,9,7,8]].

%(8,9)

getPawnMovesForInitial(piecePosition(Piece,1,8,9), Board, TempMoves) :- \+isVacant(piecePosition(_,_,8,8), Board), !,
                                                                        TempMoves = [].

getPawnMovesForInitial(piecePosition(Piece,1,8,9), Board, TempMoves) :- isVacant(piecePosition(_,_,8,8), Board),
                                                                        isVacant(piecePosition(_,_,8,7), Board), !,
                                                                        TempMoves = [['pawn',8,9,8,8],['pawn',8,9,8,7]].
                                                                           
getPawnMovesForInitial(piecePosition(Piece,1,8,9), Board, TempMoves) :- isVacant(piecePosition(_,_,8,8), Board),
                                                                        \+isVacant(piecePosition(_,_,8,7), Board), !,
                                                                        TempMoves = [['pawn',8,9,8,8]].

/* Triple move possibilities */

%(4,2)
getPawnMovesForInitial(piecePosition(Piece,0,4,2), Board, TempMoves) :- \+isVacant(piecePosition(_,_,4,3), Board), !,
                                                                        TempMoves = [].

getPawnMovesForInitial(piecePosition(Piece,0,4,2), Board, TempMoves) :- isVacant(piecePosition(_,_,4,3), Board),
                                                                        \+isVacant(piecePosition(_,_,4,4), Board), !,
                                                                        TempMoves = [['pawn',4,2,4,3]].
                                                                           
getPawnMovesForInitial(piecePosition(Piece,0,4,2), Board, TempMoves) :- isVacant(piecePosition(_,_,4,3), Board),
                                                                        isVacant(piecePosition(_,_,4,4), Board),
                                                                        \+isVacant(piecePosition(_,_,4,5)), !,
                                                                        TempMoves = [['pawn',4,2,4,3],['pawn',4,2,4,4]].

getPawnMovesForInitial(piecePosition(Piece,0,4,2), Board, TempMoves) :- isVacant(piecePosition(_,_,4,3), Board),
                                                                        isVacant(piecePosition(_,_,4,4), Board),
                                                                        isVacant(piecePosition(_,_,4,5)), !,
                                                                        TempMoves = [['pawn',4,2,4,3],['pawn',4,2,4,4],['pawn',4,2,4,5]].


%(5,2)
getPawnMovesForInitial(piecePosition(Piece,0,5,2), Board, TempMoves) :- \+isVacant(piecePosition(_,_,5,3), Board), !,
                                                                        TempMoves = [].

getPawnMovesForInitial(piecePosition(Piece,0,5,2), Board, TempMoves) :- isVacant(piecePosition(_,_,5,3), Board),
                                                                        \+isVacant(piecePosition(_,_,5,4), Board), !,
                                                                        TempMoves = [['pawn',5,2,5,3]].
                                                                           
getPawnMovesForInitial(piecePosition(Piece,0,5,2), Board, TempMoves) :- isVacant(piecePosition(_,_,5,3), Board),
                                                                        isVacant(piecePosition(_,_,5,4), Board),
                                                                        \+isVacant(piecePosition(_,_,5,5)), !,
                                                                        TempMoves = [['pawn',5,2,5,3],['pawn',5,2,5,4]].

getPawnMovesForInitial(piecePosition(Piece,0,5,2), Board, TempMoves) :- isVacant(piecePosition(_,_,5,3), Board),
                                                                        isVacant(piecePosition(_,_,5,4), Board),
                                                                        isVacant(piecePosition(_,_,5,5)), !,
                                                                        TempMoves = [['pawn',5,2,5,3],['pawn',5,2,5,4],['pawn',5,2,5,5]].


%(6,3)
getPawnMovesForInitial(piecePosition(Piece,0,6,3), Board, TempMoves) :- \+isVacant(piecePosition(_,_,6,4), Board), !,
                                                                        TempMoves = [].

getPawnMovesForInitial(piecePosition(Piece,0,6,3), Board, TempMoves) :- isVacant(piecePosition(_,_,6,4), Board),
                                                                        \+isVacant(piecePosition(_,_,6,5), Board), !,
                                                                        TempMoves = [['pawn',6,3,6,4]].
                                                                           
getPawnMovesForInitial(piecePosition(Piece,0,6,3), Board, TempMoves) :- isVacant(piecePosition(_,_,6,4), Board),
                                                                        isVacant(piecePosition(_,_,6,5), Board),
                                                                        \+isVacant(piecePosition(_,_,6,6)), !,
                                                                        TempMoves = [['pawn',6,3,6,4],['pawn',6,3,6,5]].

getPawnMovesForInitial(piecePosition(Piece,0,6,3), Board, TempMoves) :- isVacant(piecePosition(_,_,6,4), Board),
                                                                        isVacant(piecePosition(_,_,6,5), Board),
                                                                        isVacant(piecePosition(_,_,6,6)), !,
                                                                        TempMoves = [['pawn',6,3,6,4],['pawn',6,3,6,5],['pawn',6,3,6,6]].



%(4,8)
getPawnMovesForInitial(piecePosition(Piece,1,4,8), Board, TempMoves) :- \+isVacant(piecePosition(_,_,4,7), Board), !,
                                                                        TempMoves = [].

getPawnMovesForInitial(piecePosition(Piece,1,4,8), Board, TempMoves) :- isVacant(piecePosition(_,_,4,7), Board),
                                                                        \+isVacant(piecePosition(_,_,4,6), Board), !,
                                                                        TempMoves = [['pawn',4,8,4,7]].
                                                                           
getPawnMovesForInitial(piecePosition(Piece,1,4,8), Board, TempMoves) :- isVacant(piecePosition(_,_,4,7), Board),
                                                                        isVacant(piecePosition(_,_,4,6), Board),
                                                                        \+isVacant(piecePosition(_,_,4,5)), !,
                                                                        TempMoves = [['pawn',4,8,4,7],['pawn',4,8,4,6]].

getPawnMovesForInitial(piecePosition(Piece,1,4,8), Board, TempMoves) :- isVacant(piecePosition(_,_,4,7), Board),
                                                                        isVacant(piecePosition(_,_,4,6), Board),
                                                                        isVacant(piecePosition(_,_,4,5)), !,
                                                                        TempMoves = [['pawn',4,8,4,7],['pawn',4,8,4,6],['pawn',4,8,4,5]].

%(5,9)
getPawnMovesForInitial(piecePosition(Piece,1,5,9), Board, TempMoves) :- \+isVacant(piecePosition(_,_,5,8), Board), !,
                                                                        TempMoves = [].

getPawnMovesForInitial(piecePosition(Piece,1,5,9), Board, TempMoves) :- isVacant(piecePosition(_,_,5,8), Board),
                                                                        \+isVacant(piecePosition(_,_,5,7), Board), !,
                                                                        TempMoves = [['pawn',5,9,5,8]].
                                                                           
getPawnMovesForInitial(piecePosition(Piece,1,5,9), Board, TempMoves) :- isVacant(piecePosition(_,_,5,8), Board),
                                                                        isVacant(piecePosition(_,_,5,7), Board),
                                                                        \+isVacant(piecePosition(_,_,5,6)), !,
                                                                        TempMoves = [['pawn',5,9,5,8],['pawn',5,9,5,7]].

getPawnMovesForInitial(piecePosition(Piece,1,5,9), Board, TempMoves) :- isVacant(piecePosition(_,_,5,8), Board),
                                                                        isVacant(piecePosition(_,_,5,7), Board),
                                                                        isVacant(piecePosition(_,_,5,6)), !,
                                                                        TempMoves = [['pawn',5,9,5,8],['pawn',5,9,5,7],['pawn',5,9,5,6]].

%(6,9)
getPawnMovesForInitial(piecePosition(Piece,1,6,9), Board, TempMoves) :- \+isVacant(piecePosition(_,_,6,8), Board), !,
                                                                        TempMoves = [].

getPawnMovesForInitial(piecePosition(Piece,1,6,9), Board, TempMoves) :- isVacant(piecePosition(_,_,6,8), Board),
                                                                        \+isVacant(piecePosition(_,_,6,7), Board), !,
                                                                        TempMoves = [['pawn',6,9,6,8]].
                                                                           
getPawnMovesForInitial(piecePosition(Piece,1,6,9), Board, TempMoves) :- isVacant(piecePosition(_,_,6,8), Board),
                                                                        isVacant(piecePosition(_,_,6,7), Board),
                                                                        \+isVacant(piecePosition(_,_,6,6)), !,
                                                                        TempMoves = [['pawn',6,9,6,8],['pawn',6,9,6,7]].

getPawnMovesForInitial(piecePosition(Piece,1,6,9), Board, TempMoves) :- isVacant(piecePosition(_,_,6,8), Board),
                                                                        isVacant(piecePosition(_,_,6,7), Board),
                                                                        isVacant(piecePosition(_,_,6,6)), !,
                                                                        TempMoves = [['pawn',6,9,6,8],['pawn',6,9,6,7],['pawn',6,9,6,6]].

/* Moves for pawn if they are not in their initial positions */
getPawnMovesForOtherPosition(piecePosition(Piece,0,X,Y), Board, TempMoves) :- X1 is X, 
                                                                              Y1 is Y+1, 
                                                                              isWithinBoard(X1,Y1),
                                                                              isVacant(piecePosition(_,_,X1,Y1), Board), 
                                                                              TempMoves = [['pawn',X,Y,X1,Y1]].

getPawnMovesForOtherPosition(piecePosition(Piece,1,X,Y), Board, TempMoves) :- X1 is X, 
                                                                              Y1 is Y-1, 
                                                                              isWithinBoard(X1,Y1),
                                                                              isVacant(piecePosition(_,_,X1,Y1), Board), 
                                                                              TempMoves = [['pawn',X,Y,X1,Y1]].

/* Attacking positions */
%For Human
addPawnAttackMoves(piecePosition(Piece,0,X,Y), Board, TempMoves, Moves):-
                                                              X1 is X+1, 
                                                              Y1 is Y+1,
                                                              X2 is X-1, 
                                                              Y2 is Y,
                                                              isWithinBoard(X1,Y1),
                                                              isWithinBoard(X2,Y2),
                                                              member(piecePosition(_,1,X1,Y1),Board),
                                                              member(piecePosition(_,1,X2,Y2),Board),
                                                              append([['pawn',X,Y,X1,Y1],['pawn',X,Y,X2,Y2]], TempMoves, Moves).
                                                                                           

addPawnAttackMoves(piecePosition(Piece,0,X,Y), Board, TempMoves, Moves):-
                                                              X1 is X+1, 
                                                              Y1 is Y+1,
                                                              X2 is X-1, 
                                                              Y2 is Y,
                                                              isWithinBoard(X1,Y1),
                                                              member(piecePosition(_,1,X1,Y1),Board),
                                                              \+member(piecePosition(_,1,X2,Y2),Board),
                                                              Moves = [['pawn',X,Y,X1,Y1]|TempMoves].

addPawnAttackMoves(piecePosition(Piece,0,X,Y), Board, TempMoves, Moves):-
                                                              X1 is X+1, 
                                                              Y1 is Y+1,
                                                              X2 is X-1, 
                                                              Y2 is Y,
                                                              isWithinBoard(X2,Y2),
                                                              \+member(piecePosition(_,1,X1,Y1),Board),
                                                              member(piecePosition(_,1,X2,Y2),Board),
                                                              Moves = [['pawn',X,Y,X2,Y2]|TempMoves].     
addPawnAttackMoves(piecePosition(Piece,0,X,Y), Board, TempMoves, TempMoves):-
                                                              X1 is X+1, 
                                                              Y1 is Y+1,
                                                              X2 is X-1, 
                                                              Y2 is Y,
                                                              \+member(piecePosition(_,1,X1,Y1),Board),
                                                              \+member(piecePosition(_,1,X2,Y2),Board).
                                                           
                                                                               
%For opponenent :

addPawnAttackMoves(piecePosition(Piece,1,X,Y), Board, TempMoves, Moves):-
                                                              X1 is X+1, 
                                                              Y1 is Y,
                                                              X2 is X-1, 
                                                              Y2 is Y-1,
                                                              isWithinBoard(X1,Y1),
                                                              isWithinBoard(X2,Y2),
                                                              member(piecePosition(_,0,X1,Y1),Board),
                                                              member(piecePosition(_,0,X2,Y2),Board),
                                                              append([['pawn',X,Y,X1,Y1],['pawn',X,Y,X2,Y2]], TempMoves, Moves).
                                                                                           

addPawnAttackMoves(piecePosition(Piece,1,X,Y), Board, TempMoves, Moves):-
                                                              X1 is X+1, 
                                                              Y1 is Y,
                                                              X2 is X-1, 
                                                              Y2 is Y-1,
                                                              isWithinBoard(X1,Y1),
                                                              member(piecePosition(_,0,X1,Y1),Board),
                                                              \+member(piecePosition(_,0,X2,Y2),Board),
                                                              Moves = [['pawn',X,Y,X1,Y1]|TempMoves].

addPawnAttackMoves(piecePosition(Piece,1,X,Y), Board, TempMoves, Moves):-
                                                              X1 is X+1, 
                                                              Y1 is Y,
                                                              X2 is X-1, 
                                                              Y2 is Y-1,
                                                              isWithinBoard(X2,Y2),
                                                              \+member(piecePosition(_,0,X1,Y1),Board),
                                                              member(piecePosition(_,0,X2,Y2),Board),
                                                              Moves = [['pawn',X,Y,X2,Y2]|TempMoves]. 
                                                                  
addPawnAttackMoves(piecePosition(Piece,1,X,Y), Board, TempMoves, TempMoves):-
                                                              X1 is X+1, 
                                                              Y1 is Y+1,
                                                              X2 is X-1, 
                                                              Y2 is Y,
                                                              \+member(piecePosition(_,0,X1,Y1),Board),
                                                              \+member(piecePosition(_,0,X2,Y2),Board).

/* PAWN MOVES END HERE */
/*====================================================================================================================*/


/*====================================================================================================================*/
/* ROOK MOVES START HERE */
getRookMoves(piecePosition(Piece,Turn,F,R), Board, Moves):-  
                                                    Curr=[Piece,Turn,F,R],
													PosI = [Piece,Turn,F,R],
													getRookMovesInDirection1(Curr, [],Board,TempMoves1,PosI),
													getRookMovesInDirection2(Curr, TempMoves1,Board,TempMoves2,PosI),
													getRookMovesInDirection3(Curr, TempMoves2,Board,TempMoves3,PosI),
													getRookMovesInDirection4(Curr, TempMoves3,Board,TempMoves4,PosI),
													getRookMovesInDirection5(Curr, TempMoves4,Board,TempMoves5,PosI),
													getRookMovesInDirection6(Curr, TempMoves5,Board,Moves,PosI).

%% Along positive y axis
getRookMovesInDirection1([],Moves,Board,Moves,PosI).						
getRookMovesInDirection1( H, M,Board,Moves,PosI):- 
                                H = [Piece,Turn,F,R],
								R1 is R+1,
								\+member(piecePosition(_,_,F,R1),Board),
								inboard(F,R1),!,
								PosI = [_,Turn,A,B],
								getRookMovesInDirection1([Piece,Turn,F,R1],[[Piece,A,B,F,R1]| M ], Board, Moves,PosI).

getRookMovesInDirection1( H, M,Board,Moves,PosI):- 	
                                H = [Piece,Turn,F,R],
								R1 is R+1,
								inboard(F,R1),
								switch(Turn,OpponentTurn),
								member(piecePosition(_,OpponentTurn,F,R1),Board),!,
								PosI = [_,Turn,A,B],
								Moves = [[Piece,A,B,F,R1]|M];
								Moves = M.
								


%% negative y axis
getRookMovesInDirection2([],Moves,Board,Moves,PosI).						
getRookMovesInDirection2( H, M,Board,Moves,PosI):- 
                                H = [Piece,Turn,F,R],
								R1 is R-1,
								\+member(piecePosition(_,_,F,R1),Board),
								inboard(F,R1),!,
								PosI = [_,Turn,A,B],
								getRookMovesInDirection2([Piece,Turn,F,R1],[[Piece,A,B,F,R1]| M ], Board, Moves,PosI).

getRookMovesInDirection2( H, M,Board,Moves,PosI):- 	
                                H = [Piece,Turn,F,R],
								R1 is R-1,
								inboard(F,R1),
								switch(Turn,OpponentTurn),
								member( piecePosition(_,OpponentTurn,F,R1), Board),!,
								PosI = [_,Turn,A,B],
								Moves = [[Piece,A,B,F,R1]|M];
								Moves = M.


%% 2nd quadrant
getRookMovesInDirection3([],Moves,Board,Moves,PosI).						
getRookMovesInDirection3( H, M,Board,Moves,PosI):- 
                                H = [Piece,Turn,F,R],
								F1 is F-1,
								\+member(piecePosition(_,_,F1,R),Board),
								inboard(F1,R),!,
								PosI = [_,Turn,A,B],
								getRookMovesInDirection3([Piece,Turn,F1,R],[[Piece,A,B,F1,R]| M ], Board, Moves,PosI).

getRookMovesInDirection3( H, M,Board,Moves,PosI):- 	
                                H = [Piece,Turn,F,R],
								F1 is F-1,
								inboard(F1,R),
								switch(Turn,OpponentTurn),
								member( piecePosition(_,OpponentTurn,F1,R), Board),!,
								PosI = [_,Turn,A,B],
								Moves = [[Piece,A,B,F1,R]|M];
								Moves = M.
								


%% 4th quadrant
getRookMovesInDirection4([],Moves,Board,Moves,PosI).						
getRookMovesInDirection4( H, M,Board,Moves,PosI):- 
                                H = [Piece,Turn,F,R],
								F1 is F+1,
								\+member(piecePosition(_,_,F1,R),Board),
								inboard(F1,R),!,
								PosI = [_,Turn,A,B],
								getRookMovesInDirection4([Piece,Turn,F1,R],[[Piece,A,B,F1,R]| M ], Board, Moves,PosI).

getRookMovesInDirection4( H ,M,Board,Moves,PosI):- 	
                                H = [Piece,Turn,F,R],
								F1 is F+1,
								inboard(F1,R),
								switch(Turn,OpponentTurn),
								member( piecePosition(_,OpponentTurn,F1,R), Board),!,
								PosI = [_,Turn,A,B],
								Moves = [[Piece,A,B,F1,R]|M];
								Moves = M.


%% 	y=x (3rd quad)		
getRookMovesInDirection5([],Moves,Board,Moves).						
getRookMovesInDirection5( H, M,Board,Moves,PosI):- H = [Piece,Turn,F,R],
								R1 is R-1,
								F1 is F-1,
								\+member(piecePosition(_,_,F1,R1),Board),
								inboard(F1,R1),!,
								PosI = [_,Turn,A,B],
								getRookMovesInDirection5([Piece,Turn,F1,R1],[[Piece,A,B,F1,R1]| M ], Board, Moves,PosI).


getRookMovesInDirection5( H, M,Board,Moves,PosI):- 	H = [Piece,Turn,F,R],
								R1 is R-1,
								F1 is F-1,
								inboard(F1,R1),
								switch(Turn,OpponentTurn),
								member( piecePosition(_,OpponentTurn,F1,R1), Board),!,
								PosI = [_,Turn,A,B],
								Moves = [[Piece,A,B,F1,R1]|M];
								Moves = M.

%% y = x (1st quad)
getRookMovesInDirection6([],Moves,Board,Moves,PosI).						
getRookMovesInDirection6( H, M,Board,Moves,PosI):- 
                                H = [Piece,Turn,F,R],
								R1 is R+1,
								F1 is F+1,
								\+member(piecePosition(_,_,F1,R1),Board),
								inboard(F1,R1),!,
								PosI = [_,Turn,A,B],
								getRookMovesInDirection6([Piece,Turn,F1,R1],[[Piece,A,B,F1,R1]| M ], Board, Moves,PosI).

getRookMovesInDirection6( H, M,Board,Moves,PosI):- 	
                                H = [Piece,Turn,F,R],
								R1 is R+1,
								F1 is F+1,
								inboard(F1,R1),
								switch(Turn,OpponentTurn),
								member( piecePosition(_,OpponentTurn,F1,R1), Board),!,
								PosI = [_,Turn,A,B],
								Moves = [[Piece,A,B,F1,R1]|M];
								Moves = M.
/* ROOK MOVES END HERE */
/*====================================================================================================================*/

/*====================================================================================================================*/
/* BISHOP MOVES START HERE */

getBishopMoves(piecePosition(Piece,Turn,F,R), Board, Moves):-  Curr=[Piece,Turn,F,R],
													PosI = [Piece,Turn,F,R],
													getBishopMovesInDirection(Curr, [],Board,Moves1,PosI,1,2),
													getBishopMovesInDirection(Curr, Moves1,Board,Moves2,PosI,-1,-2),
													getBishopMovesInDirection(Curr, Moves2,Board,Moves3,PosI,-1,1),
													getBishopMovesInDirection(Curr, Moves3,Board,Moves4,PosI,1,-1),
													getBishopMovesInDirection(Curr, Moves4,Board,Moves5,PosI,2,1),
													getBishopMovesInDirection(Curr, Moves5,Board,Moves,PosI,-2,-1).

getBishopMovesInDirection([],Moves,Board,Moves,PosI,A1,B1).						
getBishopMovesInDirection( H, M,Board,Moves,PosI,A1,B1):- H = [Piece,Turn,F,R],
								R1 is R+B1,
								F1 is F+A1,
								\+member(piecePosition(_,_,F1,R1),Board),
								inboard(F1,R1),!,
								PosI = [_,Turn,A,B],
								getBishopMovesInDirection1([Piece,Turn,F1,R1],[[Piece,A,B,F1,R1]| M ], Board, Moves,PosI).

getBishopMovesInDirection( H, M,Board,Moves,PosI,A1,B1):- 	H = [Piece,Turn,F,R],
								R1 is R+B1,
								F1 is F+A1,
								inboard(F1,R1),
								switch(Turn,OpponentTurn),
								member(piecePosition(_,OpponentTurn,F1,R1),Board),!,
								PosI = [_,Turn,A,B],
								Moves = [[Piece,A,B,F1,R1]|M];
								Moves = M.
								




/* BISHOP MOVES END HERE */
/*====================================================================================================================*/

/*====================================================================================================================*/
/* KNIGHT MOVES START HERE */
getKnightMoves(piecePosition(Piece,Turn,F,R), Board, Moves):-  Curr=[Piece,Turn,F,R],
													PosI = [Piece,Turn,F,R],
																getKnightMovesInDirection(Curr, [],Board,Moves1,PosI,1,3),
																getKnightMovesInDirection(Curr, Moves1,Board,Moves2,PosI,-1,2),
																getKnightMovesInDirection(Curr, Moves2,Board,Moves3,PosI,2,3),
																getKnightMovesInDirection(Curr, Moves3,Board,Moves4,PosI,3,2),
																getKnightMovesInDirection(Curr, Moves4,Board,Moves5,PosI,2,-1),
																getKnightMovesInDirection(Curr, Moves5,Board,Moves6,PosI,3,1),
																getKnightMovesInDirection(Curr, Moves6,Board,Moves7,PosI,1,-2),
																getKnightMovesInDirection(Curr, Moves7,Board,Moves8,PosI,-1,-3),
																getKnightMovesInDirection(Curr, Moves8,Board,Moves9,PosI,-3,-2),
																getKnightMovesInDirection(Curr,Moves9,Board,Moves10,PosI,-2,-3),
																getKnightMovesInDirection(Curr, Moves10,Board,Moves11,PosI,-2,1),
																getKnightMovesInDirection(Curr, Moves11,Board,Moves,PosI,-3,-1).

%% 1st quad
getKnightMovesInDirection([],Moves,Board,Moves,PosI,A,B).						
getKnightMovesInDirection( H, M,Board,Moves,PosI,A1,B1):- H = [Piece,Turn,F,R],
								R1 is R+B1,
								F1 is F+A1,
								\+member(piecePosition(_,_,F1,R1),Board),
								inboard(F1,R1),!,
								PosI = [_,Turn,A,B],
								Moves = [[Piece,A,B,F1,R1]|M].

getKnightMovesInDirection( H, M,Board,Moves,PosI,A1,B1):- 	H = [Piece,Turn,F,R],
								R1 is R+B1,
								F1 is F+A1,
								inboard(F1,R1),
								switch(Turn,OpponentTurn),
								member(piecePosition(_,OpponentTurn,F1,R1),Board),!,
								PosI = [_,Turn,A,B],
								Moves = [[Piece,A,B,F1,R1]|M];
								Moves = M.
/* KNIGHT MOVES END HERE */
/*====================================================================================================================*/

/* Checks if the position X,Y on the board is vacant */
isVacant(piecePosition(_,_,X,Y), Board) :- \+member(piecePosition(_,_,X,Y), Board).

/* Checks if the given position is a valid position on the Board */
isWithinBoard(X,R) :- inBoard(X,R).
					
inboard(1,R):-	R> 0,
				R< 7.
inboard(2,R):-	R> 0,
				R< 8.
inboard(3,R):-	R> 0,
				R< 9.
inboard(4,R):-	R> 0,
				R< 10.
inboard(5,R):-	R> 0,
				R< 11.
inboard(6,R):-	R> 1,
				R< 11.
inboard(7,R):-	R> 2,
				R< 11.
inboard(8,R):-	R> 3,
				R< 11.
inboard(9,R):-	R> 4,
				R< 11.                                                                                                                        
