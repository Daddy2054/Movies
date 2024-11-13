//
//  Movie.swift
//  Movies
//
//  Created by Jean on 12/11/24.
//

import Foundation
import SwiftData



@Model
final class Movie{
var title: String
  var year: Int
    
    
    init(title: String, year: Int){
        self.title = title
        self.year = year
    }
}
