% Program:

% Set all of the hobbyes:
hobby("Собиратель насекомых").
hobby("Радиолюбитель").
hobby("Филателист").
hobby("Коллекционер открыток").
hobby("Авиамоделист").
hobby("Железноделист").


% Set all of the professions:
profession("Электромонтёр").
profession("Машинист тепловоза").
profession("Забойщик").
profession("Токарь").
profession("Инженер").
profession("Врач").


% Set statements:
%statement1(U, _, _, _, _, _, _, _, _, _, _, _) :-
    %U = "Авиамоделист";
    %U = "Железноделист".


%statement2(_, _, W1, _, _, Z1, _, _, W2, _, _, Z2) :-
    %not(W1 = "Радиолюбитель"),
    %not(Z1 = "Радиолюбитель"),
    %not(W2 = "Электромонтёр"),
    %not(Z2 = "Электромонтёр").


statement1(U1) :-
    U1 = "Авиамоделист";
    U1 = "Железноделист".

statement2(Z1, W2, Z2) :-
    not(Z1 = "Радиолюбитель"),
    not(W2 = "Электромонтёр"),
    not(Z2 = "Электромонтёр").

statement3(X1, Y1, X2, Y2) :-
    not(X1 = "Железноделист"),
    not(Y1 = "Железноделист"),
    not(X2 = "Машинист тепловоза"),
    not(Y2 = "Машинист тепловоза").

statement4(U1, V1, W1, X1, Y1, Z1, U2, V2, W2, X2, Y2, Z2) :-
    (
    	not(U2 = "Врач");
    	(U1 = "Авиамоделист"; U1 = "Железноделист")
    ),
    (
    	not(V2 = "Врач");
    	(V1 = "Авиамоделист"; V1 = "Железноделист")
    ),
    (
    	not(W2 = "Врач");
    	(W1 = "Авиамоделист"; W1 = "Железноделист")
    ),
    (
    	not(X2 = "Врач");
    	(X1 = "Авиамоделист"; X1 = "Железноделист")
    ),
    (
    	not(Y2 = "Врач");
    	(Y1 = "Авиамоделист"; Y1 = "Железноделист")
    ),
    (
    	not(Z2 = "Врач");
    	(Z1 = "Авиамоделист"; Z1 = "Железноделист")
    ).

statement5(U2) :-
    U2 = "Электромонтёр";
    U2 = "Забойщик";
    U2 = "Токарь".

statement6_1(X1, Y1, X2, Y2) :-
    not(X1 = "Собиратель насекомых"),
    not(Y1 = "Собиратель насекомых"),
    not(X2 = "Машинист тепловоза"),
    not(Y2 = "Машинист тепловоза").

statement6_2(U1, V1, W1, Z1, U2, V2, W2, Z2) :-
    (not(U2 = "Машинист тепловоза"); not(U1 = "Собиратель насекомых")),
    (not(V2 = "Машинист тепловоза"); not(V1 = "Собиратель насекомых")),
    (not(W2 = "Машинист тепловоза"); not(W1 = "Собиратель насекомых")),
	(not(Z2 = "Машинист тепловоза"); not(Z1 = "Собиратель насекомых")).

statement7(U1, V1, W1, X1, Y1, Z1, U2, V2, W2, X2, Y2, Z2) :-
    (
    	not(U1 = "Авиамоделист");
    	(
        	not(U2 = "Электромонтёр"),
            not(U2 = "Машинист тепловоза"),
            not(U2 = "Забойщик")
        )
    ),
    (
    	not(V1 = "Авиамоделист");
    	(
        	not(V2 = "Электромонтёр"),
            not(V2 = "Машинист тепловоза"),
            not(V2 = "Забойщик")
        )
    ),
    (
    	not(W1 = "Авиамоделист");
    	(
        	not(W2 = "Электромонтёр"),
            not(W2 = "Машинист тепловоза"),
            not(W2 = "Забойщик")
        )
    ),
    (
    	not(X1 = "Авиамоделист");
    	(
        	not(X2 = "Электромонтёр"),
            not(X2 = "Машинист тепловоза"),
            not(X2 = "Забойщик")
        )
    ),
    (
    	not(Y1 = "Авиамоделист");
    	(
        	not(Y2 = "Электромонтёр"),
            not(Y2 = "Машинист тепловоза"),
            not(Y2 = "Забойщик")
        )
    ),
    (
    	not(Z1 = "Авиамоделист");
    	(
        	not(Z2 = "Электромонтёр"),
            not(Z2 = "Машинист тепловоза"),
            not(Z2 = "Забойщик")
        )
    ).

statement8_1(U1, V1, W1, X1, Y1, Z1, U2, V2, W2, X2, Y2, Z2) :-
    (not(U2 = "Машинист тепловоза"); not(U1 = "Коллекционер открыток")),
    (not(V2 = "Машинист тепловоза"); not(V1 = "Коллекционер открыток")),
    (not(W2 = "Машинист тепловоза"); not(W1 = "Коллекционер открыток")),
    (not(X2 = "Машинист тепловоза"); not(X1 = "Коллекционер открыток")),
    (not(Y2 = "Машинист тепловоза"); not(Y1 = "Коллекционер открыток")),
    (not(Z2 = "Машинист тепловоза"); not(Z1 = "Коллекционер открыток")).

