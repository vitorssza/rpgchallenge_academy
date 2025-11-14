import Foundation

var missoes = ["Colher Ervas Medicinais", "Escoltar", "Aceitar o pedido de outro Reino", "??Missão Bloqueda??"]
let missoesReais = ["Colher Ervas Medicinais", "Escolta", "Aceitar o pedido de outro Reino", "Derrotar o Chefe da Dungeon"]

let recompensas = [20, 100, 200, 400]

let ranks = ["F", "D", "C", "B", "A", "S+"]
let proficienciaNecessaria = [0, 100, 300, 700, 1000, 2100, 2110]

func mostrarMissoes() {
    print("Escolha uma missão! (Digite um numero de 0 a 3)")
    for i in 0..<missoes.count {
        print("[\(i)] \(missoes[i]) — \(recompensas[i]) de Proficiência")
    }
}

func descobrirRank(proficiencia: Int) -> String {
    var r = "C"
    for i in 0..<ranks.count {
        if proficiencia >= proficienciaNecessaria[i] {
            r = ranks[i]
        }
    }
    return r
}

var chefeDesbloqueado = false

print("\nBem-vindo(a) à Guilda da Capital Real! Vou te explicar como funciona!")
print("A cada missão realizada, seu Rank aumenta através da Proficiência obtida! Os ranks são (S+, S, A, B, C, D, F)")
print("\nDiga seu nome para se registrar!")
let nome = readLine() ?? "Aventureiro"

var pontos = 0
var jogando = true

print("\nBoa sorte, \(nome)!")

while jogando {

    let meuRank = descobrirRank(proficiencia: pontos)

    if meuRank == "S+" {
        print("\nPARABÉNS, \(nome)!")
        print("Você atingiu o RANK MÁXIMO (S+).")
        break
    }

    print("\n-----------------------------")
    print(" Rank: \(meuRank)")
    print(" Proficiência: \(pontos)")
    print("______________________________")

    mostrarMissoes()

    print("""
    
    Escolha uma missão:
    [7] Desbloquear Missão Secreta
    [-1] Desistir
    """)

    let entrada = readLine() ?? ""

    if entrada == "-1" {
        jogando = false
        continue
    }

    if entrada == "7" {
        if chefeDesbloqueado {
            print("\nA missão do Chefe da Dungeon já está desbloqueada!")
        } else {
            chefeDesbloqueado = true
            missoes[3] = missoesReais[3]
            print("\nMISSÃO SECRETA DESBLOQUEADA!")
        }
        continue
    }

    if let missao = Int(entrada), missao >= 0 && missao < missoes.count {
        
        if missao == 3 && chefeDesbloqueado == false {
            print("\nBLOQUEADO!")
            continue
        }
        
        print("\n")
        print("\n")
        print("\nVocê completou: \(missoesReais[missao])")
        pontos += recompensas[missao]
        print("Ganhou \(recompensas[missao]) de Proficiência!")
    } else {
        print("Essa missão não existe!")
    }
}

print("\nAté logo, \(nome)! Você terminou com \(pontos) de Proficiência e Rank \(descobrirRank(proficiencia: pontos))!")


