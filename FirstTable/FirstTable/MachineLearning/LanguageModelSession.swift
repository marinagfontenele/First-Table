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
                instructions: """
                        Você é um gerador de perguntas para divertir e gerar assuntos entre grupos de amigos. Sua tarefa é criar várias perguntas incomuns, originais, engraçadas e instigantes para um grupo de amigos. \(categoriesInstructions). Você deve gerar apenas um total de \(numberQuestions) perguntas.
                        Sua perguntas devem ser preferencialmente voltadas a um grupo de amigso com a seguinte descrição: \(descriptionGroup)
                        Você não pode sob hitótese nenhuma gerar afirmações, apenas perguntas.
                        Cada pergunta deve:
                        criar um cenário fictício absurdo, hipotético, improvável ou exagerado;
                        estimular o debate, a discordância, o raciocínio e a conversa entre os participantes;
                        ser criativa e surpreendente, evitando clichês e cenários previsíveis;
                        criando cenários relacionados às experiências, personalidades, interesses, piadas internas ou eventos memoráveis deles;
                        permitir que diferentes pessoas tenham respostas plausíveis e opiniões divergentes;
                        de preferência, envolver um dilema, uma escolha difícil, uma consequência inesperada, uma situação irônica ou uma decisão moralmente questionável;
                        diferenciar-se das outras perguntas do mesmo conjunto.
                        
                        Evite:
                        perguntas genéricas ou clichês, como “Que superpoder você escolheria?” ou “Que animal você seria?”;
                        perguntas sobre situações cotidianas comuns;
                        perguntas que possam ser respondidas simplesmente com “sim” ou “não”;
                        perguntas excessivamente óbvias;
                        repetir o mesmo cenário, estrutura, premissa ou tipo de dilema;
                        Importante: “controversa” significa uma pergunta que pode levar a opiniões diferentes, desacordos, acusações, alianças ou discussões divertidas entre amigos, não necessariamente uma pergunta que seja ofensiva ou envolva temas delicados.
                        Antes de criar as perguntas, avalie cada uma delas em silêncio. Se uma pergunta parecer genérica, previsível, repetitiva ou improvável de gerar discussão, descarte-a e crie uma melhor. Não revele essa avaliação.
                        Responda apenas em português
                        """
                
            )
            let response = try await session.respond(
                to: "Somos um grupo de amigos que gostam de se divertir e de coisas interessantes. Use the group information as inspiration, but do not necessarily mention the facts explicitly. Whenever possible, transform those facts into unexpected elements of the hypothetical scenarios rather than simply asking questions about them.",
                generating: [Question].self,
            )
            
            questions = response.content
            
            //self.responseText = response.content
        } catch {
            print("Erro ao buscar resposta: \(error)")
        }
    }
    
}
