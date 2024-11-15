//
//  Genre.swift
//  Movies
//
//  Created by Jean on 15/11/24.
//

import Foundation

enum Genre: Int, Codable, CaseIterable, Identifiable {
    var id: Int {
        rawValue
    }
    
    case action = 1
    case horror
    case kids
    case fiction
}

extension Genre  {
    
    var title: String
    {
        switch self {
        case .action: return "Action"
        case .horror: return "Horror"
        case .kids: return "Kids"
        case .fiction: return "Fiction"
        }
    }
    
}
