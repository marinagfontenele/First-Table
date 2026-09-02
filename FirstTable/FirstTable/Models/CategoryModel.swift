//
//  CategoryModel.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 31/08/26.

//

import Foundation
import SwiftData
import PhotosUI

enum Category: String, CaseIterable, Codable {
    case cooking = "Culinária"
    case music = "Música"
    case games = "Jogos"
    case movies = "Filmes"
    case confessions = "Confissões"
    case chaos = "Caos"
    case decisions = "Decisões ruins"
    case gossip = "Fofoca"
    case situations = "Situações aleatórias"
    
    var name: String {
        switch self {
        case .cooking: return "Culinária"
        case .music: return "Música"
        case .games: return "Jogos"
        case .movies: return "Filmes"
        case .confessions: return "Confissões"
        case .chaos: return "Caos"
        case .decisions: return "Decisões ruins"
        case .gossip: return "Fofoca"
        case .situations: return "Situações aleatórias"
        }
    }
    
    var image: String {
        switch self {
        case .cooking: return "🥘"
        case .music: return "🎵"
        case .games: return "🎮"
        case .movies: return "🎬"
        case .confessions: return "🤫"
        case .chaos: return "💥"
        case .decisions: return "🫠"
        case .gossip: return "🗣️"
        case .situations: return "🎲"
        }
    }
    
    var description: String {
        switch self {
        case .cooking: return "Crie perguntas relacionadas a culinária, cozinha e hábitos alimentares."
        case .music: return "Crie perguntas relacionadas a músicas, cantores e opiniões musicais."
        case .games: return "Crie perguntas relacionadas a jogos de video game, jogos digitais e jogos de tabuleiro."
        case .movies: return "Crie perguntas relaconadas a filmes, séries, atores e cinema."
        case .confessions: return "Crie perguntas relacionadas a confissões profundas. Faça perguntas que obriguem o usuário a revelar segredos profundos."
        case .chaos: return "Crie perguntas que gerem brigas entre os usuários. Faça perguntas polêmicas e que gerem debate."
        case .decisions: return "Crie perguntas que façam o usuário lembrar de decisões ruins que ele já tomoi. As perguntas devem fazer o usuário relembrar o próprio passado e sentir vergonha das coisas que ele já fez."
        case .gossip: return "Crie perguntas relacionadas a fofocas. As perguntas devem fazer os usuários relembrarem fofocas pessoasi ou de famosos"
        case .situations: return "Crie perguntas relacionadas a situações aleatórias em cenários imaginários. Faça os usuários relembrarem de situações que aconteceram com eles e faça eles se questionarem sobre o que fariam caso estivessem em uma situação fictícia."
        }

    }
}
