start :- startHelper(_).

/* Starts the game */
startHelper(Board) :- initialize(Board),
                      printboard(Board),
                      startPlay(Board).
                       
/* Helper function that will take input from the user as to who starts first and then continues */

startPlay(Board) :- write('Enter 0 if you want to start playing, enter 1 if you want the computer to start first\n'),
                    read(Turn), write('\n'), write(Turn).
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
play(Turn, Board) :- switchTurn(Turn, OpponentTurn),
                     checkGameOver(OpponentTurn, Board),
play(Turn, Board) :- getMove(Turn, Board, Move),
                     isValid(Turn, Move, Board),
                     makeMove(Board, Move, ChangedBoard),
                     switchTurn(Turn, OpponentTurn),
                     play(OpponentTurn,Board).

play(Turn, Board)	:- write('Invalid Move. Play again:'),
	                   play(Turn,Board,Result).

getMove(0, Board, Move) :- read(Move).
getMove(1, Board, Move) :- getValidMoves(1, Board, [Move|_]).

getValidMoves(Turn, [], Moves).
getValidMoves(Turn, Board, Moves) :- Board = [PieceProps|_],
                                     PieceProps = piecePosition(Piece,Turn,X,Y),
                                     getMoves(piecePosition(Piece,Turn,X,Y), Board, Moves1),
                                     write(Moves1).
                                     append(Moves,Moves1,ResultMoves),
                                     getValidMoves(Turn, Board, ResultMoves).
                                     
/* Switches whose turn it is to play */                                     
switch(Turn,OpponentTurn) :- OpponentTurn is 1-Turn.

/* Checks if game is over */
checkGameOver(0, Board) :- \+member(piecePosition('king',Turn,_,_)),!,write('Human won the game').
checkGameOver(1, Board) :- \+member(piecePosition('king',Turn,_,_)),!,write('Computer won the game').

/* Function to check if the given move is valid */
isValid(Turn,Move,Board) :-  Move=[Piece,X1,Y1,X2,Y2],
                             member(piecePosition(Piece,Turn,X1,Y1),Board),
                             getMoves(piecePosition(Piece,Turn,X1,Y1),Board,Moves),
                             member([Piece,X1,Y1,X2,Y2],Moves).
                            
/* Function that will actually change the move and update the board */
makeMove(Board, Move, ChangedBoard) :-  Move = [Piece,X1,Y1,X2,Y2],!,
                                        removeFromBoard(Board, piecePosition(_,_,X1,Y1), TempBoard),
                                        ChangedBoard = [piecePosition(Piece,Turn,X1,Y1)|TempBoard].

/* 
 *Removes a piece from a board if the present move kills opponents piece, else, it just returns the Board
 */                                        
removeFromBoard(Board, A, Board) :- \+member(A,Board).
removeFromBoard([A|Board], A, Board).
removeFromBoard([B, C|D], A, [B|E]) :- removeFromBoard([C|D],A,E).

                                  
/* Function to get moves based on which piece on the board it is */
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
