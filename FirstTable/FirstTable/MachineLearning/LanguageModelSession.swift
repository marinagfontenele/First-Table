//
//  LanguageModelSession.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 27/08/26.
//

import Foundation
import Playgrounds
import FoundationModels

#Playground {
    let session = LanguageModelSession (
            instructions: """
            You are responsible for coming up with interesting and thought-provoking questions for a group of friends based on their experiences and facts about them. The question cannot be generic. You should ask questions that are different, funny, and controversial—ones that will spark debate within the group. The question does not have to be related to the group’s information, but it is preferable that it be.
            You cannot make a statement—only ask a question.
            Answer only in Portuguese.
            """
        )
    
    let response = try await session.respond {
        "Somos um grupo de amigos que fazem engenharia de computação no ifce, gostamos de cinema, filmes e series e gostamos de andar de bicicleta"
    }
    
    print(response.content)
  
    // Example output:
    // "That's great to hear! Did you have any interesting classes or activities?"
}
