function R = Iterative(nume, d, eps)

    fid = fopen(nume);
    size = fgetl(fid);

    % primul elemnet din fisier este dimenisiunea matricii
    marime = str2double(size);

    % declar o matrice vida de dimensiuni marime X marime 
    matrix = zeros(marime,marime);
    
    % creez matricea de adiacenta cand scot marime (ori)X linii din matrice se scot stringuri
    % si trebuie sa modelez putin datele
    for i = 1:marime
         A = fgetl(fid);
         for j = 1:str2double(A(3))
                matrix(str2double(A(1)), str2double(A(j * 2 + 3))) = 1;
          end
    end

    % daca se afla elemente != 0 pe diagonala principala le dau valoarea 0
    for i = 1:marime
       if matrix(i,i) == 1
           matrix(i,i) = 0;
       end
    end
    fclose(fid);
    
    % fac suma de elemente de pe linie si impart fiecare element al liniiei
    % respective cu suma calculata (logica fuzzy)
    for i = 1:marime
        ExternalLinks = 0;
        for j = 1:marime
            if matrix(i,j) == 1
                ExternalLinks = ExternalLinks + 1;
            end
        end
        for j = 1:marime
            matrix(i,j) = matrix(i,j) / ExternalLinks;
        end
    end

    % transpun matricea
    matrix = matrix';
    
    % Se initializeaza vectorul de page rank-uri cu 1/(numarul total de site-uri)
    R(1:marime) = 1/marime;
    R = R';
    
    % aplic formula de pe wiki https://en.wikipedia.org/wiki/PageRank
    RA = R + 1;
    while norm(R - RA) > eps
        RA = R; 
        R = d * matrix * R + ((1 - d) / marime) * 1;
    end
  
  R = RA;