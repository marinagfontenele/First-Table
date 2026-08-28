//
//  GameModel.swift
//  FirstTable
//
//  Created by Marina Gomes Fontenele on 27/08/26.
//

import Foundation
import SwiftData
import PhotosUI

@Model
class PhotoModel {
    
    @Attribute(.unique) var id = UUID()
    var name: String
    var date: String
    var image: Data
    
    init(
        name: String,
        date: String,
        image: Data
    ) {
        self.name = name
        self.date = date
        self.image = image
    }
}
