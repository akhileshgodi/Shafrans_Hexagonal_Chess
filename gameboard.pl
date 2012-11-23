start :- startHelper(_).

/* Starts the game */
startHelper(Board) :- initialize(Board),
                      printboard(Board),
                      startPlay(Board).
                       
/* Helper function that will take input from the user as to who starts first and then continues */

startPlay(Board) :- nl,write('Enter 0 if you want to start playing, enter 1 if you want the computer to start first\n'),
                    read(Turn),!,nl,
                    play(Turn, Board).


/* Initializing the board */                     
initialize( [
            piecePosition('pawn', 0, 1, 2),
		    piecePosition('pawn', 0, 2, 2),
		    piecePosition('pawn', 0, 3, 2),
		    piecePosition('pawn', 0, 4, 2),
			piecePosition('pawn', 0, 5, 2),
			piecePosition('pawn', 0, 6, 3),
			piecePosition('pawn', 0, 7, 4),
			piecePosition('pawn', 0, 8, 5),
			piecePosition('pawn', 0, 9, 6),

		    piecePosition('rook', 0, 9, 5),
		    piecePosition('rook', 0, 1, 1),

		    piecePosition('knight', 0, 2, 1),
		    piecePosition('knight', 0, 7, 3),
		
		    piecePosition('bishop', 0, 3, 1),
		    piecePosition('bishop', 0, 6, 2),
		    piecePosition('bishop', 0, 8, 4),
		
		    piecePosition('king', 0, 5, 1),
		    piecePosition('queen', 0, 4, 1),
		
		    piecePosition('pawn', 1 , 1, 5),
		    piecePosition('pawn', 1 , 2, 6),
		    piecePosition('pawn', 1 , 3, 7),
		    piecePosition('pawn', 1 , 4, 8),
		    piecePosition('pawn', 1 , 5, 9),
		    piecePosition('pawn', 1 , 6, 9),
		    piecePosition('pawn', 1 , 7, 9),
		    piecePosition('pawn', 1 , 8, 9),
		    piecePosition('pawn', 1 , 9, 9),
		
		    piecePosition('rook', 1 , 1, 6),
		    piecePosition('rook', 1 , 9, 10),
		
		    piecePosition('bishop', 1 , 2, 7),
		    piecePosition('bishop', 1 , 4, 9),
		    piecePosition('bishop', 1 , 7, 10),
		
		    piecePosition('knight', 1 , 3, 8),
		    piecePosition('knight', 1 , 8, 10),
		
		    piecePosition('king', 1 , 5, 10),
		    piecePosition('queen', 1 , 6, 10)
			]). 

/* Puts the piece X of Colour Y in position (Z,W) if the predicate is piecePosition(X,Y,Z,W). */
piecePosition(_,_,_,_).                         

/* This function starts the play */
play(Turn, Board) :- checkGameOver(Turn, Board).

play(Turn, Board) :- switch(Turn, OpponentTurn),
                     checkGameOver(OpponentTurn, Board).

play(Turn, Board) :- getMove(Turn, Board, Move),!,
                     isValid(Turn, Move, Board),
                     makeMove(Board, Move, Turn, ChangedBoard),
                     write(Move),nl,
                     printboard(ChangedBoard),nl,nl,
                     switch(Turn, OpponentTurn),!,
                     play(OpponentTurn,ChangedBoard).

play(Turn, Board)	:- write('INVALID Move. Play again.'),nl,
	                   play(Turn,Board).


getMove(0, _, Move) :- read(Move),nl,nl,write('Move made by you was ').
getMove(1, Board, Move) :- %getValidMoves(1,Board,Moves,Board),nl,
                           %Moves = [X,Y,Move|_],nl,nl,
                           alpha_beta(1,1,-10000000,10000000,Move,Value,Board),!,
                           write(Move),nl,
                           %evaluate
                           write('Computer made the move ').

getValidMoves(Turn, [], [],ActualBoard).
getValidMoves(Turn, Board, Moves,ActualBoard) :- Board = [PieceProps|Rest],
                                     PieceProps=piecePosition(Piece,Turn,X,Y),
                                     getMoves(piecePosition(Piece,Turn,X,Y),Moves1,ActualBoard),
                                     getValidMoves(Turn, Rest, ResultMoves,ActualBoard), 
                                     append(Moves1,ResultMoves,Moves).
                                     

