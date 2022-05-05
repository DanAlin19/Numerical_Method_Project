function y = Apartenenta(x, val1, val2)

    % am facut sistem din a * val1 + b = 0
    %                     a * val2 + b = 1
	a = 1/(val2 - val1);
    b = val1/(val1 - val2);
    y = zeros(length(x),1);
    
    
    for i = 1:length(x)
        % daca x(i) ∈ [0,val1)
        if x(i) < val1
            y(i) = 0;
        end
        % daca x(i) ∈ [val1,val2]
        if x(i) >= val1 && x(i) <= val2
            y(i) = a * x(i) + b;
        end
        % daca x(i) ∈ (val2,1]
        if x(i) > val2
            y(i) = 1;
        end
    end