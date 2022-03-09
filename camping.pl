% X is somewhere on the right of Y
somewhere_on_the_right(X, Y) :- X > Y.

% X is somewhere on the left of Y
somewhere_on_the_left(X, Y) :- somewhere_on_the_right(Y, X).

% X is on the right of Y
right_of(X, Y) :- X is Y+1.

% X is on the left of Y
left_of(X, Y) :- right_of(Y, X).

% X is right beside Y
next_to(X, Y) :- right_of(X, Y); left_of(X, Y).

% Y is either on the right of X and Y is on the left of Z or Y is either on the left of X and Y is on the right of Z
in_between(X, Y, Z) :- (X < Z, Z < Y); (Y < Z, Z < X).

% Y is on the right of X and Y is on the left of Z
in_between_in_order(X, Y, Z) :- X < Y, Y < Z.

on_the_edge(X) :- X is 1; X is 5.

solve(List) :-
    List = [
           barraca( 1,            Cor1,        Nome1,        Idade1,   Sanduiche1,  Equipe1, Esporte1),
           barraca( 2,            Cor2,        Nome2,        Idade2,   Sanduiche2,  Equipe2, Esporte2),
           barraca( 3,            Cor3,        Nome3,        Idade3,   Sanduiche3,  Equipe3, Esporte3),
           barraca( 4,            Cor4,        Nome4,        Idade4,   Sanduiche4,  Equipe4, Esporte4),
           barraca( 5,            Cor5,        Nome5,        Idade5,   Sanduiche5,  Equipe5, Esporte5)],
    
    % A barraca Vermelha está em algum lugar entre o garoto mais velho e quem gosta de Basquete, nessa ordem.
    member(barraca(Bvermelha, vermelha,            _,             _,            _,        _,        _), List),
    member(barraca(Bolder,           _,            _,            13,            _,        _,        _), List),
    member(barraca(Bbasquete,        _,            _,             _,            _,        _, basquete), List),
    in_between_in_order(Bolder, Bvermelha, Bbasquete),

    % O menino que gosta de sanduíche de Salame está ao lado de quem está na barraca Verde.
    member(barraca(Bsalame,          _,            _,             _,       salame,        _,        _), List),
    member(barraca(Bverde,       verde,            _,             _,            _,        _,        _), List),
    next_to(Bsalame, Bverde),

    % O garoto que joga Tênis está exatamente à esquerda de quem está na barraca Verde.
    member(barraca(Btenis,           _,            _,             _,            _,        _,    tenis), List),
    member(barraca(Bverde,       verde,            _,             _,            _,        _,        _), List),
    left_of(Btenis, Bverde),

    % Breno está em algum lugar à direita da barraca Vermelha.
    member(barraca(Bvermelha, vermelha,            _,             _,            _,        _,        _), List),
    member(barraca(Bbreno,           _,        breno,             _,            _,        _,        _), List),
    somewhere_on_the_right(Bbreno, Bvermelha),

    % Na primeira barraca está o garoto que gosta de Natação.
    member(barraca(1,                _,            _,             _,            _,        _,  natacao), List),

    % O menino de 9 anos está em algum lugar à direita da barraca Verde.
    member(barraca(Bnove,            _,            _,             9,            _,        _,        _), List),
    member(barraca(Bverde,       verde,            _,             _,            _,        _,        _), List),
    somewhere_on_the_right(Bnove, Bverde),

    % A barraca Vermelha está em algum lugar à esquerda de quem gosta de Basquete.
    member(barraca(Bvermelha, vermelha,            _,             _,            _,        _,        _), List),
    member(barraca(Bbasquete,        _,            _,             _,            _,        _, basquete), List),
    somewhere_on_the_left(Bvermelha, Bbasquete),

    % O garoto da barraca Verde gosta de sanduíche de Atum.
    member(barraca(_,            verde,            _,             _,         atum,        _,        _), List),


    % Gabriel está ao lado do menino que gosta de sanduíche de Frango.
    member(barraca(Bgabriel,         _,      gabriel,             _,            _,        _,        _), List),
    member(barraca(Bfrango,          _,            _,             _,       frango,        _,        _), List),
    next_to(Bgabriel, Bfrango),

    % O menino de 10 anos está em algum lugar à direita da barraca Vermelha
    member(barraca(Bdez,             _,            _,            10,            _,        _,        _), List),
    member(barraca(Bvermelha, vermelha,            _,             _,            _,        _,        _), List),
    somewhere_on_the_right(Bdez, Bvermelha),

    % O garoto da equipe Rocket está exatamente à esquerda de Rui
    member(barraca(Brocket,          _,            _,             _,            _,   rocket,        _), List),
    member(barraca(Brui,             _,          rui,             _,            _,        _,        _), List),
    left_of(Brocket,Brui),

    % Quem gosta de Corrida está em algum lugar à direita da barraca Verde
    member(barraca(Bcorrida,          _,            _,            _,            _,        _,   corrida), List),
    member(barraca(Bverde,        verde,            _,            _,            _,        _,         _), List),
    somewhere_on_the_right(Bcorrida, Bverde),
    
    % O garoto da equipe Tupis está em uma das pontas
    member(barraca(BTupis,            _,            _,            _,            _,      tupis,       _), List),
    on_the_edge(BTupis),
    
    % A barraca Amarela está em algum lugar à esquerda de Marco
    member(barraca(Bamarela,    amarela,            _,            _,            _,          _,       _), List),
    member(barraca(Bmarco,            _,        marco,            _,            _,          _,       _), List),
    somewhere_on_the_left(Bamarela, Bmarco),

    % O menino da equipe Dragão está ao lado de quem gosta de jogar Tênis
    member(barraca(Bdragao,          _,             _,            _,            _,     dragao,       _), List),
    member(barraca(Btenis,           _,             _,            _,            _,          _,   tenis), List),
    next_to(Bdragao,Btenis),

    % O menino da equipe Dragão está em algum lugar entre a barraca Branca e o garoto que gosta de sanduíche de Salame, nessa ordem
    member(barraca(Bdragao,          _,             _,            _,            _,     dragao,       _), List),
    member(barraca(Bsalame,          _,             _,            _,       salame,          _,       _), List),
    member(barraca(Bbranca,     branca,             _,            _,            _,          _,       _), List),
    in_between_in_order(Bbranca,Bdragao,Bsalame),

    % Quem gosta de sanduíche de Frango está em algum lugar à direita da barraca Verde
    member(barraca(Bfrango,          _,             _,            _,       frango,          _,       _), List),
    member(barraca(Bverde,       verde,             _,            _,            _,          _,       _), List),
    somewhere_on_the_right(Bfrango, Bverde),

    % A barraca Amarela está em algum lugar à esquerda do garoto de 12 anos
    member(barraca(Bamarela,    amarela,            _,            _,            _,          _,       _), List),
    member(barraca(Bdoze,             _,            _,           12,            _,          _,       _), List),
    somewhere_on_the_left(Bamarela, Bdoze),

    % % O menino que gosta de Futebol está ao lado do menino da equipe Ciclanos
    member(barraca(Bfutebol,          _,            _,            _,            _,          _, futebol), List),
    member(barraca(Bciclanos,         _,            _,            _,            _,  cliclanos,       _), List),
    next_to(Bfutebol, Bciclanos),
    
    % % A barraca Vermelha está em algum lugar entre quem gosta de sanduíche de Presunto e quem tem 12 anos
    member(barraca(Bvermelha,  vermelha,            _,            _,            _,          _,       _), List),
    member(barraca(Bpresunto,         _,            _,            _,     presunto,          _,       _), List),
    member(barraca(Bdoze,             _,            _,           12,            _,          _,       _), List),
    in_between(Bpresunto, Bdoze, Bvermelha),

    % O garoto da equipe Rocket está exatamente à esquerda de quem gosta de Futebol.
    member(barraca(Brocket,           _,            _,            _,            _,     rocket,       _), List),
    member(barraca(Bfutebol,          _,            _,            _,            _,          _, futebol), List),
    left_of(Brocket, Bfutebol),

    % setting missing informations (those below were not cited in the hints)
    member(barraca(       _,          _,            _,           11,            _,          _,       _), List),
    member(barraca(       _,          _,            _,            _,            _,    alfafas,       _), List),
    member(barraca(       _,          _,     anderson,            _,            _,          _,       _), List),
    member(barraca(       _,          _,            _,            _,       queijo,          _,       _), List),
    member(barraca(       _,       azul,            _,            _,            _,          _,       _), List).