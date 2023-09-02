function subs_direta(A, b)
    n = length(b)
    x = zeros(n)

    for i in 1:n
        x[i] = b[i]
        for j in 1:(i-1)
            x[i] -= x[j] * A[i, j]
        end
        x[i] = x[i] / A[i, i]
    end

    return x
end