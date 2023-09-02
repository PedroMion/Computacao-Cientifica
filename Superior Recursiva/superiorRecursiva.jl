function defineMatrizSuperior(M, n, tam)
    if n == 1
        M[1, :] = randn(tam)
        M[1, 1] = 1
        return M
    end
    for i in n:tam
        if i == n
            M[n, i] = 1
            continue
        end
        M[n, i] = rand()
    end
    return defineMatrizSuperior(M, n-1, tam)
end

function resolveRecursiva(U, b, x, n, tam)
    if n == tam
        x[n] = b[n]
        return resolveRecursiva(U, b, x, n-1, tam)
    end

    x[n] = b[n]
    for i in tam:-1:n+1
        x[n] = x[n] - x[i] * U[n, i]
    end

    if n == 1
        return x
    end

    return resolveRecursiva(U, b, x, n-1, tam)
end