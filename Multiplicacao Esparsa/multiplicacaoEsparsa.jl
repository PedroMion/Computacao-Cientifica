function preProcessamento(M, tamanho)
    celulasNaoNulas = Dict()

    for i in 1:tamanho
        for j in 1:tamanho
            if M[i, j] != 0
                celulasNaoNulas[[i, j]] = M[i, j]
            end
        end
    end

    return celulasNaoNulas
end

function multiplicacaoEsparsa(dicionario, vetor)
    resultado = zeros(size(vetor))
    celulas = pairs(dicionario)

    for (indice, valor) in celulas
        resultado[indice[1]] += valor * vetor[indice[2]]
    end

    return resultado
end
