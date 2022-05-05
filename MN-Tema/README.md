
                                    TEMA1-MN
                                            Dan Alin-Constantin 311CC

    In programul PageRank.m R1 reprezinta vectorul rezultat din programul 
Iterative si R2 reprezinta vectorul rezultat din programul Algebraic. Deschid 
fisierul cu numele 'nume' si prima valoare din matrice este marimea matricei 
pe care o stochez in variabila marime. Urmatoarele (marime) linii contine 
fiul, numarul de legaturi si fii nodului respectiv. Pe ultimile doua linii se 
afla d si eps care ne vor ajuta la programul Apartenenta.m. Creez o copie a
vectorului R2 in vectorul arr si mai fac un vector de ordine care reprezinta 
ordinea elementelor. Sortez vectorul arr in ordine descrescatoare si tot odata 
si  vectorul de ordine. Creez vectorul y apeland programul/functia Apartenenta.
Deschid fisierul 'nume'.out in care adaug pe prima linie dimensiunea matricii,
urmata de vectorul R1 apoi un end-line vectorul R2 si un end-line. La final
afisez ce imi cere ultimul task.

    Programul Iterative.m citeste din fisier la fel ca la prima problema 
stringuri din care faac matricea de adiacenta in matricea matrix. Daca se afla 
elemente de 1 pe diagonala principala atunci le fac 0. Calculez suma de pe 
fiecare linie si impart fiecare element al liniei la suma calculata. Transpun 
matricea. Initializez vectorul de page rank-uri cu 1/(numarul total de site-uri). Aplic formula de pe wiki https://en.wikipedia.org/wiki/PageRank.

    In programul Algebraic.m creez aceeasi matrice ca in programul Iterative.m
Initializez formula data pentru a calcula vectorul de page-rank-uri 
utilizandu-se o functie de inversare PR_Inv.

    In programul PR_Inv.m fac functia de inversare "GramSchmidt" din 
laboratorul 3, unde Q reprezinta matricea factor ortogonala si R reprezinta 
matricea factor superior triunghiular

    In programul Apartenenta.m am facut un sistem stiind ca functiia este 
continua => a * val1 + b = 0
            a * val2 + b = 1
si intializez vectorul y cu 0. Apoi rezolv sistemul daca daca x(i) ∈ [0,val1) 
atunci y(i) = 0, daca x(i) ∈ [val1,val2] atunci y(i) = a * x(i) + b si 
daca x(i) ∈ (val2,1] atunci y(i) = 1.