//
//  FilterSelectionScreen.swift
//  Movies
//
//  Created by Jean on 15/11/24.
//

import SwiftUI

enum FilterOption {
    case title(String)
    case reviewsCount(Int)
    case actorsCount(Int)
    case genre(Genre)
    case none
}

struct FilterSelectionScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @State  private var movieTitle: String = ""
    @State  private var numberOfReviews: Int?
    @State private var numberOfActors: Int?
    @State private var genre: Genre?
    @Binding var filterOption: FilterOption
    
    var body: some View {
        Form {
            Section("Filter by title") {
                TextField("Movie title", text: $movieTitle)
                    .autocapitalization(.none)
                Button("Search") {
                    filterOption = .title(movieTitle
                    )
                    dismiss()
                }
            }
            Section("Filter by number of reviews")            {
                TextField("Number of reviews", value: $numberOfReviews, format: .number).keyboardType(.numberPad)
                
                Button("Search") {
                    filterOption = .reviewsCount(numberOfReviews ?? 1 )
                    dismiss()
                }
            }
            Section("Filter by number of actors") {
                TextField("Number of actors", value: $numberOfActors, format: .number)
                    .keyboardType(.numberPad)
                Button("Search") {
                    filterOption = .actorsCount(numberOfActors ?? 1)
                    dismiss()
                }
            }
            Section("Filter by genre")        {
                Picker("Select a genre", selection: $genre)  {
                    ForEach(Genre.allCases, id: \.self) { genre in
                        Text(genre.title).tag(Optional(genre))
                    }
                }.onChange(of: genre)
                {filterOption = .genre(genre ?? .action
                )
                dismiss()
                }            }
        }
        
    }
}

#Preview {
    FilterSelectionScreen(filterOption: .constant(.title("Spiderman")))
}
