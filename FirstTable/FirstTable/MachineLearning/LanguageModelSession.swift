//
//  LanguageModelSession.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 27/08/26.
//

import Foundation
import Playgrounds
import FoundationModels
import SwiftUI

@Generable
struct Quiz {
    @Guide(.count(5))
    let questions: [Question]
}

@Generable
struct Question: Identifiable {
    let id: Int
    let text: String
}

@Observable
class FoundationModelsSession {
    var responseText: String = ""
    var descriptionGroup: String = ""
    var categories: [Category] = []
    var numberQuestions: Int = 0
    
    var questions: [Question] = []
    
    var categoriesInstructions: String {
        if categories.isEmpty {
            return ""
        }
        
        let descriptionList = categories.map { "\($0.description)" }
        return descriptionList.joined(separator: "\n")
    }
    
    func generateQuestions() async {
        do {
            let session = LanguageModelSession (
                instructions:
                """
                Você cria perguntas para gerar conversas divertidas, debates e discordâncias entre amigos, para um aplicativo lúdico de quiz em grupo.
                Crie perguntas curtas, originais, inesperadas e diferentes entre si.
                Regras:
                - Gere exatamente \(numberQuestions) perguntas.
                - Siga obrigatoriamente estas categorias: \(categoriesInstructions)
                - Não repita perguntas, cenários, estruturas ou tipos de dilema.
                - Gere apenas perguntas, nunca afirmações.
                - Evite perguntas de sim/não, clichês, situações cotidianas óbvias e perguntas genéricas.
                - Prefira dilemas, consequências inesperadas, situações irônicas e escolhas em que diferentes pessoas possam defender respostas diferentes.
                - As perguntas devem estimular discussão, acusações brincalhonas, alianças, discordâncias ou revelações interessantes entre amigos.
                - Mantenha cada pergunta sucinta e direta, usando apenas o contexto necessário para preservar a criatividade e gerar debate. Evite explicações, detalhes ou construções longas que não aumentem o potencial de discussão.
                - Seja criativo: transforme informações sobre o grupo em premissas e cenários inesperados, em vez de simplesmente perguntar sobre essas informações.
                - Antes de gerar cada pergunta, descarte silenciosamente ideias genéricas, previsíveis ou parecidas com perguntas anteriores.
                - Responda apenas em português.
                """
            )
            let response = try await session.respond(
                to:
                """
                INFORMAÇÕES DESTE GRUPO: \(descriptionGroup)
                CATEGORIAS / RESTRIÇÕES DESTA GERAÇÃO: \(categoriesInstructions)
                Use as informações do grupo como principal fonte de inspiração. Não é necessário mencionar os fatos literalmente. Prefira incorporá-los indiretamente em dilemas, hipóteses, situações absurdas, consequências inesperadas ou conflitos entre os participantes. Prioridade: 1. Respeitar as categorias solicitadas. 2. Personalizar as perguntas para este grupo. 3. Maximizar criatividade, variedade e potencial de discussão. Gere \(numberQuestions) perguntas.
                """,
                generating: [Question].self,
            )
            
            questions = response.content
            
            //self.responseText = response.content
        } catch {
            print("Erro ao buscar resposta: \(error)")
        }
    }
    
}
