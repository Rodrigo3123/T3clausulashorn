
% Gamero Serrano Rodrigo 21200597
% Feria Vazquez Martin 21200594


% Reglas

% === 1. ¿Quiénes son mortales? ===
mortal(X) :- humano(X).
% Hechos
humano(platon).
humano(socrates).

% === 2. ¿Qué mujeres son científicas? ===
mujeres_cientificas(X) :- false.

% === 3. ¿Sócrates es sabio? ===
sabio(X) :- false.

% === 4. ¿Quiénes son pensadores? ===
pensador(X) :- false.

% === 5. ¿Qué humanos son antiguos? ===
antiguos(X) :- false.

% === 6. ¿Hay alguien que ame a María? ===
% Hecho
ama(juan, maria).

% Regla
ame_maria :- ama(_, maria).

% === 7. ¿Qué filósofos son iguales a Platón usando unificación? 
filosofos_iguales(X) :- 
    platon= 1+1 .


% __________________________________________________________

% Torres de Hanoi

% Hechos:
poste(poste1).
poste(poste2).
poste(poste3).

% Reglas:
hanoi(N) :- mover(N, poste1, poste3, poste2).

mover(0, _, _, _).
mover(N, A, B, C) :-
    N > 0,
    M is N - 1,
    mover(M, A, C, B),
    escribir_mov(A, B),
    mover(M, C, B, A).

escribir_mov(Desde, Hasta) :-
    write('mover desde:  '), write(Desde),
    write(' hasta:'), write(Hasta), nl.