function gaussJacobiIngenuo(A, b, tamanho, n)
    x = zeros(tamanho)
    for k in 1:n
        for i in 1:tamanho
            aux = 0
            for j in 1:tamanho
                if j != i
                    aux -= A[i, j] * x[j]
                end
            end
            aux += b[i]
            x[i] = aux / A[i, i]
        end
    end
    return x
end