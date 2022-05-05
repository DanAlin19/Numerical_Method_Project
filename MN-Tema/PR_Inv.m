% functia de inversare din lab_3
% Q - matricea factor ortogonala; R - matricea factor superior triunghiular
function B = PR_Inv(A)
	
    [m, n] = size(A);
    Q = zeros(m,n);
    R = zeros(n);

    for j = 1:n
        for i = 1:j-1
            R(i,j) = Q(:,i)' * A(:,j);
        end

    s = zeros(m,1);
    for i = 1 : j-1
        s = s + R(i,j) * Q(:,i);
    end

    % Echivalent pentru instructiunea for de mai sus:
    % s = Q(:, 1:j-1) * R(1:j-1, j);

    aux = A(:,j) - s;

    R(j,j) = norm(aux,2);
    Q(:,j) = aux/R(j,j);
    end

    Q = Q';
    marime = length(R);
    B = zeros(marime);
    for i = marime:-1:1
        for j = marime:-1:1
            suma = 0;
            suma = suma + R(i, (i+1):marime) * B((i+1):marime, j);
            B(i, j) = (Q(i, j) - suma) / R(i, i);
        end
    end
