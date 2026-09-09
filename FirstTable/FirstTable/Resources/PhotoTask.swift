//
//  PhotoTask.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 04/09/26.
//

import Foundation
import UIKit

struct PhotoTask: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let instruction: String
}

extension PhotoTask {

    static func firstTask(name: String) -> PhotoTask {
        PhotoTask(
            name: name,
            instruction: "Tire uma foto em grupo")
    }

    static let randomTasks: [PhotoTask] = [

        PhotoTask(
            name: "O mais teimoso",
            instruction: "Quem é o mais teimoso(a) do grupo?"
        ),

        PhotoTask(
            name: "O mais competitivo",
            instruction: "Quem é o mais competitivo(a)?"
        ),

        PhotoTask(
            name: "O mais ciumento",
            instruction: "Quem é o mais ciumento(a) com as amizades?"
        ),

        PhotoTask(
            name: "O topa-tudo",
            instruction: "Quem é o mais espontâneo(a), topa qualquer parada?"
        ),

        PhotoTask(
            name: "O mais ansioso",
            instruction: "Quem é o mais ansioso(a) antes de qualquer evento?"
        ),
        
        PhotoTask(
            name: "O mais orgulhoso",
            instruction: "Quem é o mais orgulhoso(a), nunca admite que tá errado?"
        ),
        
        PhotoTask(
            name: "O mais fofoqueiro",
            instruction: "Quem é o mais fofoqueiro(a)?"
        ),
        
        PhotoTask(
            name: "O Mais sarcástico",
            instruction: "Quem tem o humor mais ácido/sarcástico?"
        ),
        
        PhotoTask(
            name: "O mais controlador",
            instruction: "Quem é o mais controlador(a) quando organiza as coisas?"
        ),
        
        PhotoTask(
            name: "O mais sonhador",
            instruction: "Quem é o mais sonhador(a), sempre com plano mirabolante?"
        ),
        
        PhotoTask(
            name: "O mais racional",
            instruction: "Quem é o mais racional, sempre traz o \"mas pensa bem...\"?"
        ),
        
        PhotoTask(
            name: "O mais dramático",
            instruction: "Quem é o mais dramático(a)?"
        ),
        
        PhotoTask(
            name: "O melhor cozinheiro",
            instruction: "Quem é o melhor cozinheiro(a)?"
        ),
        
        PhotoTask(
            name: "Mãe/Pai do grupo",
            instruction: "Quem é o mais \"mãe/pai\" do grupo (cuida de todo mundo)?"
        ),
        
        PhotoTask(
            name: "Nunca chega na hora",
            instruction: "Quem é o mais atrasado pra tudo?"
        ),
        
        PhotoTask(
            name: "Nunca responde",
            instruction: "Quem nunca responde mensagem na hora?"
        ),
        
        PhotoTask(
            name: "O mais desorganizado",
            instruction: "Quem é o mais desorganizado(a) com as próprias coisas?"
        ),
        
        PhotoTask(
            name: "O que dorme mais tarde", // guarda noturno honorario, fiscal da madrugada, morcego profissional
            instruction: "Quem dorme mais tarde de todo mundo?"
        ),
        
        PhotoTask(
            name: "Furão",
            instruction: "Quem cancela plano em cima da hora com mais frequência?"
        ),
        
        PhotoTask(
            name: "Peculiaridades exóticas",
            instruction: "Quem tem o hábito estranho que ninguém entende?"
        ),
        
        PhotoTask(
            name: "Repetidor de comida",
            instruction: "Quem repete o mesmo pedido de comida sempre?"
        ),
        
        PhotoTask(
            name: "O mais vaidoso",
            instruction: "Quem gasta mais tempo se arrumando pra sair?"
        ),
        
        PhotoTask(
            name: "Mais viciado em série/jogo",
            instruction: "Quem é o mais viciado(a) em alguma série/jogo?"
        ),
        
        PhotoTask(
            name: "O mais metódico",
            instruction: "Quem tem a rotina mais rígida (horário certo pra tudo)?"
        ),
        
        PhotoTask(
            name: "Rato de academia",
            instruction: "Quem é o mais chegado(a) em academia/exercício?"
        ),
        
        PhotoTask(
            name: "Dono(a) da melhor playlist",
            instruction: "Quem tem o melhor gosto musical?"
        ),
        
        PhotoTask(
            name: "Refém do algoritmo",
            instruction: "Quem é o mais viciado(a) em celular?"
        ),
        
        PhotoTask(
            name: "O mais barraqueiro",
            instruction: "Quem é o mais barraqueiro(a)?"
        )
    ]
}


struct PhotoResult: Identifiable {

    let id = UUID()

    let task: PhotoTask

    let image: UIImage
}
