//
//  Actor.swift
//  Movies
//
//  Created by Jean on 14/11/24.
//

import Foundation
import SwiftData

@Model
final class Actor {
    var name: String
    var movies: [Movie]
    
    init(name: String) {
        self.name = name
        self.movies = []
    }
    
}
