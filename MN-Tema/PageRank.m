function [R1 R2] = PageRank(nume, d, eps)
	

    R1 = Iterative(nume, d, eps);
    R2 = Algebraic(nume, d);

    % se deschide fisieru se citeste dimensiunea matricii si apoi nodul,
    % numarul de legaturi si fii acestuia pe ultimele 2 linie se afla d si eps
    fid = fopen(nume);
    size = fgetl(fid);
    marime = str2double(size);
    matrix = zeros(marime,marime);

    for i = 1:marime
         A = fgetl(fid);
    end
    value1 = str2double(fgetl(fid));
    value2 = str2double(fgetl(fid));
    fclose(fid);

    % fac o copie a vectorului R2 in arr
    for i = 1:marime
        arr(i) = R2(i);
    end

    % fac un vector de ordine
    for i =1:marime
        ordine(i) = i;
    end
    
    % sortez vectorul arr in ordinea descrescatoare a elementelor
    for i = 1:(marime - 1)
        for j = (i+1):marime
            if arr(i) < arr(j)
                aux = arr(i);
                arr(i) = arr(j);
                arr(j) = aux;
                aux = ordine(i);
                ordine(i) = ordine(j);
                ordine(j) = aux;
            end
        end
    end
    disp(arr);

    y = Apartenenta(arr, value1, value2);

    % creez si deschid fisierul de iesire
    nume = [nume, '.out'];
    file = fopen(nume, "w");

    % afisarea pentru primul task
    fprintf(file, "%d\n", marime);
    for i = 1:marime
        fprintf(file, "%.6f\n", R1(i));
    end
    % afisarea pentru al-doilea task
    fprintf(file, "\n");
    for i = 1:marime
        fprintf(file, "%.6f\n", R2(i));
    end

    % afisarea pentru al-treilea task
    fprintf(file, "\n");
    for i = 1:marime
        fprintf(file, "%d %d %.6f\n", i, ordine(i), y(i));
    end

    fclose(file);
end