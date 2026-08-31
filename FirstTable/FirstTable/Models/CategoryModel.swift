//
//  CategoryModel.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 28/08/26.
//

import Foundation
import SwiftData

@Model
class CategoryModel {
    
    @Attribute(.unique) var id = UUID()
    var name: String
    var info: String
    
    init(
        name: String,
        info: String
    ) {
        self.name = name
        self.info = info
    }
}
