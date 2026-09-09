//
//  TutorialModel.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 03/09/26.
//
import SwiftData
import PhotosUI

enum Onboarding: String, CaseIterable, Identifiable {
    case introduction;
    case configuration;
    case theme;
    case rule;
    case surprise;
    case memory;
    
    var id: String { self.rawValue }
    
    var title: String {
        switch self {
        case .introduction: return "Quebra o gelo, cria memórias"
        case .configuration: return "Configure em segundos"
        case .theme: return "Escolha os temas"
        case .rule: return "Sem pressa, sem regras"
        case .surprise: return "Cuidado com as surpresas"
        case .memory: return "Leve uma lembrança"
        }
    }
    
    var subtitle: String {
        switch self {
        case .introduction: return "Perguntas pensadas para o seu grupo."
        case .configuration: return "Nome do grupo, quantidade de perguntas e um resumo de vocês."
        case .theme: return "As perguntas se adaptam ao que vocês curtem falar."
        case .rule: return "Leiam, conversem e passem para a próxima quando quiserem."
        case .surprise: return "De vez em quando, uma pergunta vira desafio de foto."
        case .memory: return "No fim, as fotos viram um template prontinho para compartilhar."
        }
    }
    
    var imageName: ImageResource {
        switch self {
        case .introduction: return .introductionOnboarding
        case .configuration: return .configurationOnboarding
        case .theme: return .themesOnboarding
        case .rule: return .ruleOnboarding
        case .surprise: return .surpriseOnboarding
        case .memory: return .memoryOnboarding
        }
    }
}
