cursor(X,Y) :-     put(27), 
                   put(91),
	               write(Y),
				    put(59),         
					write(X),
					put(72).     

printboard(Board) :-   	format('~c~s~c~s', [0x1b, "[H", 0x1b, "[2J"]),
					writeline1(Board),
					writeline2(Board),
					writeline3(Board),
					writeline4(Board),
					writeline5(Board),
					writeline6(Board),
					writeline7(Board),
					writeline8(Board),
					writeline9(Board),
					writeline10(Board),
					writeline11(Board),
					writeline12(Board),
					writeline13(Board),
					writeline14(Board),
					writeline15(Board),
					writeline16(Board),
					writeline17(Board),
					writeline18(Board),
					writeline19(Board),
					writeline20(Board),
					writeline21(Board),
					writeline22(Board),cursor(55,28).

writeline1(Board)   :-		cursor(48,2),write('10____').

writeline2(Board)	:-		cursor(44,3),write('9____/ '),getPos(5,10,Board),write(' \\____').

writeline3(Board)	:-		cursor(39,4),write('8____/ '),getPos(4,9,Board),write(' \\____/ '),
							getPos(6,10,Board),write(' \\____').

						
writeline4(Board)	:-		cursor(34,5),write('7____/ '),getPos(3,8,Board),write(' \\____/ '),getPos(5,9,Board),write(' \\____/ '),
							getPos(7,10,Board),write(' \\____').

writeline5(Board)	:-		cursor(30,6),write('____/ '),getPos(2,7,Board),write(' \\____/ '),getPos(4,8,Board),write(' \\____/ '),
							getPos(6,9,Board),write(' \\____/ '),getPos(8,10,Board),write(' \\____').


writeline6(Board)	:-		cursor(28,7),write('6/ '),getPos(1,6,Board),write(' \\____/ '),getPos(3,7,Board),write(' \\____/ '),
							getPos(5,8,Board),write(' \\____/ '),getPos(7,9,Board),write(' \\____/ '),getPos(9,10,Board),write(' \\').

writeline7(Board)	:-		cursor(29,8),write('\\____/ '),getPos(2,6,Board),write(' \\____/ '),getPos(4,7,Board),write( ' \\____/ '),
							getPos(6,8,Board),write(' \\____/ '),getPos(8,9,Board),write(' \\____/10').


writeline8(Board)	:-		cursor(28,9),write('5/ '),getPos(1,5,Board),write(' \\____/ '),getPos(3,6,Board),write(' \\____/ '),
							getPos(5,7,Board),write(' \\____/ '),getPos(7,8,Board),write(' \\____/ '),getPos(9,9,Board),write(' \\').


writeline9(Board)	:-		cursor(29,10),write('\\____/ '),getPos(2,5,Board),write(' \\____/ '),getPos(4,6,Board),write( ' \\____/ '),
							getPos(6,7,Board),write(' \\____/ '),getPos(8,8,Board),write(' \\____/9').


writeline10(Board)	:-		cursor(28,11),write('4/ '),getPos(1,4,Board),write(' \\____/ '),getPos(3,5,Board),write(' \\____/ '),
							getPos(5,6,Board),write(' \\____/ '),getPos(7,7,Board),write(' \\____/ '),getPos(9,8,Board),write(' \\').

writeline11(Board)	:-		cursor(29,12),write('\\____/ '),getPos(2,4,Board),write(' \\____/ '),getPos(4,5,Board),write( ' \\____/ '),
							getPos(6,6,Board),write(' \\____/ '),getPos(8,7,Board),write(' \\____/8').

writeline12(Board)	:-		cursor(28,13),write('3/ '),getPos(1,3,Board),write(' \\____/ '),getPos(3,4,Board),write(' \\____/ '),
							getPos(5,5,Board),write(' \\____/ '),getPos(7,6,Board),write(' \\____/ '),getPos(9,7,Board),write(' \\').
writeline13(Board)	:-		cursor(29,14),write('\\____/ '),getPos(2,3,Board),write(' \\____/ '),getPos(4,4,Board),write( ' \\____/ '),
							getPos(6,5,Board),write(' \\____/ '),getPos(8,6,Board),write(' \\____/7').

writeline14(Board)	:-		cursor(28,15),write('2/ '),getPos(1,2,Board),write(' \\____/ '),getPos(3,3,Board),write(' \\____/ '),
							getPos(5,4,Board),write(' \\____/ '),getPos(7,5,Board),write(' \\____/ '),getPos(9,6,Board),write(' \\').
writeline15(Board)	:-		cursor(29,16),write('\\____/ '),getPos(2,2,Board),write(' \\____/ '),getPos(4,3,Board),write( ' \\____/ '),
							getPos(6,4,Board),write(' \\____/ '),getPos(8,5,Board),write(' \\____/6').

writeline16(Board)	:-		cursor(28,17),write('1/ '),getPos(1,1,Board),write(' \\____/ '),getPos(3,2,Board),write(' \\____/ '),
							getPos(5,3,Board),write(' \\____/ '),getPos(7,4,Board),write(' \\____/ '),getPos(9,5,Board),write(' \\').

writeline17(Board)	:-		cursor(29,18),write('\\____/ '),getPos(2,1,Board),write(' \\____/ '),getPos(4,2,Board),write( ' \\____/ '),
							getPos(6,3,Board),write(' \\____/ '),getPos(8,4,Board),write(' \\____/5').

writeline18(Board)	:-		cursor(33,19),write('1\\____/ '),getPos(3,1,Board),write(' \\____/ '),getPos(5,2,Board),write(' \\____/ '),
							getPos(7,3,Board),write(' \\____/9').

writeline19(Board)	:-		cursor(38,20),write('2\\____/ '),getPos(4,1,Board),write(' \\____/ '),getPos(6,2,Board),write(' \\____/8').
writeline20(Board)	:-		cursor(43,21),write('3\\____/ '),getPos(5,1,Board),write(' \\____/7').
writeline21(Board)	:-		cursor(48,22),write('4\\____/6').
writeline22(Board)	:-		cursor(52,23),write('5').


getPos(L,N,Board)	:-
					 	member(piecePosition('rook', Color, L, N),Board),
						write('r'),
						write(Color).

getPos(L,N,Board)	:-
					 	member(piecePosition('bishop',Color, L,N),Board),
						write('b'),
						write(Color).


getPos(L,N,Board)	:-
					 	member(piecePosition('king',Color,L,N),Board),
						write('k'),
						write(Color).


getPos(L,N,Board)	:-
					 	member(piecePosition('queen',Color, L,N),Board),
						write('q'),
						write(Color).



getPos(L,N,Board)	:-
					 	member(piecePosition('knight',Color,L,N),Board),
						write('n'),
						write(Color).


getPos(L,N,Board)	:-
					 	member(piecePosition('pawn',Color,L ,N),Board),
						write('p'),
						write(Color).


getPos(L,N,Board) :-	write('  ').