statement8_2(Y1) :-
    not(Y1 = "Коллекционер открыток").

statement9_1(U1, V1, W1, X1, Y1, Z1, U2, V2, W2, X2, Y2, Z2) :-
    (not(U2 = "Забойщик"); not(U1 = "Радиолюбитель")),
    (not(V2 = "Забойщик"); not(V1 = "Радиолюбитель")),
    (not(W2 = "Забойщик"); not(W1 = "Радиолюбитель")),
    (not(X2 = "Забойщик"); not(X1 = "Радиолюбитель")),
    (not(Y2 = "Забойщик"); not(Y1 = "Радиолюбитель")),
    (not(Z2 = "Забойщик"); not(Z1 = "Радиолюбитель")).

statement9_2(U1, V1, W1, X1, Y1, Z1, U2, V2, W2, X2, Y2, Z2) :-
	(not(U1 = "Собиратель насекомых"); U2 = "Электромонтёр"),
    (not(V1 = "Собиратель насекомых"); V2 = "Электромонтёр"),
    (not(W1 = "Собиратель насекомых"); W2 = "Электромонтёр"),
    (not(X1 = "Собиратель насекомых"); X2 = "Электромонтёр"),
    (not(Y1 = "Собиратель насекомых"); Y2 = "Электромонтёр"),
    (not(Z1 = "Собиратель насекомых"); Z2 = "Электромонтёр").

statement10(Z2) :-
	not(Z2 = "Инженер").

statement11(U1, V1, W1, X1, Y1, Z1, U2, V2, W2, X2, Y2, Z2) :-
	(not(U1 = "Железноделист"); (U2 = "Инженер"; U2 = "Врач")),
    (not(V1 = "Железноделист"); (V2 = "Инженер"; V2 = "Врач")),
    (not(W1 = "Железноделист"); (W2 = "Инженер"; W2 = "Врач")),
    (not(X1 = "Железноделист"); (X2 = "Инженер"; X2 = "Врач")),
	(not(Y1 = "Железноделист"); (Y2 = "Инженер"; Y2 = "Врач")),
    (not(Z1 = "Железноделист"); (Z2 = "Инженер"; Z2 = "Врач")).

% Solution:
solution(U1, V1, W1, X1, Y1, Z1, U2, V2, W2, X2, Y2, Z2) :-
    hobby(U1),
    profession(U2),
    
    hobby(V1),
    profession(V2),
    not(V1 = U1),
    not(V2 = U2),
    
    hobby(W1),
    profession(W2),
    not(W1 = U1), not(W1 = V1),
    not(W2 = U2), not(W2 = V2),
    
    hobby(X1),
    profession(X2),
    not(X1 = U1), not(X1 = V1), not(X1 = W1),
    not(X2 = U2), not(X2 = V2), not(X2 = W2),
    
    hobby(Y1),
    profession(Y2),
    not(Y1 = U1), not(Y1 = V1), not(Y1 = W1), not(Y1 = X1),
    not(Y2 = U2), not(Y2 = V2), not(Y2 = W2), not(Y2 = X2),
    
    hobby(Z1),
    profession(Z2),
    not(Z1 = U1), not(Z1 = V1), not(Z1 = W1), not(Z1 = X1), not(Z1 = Y1),
    not(Z2 = U2), not(Z2 = V2), not(Z2 = W2), not(Z2 = X2), not(Z2 = Y2),
    
    
    %statement1(U1, V1, W1, X1, Y1, Z1, U2, V2, W2, X2, Y2, Z2),
    %statement2(U1, V1, W1, X1, Y1, Z1, U2, V2, W2, X2, Y2, Z2),

    statement1(U1),
    statement2(Z1, W2, Z2),
    statement3(X1, Y1, X2, Y2),
    statement4(U1, V1, W1, X1, Y1, Z1, U2, V2, W2, X2, Y2, Z2),
    statement5(U2),
    statement6_1(X1, Y1, X2, Y2),
    statement6_2(U1, V1, W1, Z1, U2, V2, W2, Z2),
    statement7(U1, V1, W1, X1, Y1, Z1, U2, V2, W2, X2, Y2, Z2),
    
    statement8_1(U1, V1, W1, X1, Y1, Z1, U2, V2, W2, X2, Y2, Z2),
    statement8_2(Y1),
    
    statement9_1(U1, V1, W1, X1, Y1, Z1, U2, V2, W2, X2, Y2, Z2),
    statement9_2(U1, V1, W1, X1, Y1, Z1, U2, V2, W2, X2, Y2, Z2),
    
    statement10(Z2),
    statement11(U1, V1, W1, X1, Y1, Z1, U2, V2, W2, X2, Y2, Z2).











% Query:

solution(U1, V1, W1, X1, Y1, Z1, U2, V2, W2, X2, Y2, Z2)