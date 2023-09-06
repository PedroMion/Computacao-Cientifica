function projetaVetor(v1, v2, n)
    fatorMultiplicativo = 0
    for i in 1:n
        fatorMultiplicativo += v1[i] * v2[i]
    end
    return fatorMultiplicativo
end

function normalizar(v, n)
    norma = sqrt(projetaVetor(v, v, n))
    return (v / norma), norma
end

function fatoracaoQR(M, n)
    Q = zeros(n, n)
    R = zeros(n, n)

    for i in 1:n
        Q[:, i] += M[:, i]
        for j in 1:i-1
            coeficiente = projetaVetor(M[:, i], Q[:, j], n)
            Q[:, i] -= (Q[:, j] * coeficiente)
            R[j, i] = coeficiente
        end
        Q[:, i], R[i, i] = normalizar(Q[:, i], n)
    end
    return Q, R
end

function printaMatriz(M, n)
    for i in 1:n
        println(M[i, :])
    end
end