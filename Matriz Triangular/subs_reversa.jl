function subs_reversa(A, b)
    n = length(b)
    x = zeros(n)

    for i in n:-1:1
        x[i] = b[i]
        for j in (i+1):n
            x[i] -= x[j] * A[i, j]
        end
        x[i] = x[i] / A[i, i]
    end

    return x
end