getValidMoves(Turn, Board, Moves,ActualBoard) :- Board = [PieceProps|Rest],
                                     getValidMoves(Turn, Rest, Moves, ActualBoard).
                                                                          
/* Switches whose turn it is to play */                                     
switch(Turn,OpponentTurn) :- OpponentTurn is 1-Turn.

/* Checks if game is over */
checkGameOver(0, Board) :- \+member(piecePosition('king',1,_,_),Board),!,write('Human won the game'),nl.
checkGameOver(1, Board) :- \+member(piecePosition('king',0,_,_),Board),!,write('Computer won the game'),nl.

/* Function to check if the given move is valid */
isValid(Turn,Move,Board) :-  Move=[Piece,X1,Y1,X2,Y2],
                             member(piecePosition(Piece,Turn,X1,Y1),Board),
                             getMoves(piecePosition(Piece,Turn,X1,Y1),Moves,Board),
                             member([Piece,X1,Y1,X2,Y2],Moves).
                            
/* Function that will actually change the move and update the board */
makeMove(Board, Move, Turn, ChangedBoard) :-  Move = [Piece,X1,Y1,X2,Y2],!,
                                        removeFromBoard(Board, piecePosition(_,_,X1,Y1), TempBoard),
                                        removeFromBoard(TempBoard, piecePosition(_,_,X2,Y2), TempBoard2),
                                        ChangedBoard = [piecePosition(Piece,Turn,X2,Y2)|TempBoard2].

/* 
 *Removes a piece from a board if the present move kills opponents piece, else, it just returns the Board
 */                                        
removeFromBoard(Board, A, Board) :- \+member(A,Board).
removeFromBoard([A|Board], A, Board).
removeFromBoard([B, C|D], A, [B|E]) :- removeFromBoard([C|D],A,E).

                                  
/* Function to get moves based on which piece on the board it is */
                                      
getMoves(piecePosition(_,_,_,_),[],[]).
getMoves(piecePosition(Piece,Turn,X,Y),Moves,Board)	:-  Piece = 'pawn',!,
                                                        getPawnMoves(piecePosition(Piece,Turn,X,Y),Board,Moves).

getMoves(piecePosition(Piece,Turn,X,Y),Moves,Board)	:-  Piece = 'rook',!,
                                                        getRookMoves(piecePosition(Piece,Turn,X,Y),Board,Moves).
                                                        
getMoves(piecePosition(Piece,Turn,X,Y),Moves,Board)	:-  Piece = 'bishop',!,
                                                        getBishopMoves(piecePosition(Piece,Turn,X,Y),Board,Moves).
                                                        
getMoves(piecePosition(Piece,Turn,X,Y),Moves,Board)	:-  Piece = 'knight',!,
                                                        getKnightMoves(piecePosition(Piece,Turn,X,Y),Board,Moves).
                                                        
getMoves(piecePosition(Piece,Turn,X,Y),Moves,Board)	:-  Piece = 'queen',!,
                                                        getQueenMoves(piecePosition(Piece,Turn,X,Y),Board,Moves).
                                                        
getMoves(piecePosition(Piece,Turn,X,Y),Moves,Board)	:-  Piece = 'king',!,
                                                        getKingMoves(piecePosition(Piece,Turn,X,Y),Board,Moves).

getBoardValue(Board,Turn,Value) :-  Board = [piecePosition(Piece,Color,X,Y)|TempBoard],
            				        getValue(Piece, Color, X, Y,Turn,Board,Val),
            				        getBoardValue(TempBoard,Turn,Temp1),
									Value is Val + Temp1.

getBoardValue(_,_,Value) :- Value is 0.

getValue(Piece, Color, X, Y,Turn,Board,Value) :-	member(piecePosition(Piece,Color,X,Y),Board), Color = Turn,
										        Piece = 'king',Value = 10000.
										
