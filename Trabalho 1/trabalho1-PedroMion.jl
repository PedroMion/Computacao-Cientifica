# Pedro Mion Braga
# DRE 121065919

using Plots

# Essa conta dá overflow já que 2^8 -1 = 127 é o número máximo que pode ser representado em 8 bits
println(Int8(100) + Int8(28))

# Numéro máximo possível com 64 bits
x = 2^63 - 1
println(x)

# Aqui podemos observar o Overflow
println(x + 1)

# Por conta do erro de Overflow, - (x + 1) é igual a x + 1 :)
println(-(x + 1))

# x^2 = 1 por alguma razão mística
println(x ^ 2)

# Através do vídeo do Professor descobri que podemos usar BigInt para representar grandes inteiros sem problemas com Overflow
println(BigInt(x)^10)

# Número grande o suficiente para ser considerado infinito
println(10.0^309)

# Considera que vai para 0
println(1/Inf)

# Not a Number para mostrar que a conta é indeterminada, podendo assumir diversos valores diferentes
println(Inf - Inf)

# Mesmo caso
println(Inf / Inf)

# Divisão por 0 é indeterminado
println(0 / 0)

# Descobrindo até onde vai antes de consdierar um número muito pequeno como 0
y = 1.0
while y > 0.0
    global y = y / 2
    println("y = $y")
end
# Aqui vimos que o Julia é capaz de guardar números muito pequenos, até a ordem de 10^-324, o que é bem mais que suficiente para todos os tipos de aplicação que desejarmos

# Agora usando Plots
gr(size=(400,300))

t = Float16(0.0)
X = Float16[0.0]
D = Float16[0.0]
while t < Inf
    u = nextfloat(t)
    d = u - t
    global t = u
    push!(X, t)
    push!(D, d)
end

# Código fornecido para plotar o gráfico e observarmos que a linha segue constante, até uma mudança de base ser obrigatória
scatter(X, D, ms=1, m=(stroke(0)), leg=false)

# O vetor D tem mais de 30 mil elementos
println(length(D))

# Aqui podemos observar o erro do ponto flutuante, vendo que 0.1 + 0.2 != 0.3, como já estudado em introdução à computação numérica
# Como mostrado pelo Professor no vídeo, esse não é um problema da linguagem e sim do hardware
println(0.1 + 0.2 - 0.3)

# Por conta desse erro de ponto flutuante, temos que nos preocupar com a ordem das operações
println(((1 + 1e-16) + 1e-16) == (1 + (1e-16 + 1e-16)))

# Através do vídeo muito completo do professor, fomos capazes de observar o comportamento da linguagem e do hardware em diversas situações que iremos enfrentar ao longo da disciplina