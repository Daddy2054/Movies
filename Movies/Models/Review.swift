//
//  Review.swift
//  Movies
//
//  Created by Jean on 13/11/24.
//

import Foundation
import SwiftData

@Model
final class Review {
    var subject: String
    var body: String
    var movie: Movie?
    
    init(subject: String, body: String) {
        self.subject = subject
        self.body = body
    }
    
}