getValue(Piece, Color, X, Y,Turn,Board,Value) :-	member(piecePosition(Piece,Color,X,Y),Board), Color = 1-Turn,
										        Piece = 'king',Value = -8000.
										
getValue(Piece, Color, X, Y,Turn,Board,Value) :-	member(piecePosition(Piece, Color, X, Y),Board), Color = Turn,
										        Piece = 'queen',Value = 5000.
										
getValue(Piece, Color, X, Y,Turn,Board,Value) :-	member(piecePosition(Piece, Color, X, Y),Board), Color = 1-Turn,
										        Piece = 'queen',Value = -2500.
										
getValue(Piece, Color, X, Y,Turn,Board,Value) :-	member(piecePosition(Piece, Color, X, Y),Board), Color = Turn,
										        Piece = 'bishop',Value = 3000.
										
getValue(Piece, Color, X, Y,Turn,Board,Value) :-	member(piecePosition(Piece, Color, X, Y),Board), Color = 1-Turn,
										        Piece = 'bishop',Value = -1500.
										
getValue(Piece, Color, X, Y,Turn,Board,Value) :-	member(piecePosition(Piece, Color, X, Y),Board), Color = Turn,
										        Piece = 'knight',Value = 2500.
										
getValue(Piece, Color, X, Y,Turn,Board,Value) :-	member(piecePosition(Piece, Color, X, Y),Board), Color = 1-Turn,
										        Piece = 'knight',Value = -1250.
										
getValue(Piece, Color, X, Y,Turn,Board,Value) :-	member(piecePosition(Piece, Color, X, Y),Board), Color = Turn,
										        Piece = 'rook',Value = 2000.
										
getValue(Piece, Color, X, Y,Turn,Board,Value) :-	member(piecePosition(Piece, Color, X, Y),Board), Color = 1-Turn,
										        Piece = 'rook',Value = -1000.
										
getValue(Piece, Color, X, Y,Turn,Board,Value) :-	member(piecePosition(Piece, Color, X, Y),Board), Color = Turn,
										        Piece = 'pawn',Value = 700.
										
getValue(Piece, Color, X, Y,Turn,Board,Value) :-	member(piecePosition(Piece, Color, X, Y),Board), Color = 1-Turn,
					                            Piece = 'pawn',Value = -350.
										                            
										                            
alpha_beta(Turn,0,_Alpha,_Beta,_NoMove,Value,Board) :- 
    getBoardValue(Board,Turn,Value).

alpha_beta(Turn,D,Alpha,Beta,Move,Value,Board) :- 
   D > 0, 
   getValidMoves(Turn,Board,Moves,Board),
   Alpha1 is -Beta, % max/min
   Beta1 is -Alpha,
   D1 is D-1,
   evaluate_and_choose(Turn,Moves,Board,D1,Alpha1,Beta1,nil,(Move,Value)),write('Got : '),write(Move),nl.

evaluate_and_choose(_Player,[],_Board,_D,Alpha,_Beta,Move,(Move,Alpha)).

evaluate_and_choose(Player,[Move|Moves],Board,D,Alpha,Beta,Record,BestMove) :-
   makeMove(Board, Move, Turn, ChangedBoard),
   switch(Player,OtherPlayer),                  
   alpha_beta(OtherPlayer,D,Alpha,Beta,_OtherMove,Value,ChangedBoard),!,
   Value1 is -Value,
   cutoff(Player,Move,Value1,D,Alpha,Beta,Moves,Board,Record,BestMove).


cutoff(_Player,Move,Value,_D,_Alpha,Beta,_Moves,_Board,_Record,(Move,Value)) :- 
   Value >= Beta, !.

cutoff(Player,Move,Value,D,Alpha,Beta,Moves,Board,_Record,BestMove) :- 
   Alpha < Value, Value < Beta, !, 
   evaluate_and_choose(Player,Moves,Board,D,Value,Beta,Move,BestMove).
cutoff(Player,Move,Value,D,Alpha,Beta,Moves,Board,Record,BestMove) :- 
   Value =< Alpha, !, 
   evaluate_and_choose(Player,Moves,Board,D,Alpha,Beta,Record,BestMove).

