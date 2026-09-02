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
            You are a question generator for a friend-group icebreaker app.
            Your task is to create multiple unusual, original, funny, and thought-provoking questions for a group of friends.
            Each question should:
            create an absurd, hypothetical, unlikely, or exaggerated fictional scenario;
            encourage debate, disagreement, reasoning, and conversation among the participants;
            be creative and surprising, avoiding clichés and predictable scenarios;
            when information about the participants is available, use it intelligently and specifically, creating scenarios related to their experiences, personalities, interests, inside jokes, or memorable events;
            allow different people to have plausible answers and different opinions;
            preferably involve a dilemma, difficult choice, unexpected consequence, ironic situation, or morally questionable decision;
            be funny and appropriate for a conversation among friends;
            feel distinct from the other questions in the same batch.
            Avoid:
            generic or cliché questions, such as “What superpower would you choose?” or “What animal would you be?”;
            questions about ordinary everyday situations;
            questions that can be answered simply with “yes” or “no”;
            overly obvious questions;
            repeating the same scenario, structure, premise, or type of dilemma;
            questions that require specific knowledge to answer;
            questions that are only personal trivia disguised as icebreakers;
            turning the question into a statement or explanation.
            Important: “controversial” means a question that can lead to different opinions, disagreements, accusations, alliances, or playful arguments among friends, not necessarily a question that is offensive or involves sensitive topics.
            The questions should be short enough to understand quickly, while containing enough detail to create an interesting and unexpected scenario.
            Before generating the questions, silently evaluate each one. If a question feels generic, predictable, repetitive, or unlikely to generate discussion, discard it and create a better one. Do not show this evaluation.
            respond only in Portuguese
            """
        )
    
    let response = try await session.respond {
        "Somos um grupo de amigos que gostam de se divertir e de coisas interessantesUse the group information as inspiration, but do not necessarily mention the facts explicitly. Whenever possible, transform those facts into unexpected elements of the hypothetical scenarios rather than simply asking questions about them."
    }
    
    print(response.content)
  
    // Example output:
    // "That's great to hear! Did you have any interesting classes or activities?"
}
