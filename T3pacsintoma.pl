% Pacientes y síntomas
tiene_sintoma(ana, fiebre).
tiene_sintoma(ana, tos).
tiene_sintoma(luis, cansancio).
tiene_sintoma(luis, dolor_cabeza).
tiene_sintoma(marta, fiebre).
tiene_sintoma(marta, vomito).
tiene_sintoma(pedro, dolor_estomago).
tiene_sintoma(pedro, nauseas).
% Relación entre síntomas y enfermedades
sintoma_de(fiebre, gripe).
sintoma_de(tos, gripe).
sintoma_de(cansancio, anemia).
sintoma_de(dolor_cabeza, migraña).
sintoma_de(vomito, infeccion).
sintoma_de(nauseas, infeccion).
sintoma_de(dolor_estomago, gastritis).
% Medicamentos que eliminan síntomas
elimina(aspirina, fiebre).
elimina(jarabe, tos).
elimina(vitaminas, cansancio).
elimina(analgesico, dolor_cabeza).
elimina(antiacido, dolor_estomago).
elimina(suero, vomito).
elimina(antibiotico, infeccion).

% Reglas

% 1. Un paciente está enfermo si tiene un síntoma que pertenece a una enfermedad
enfermo(Paciente, Enfermedad) :-
    tiene_sintoma(Paciente, Sintoma),
    sintoma_de(Sintoma, Enfermedad).

% 2. Un medicamento alivia una enfermedad si elimina uno de sus síntomas
alivia(Medicamento, Enfermedad) :-
    sintoma_de(Sintoma, Enfermedad),
    elimina(Medicamento, Sintoma).

% 3. Se puede recetar un medicamento si alivia la enfermedad que tiene el paciente
recetar(Paciente, Medicamento) :-
    enfermo(Paciente, Enfermedad),
    alivia(Medicamento, Enfermedad).

% 4. Un síntoma es severo si aparece en más de un paciente
severos(Sintoma) :-
    tiene_sintoma(Paciente1, Sintoma),
    tiene_sintoma(Paciente2, Sintoma),
    Paciente1 \= Paciente2.

% 5. Un paciente tiene múltiples síntomas
tiene_multiples_sintomas(Paciente) :-
    tiene_sintoma(Paciente, Sintoma1),
    tiene_sintoma(Paciente, Sintoma2),
    Sintoma1 \= Sintoma2.

% 6. Una enfermedad es compleja si tiene más de un síntoma
enfermedad_compleja(Enfermedad) :-
    sintoma_de(Sintoma1, Enfermedad),
    sintoma_de(Sintoma2, Enfermedad),
    Sintoma1 \= Sintoma2.

% 7. Un medicamento sirve si elimina al menos un síntoma conocido
sirve(Medicamento) :-
    elimina(Medicamento, _).

% 8. Un paciente tiene síntomas sin diagnóstico conocido
tiene_sintomas_sin_diagnostico(Paciente) :-
    tiene_sintoma(Paciente, Sintoma),
    not(sintoma_de(Sintoma, _)).

% 9. Un medicamento es multiusos si alivia más de una enfermedad
multiusos(Medicamento) :-
    alivia(Medicamento, Enfermedad1),
    alivia(Medicamento, Enfermedad2),
    Enfermedad1 \= Enfermedad2.

% 10. Un paciente necesita suero si tiene vómito
necesita_suero(Paciente) :-
    tiene_sintoma(Paciente, vomito).