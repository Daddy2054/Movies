//
//  MovieListView.swift
//  Movies
//
//  Created by Jean on 13/11/24.
//

import SwiftUI
import SwiftData


struct MovieListView: View {
    
    @Query private var movies: [Movie]
    
    let filterOption: FilterOption
    init(filterOption: FilterOption = .none) {
        self.filterOption = filterOption
        
        switch self.filterOption {
        case .title(let movieTitle):
            _movies = Query(filter: #Predicate<Movie> { $0.title.localizedStandardContains(movieTitle) } )
            
        case .none:
            _movies = Query()
        case .reviewsCount(let numberOfReviews):
            _movies = Query(filter: #Predicate<Movie> { $0.reviews.count >= numberOfReviews } )
        case .actorsCount(let numberOfActors):
            _movies = Query(filter: #Predicate { $0.actors.count >= numberOfActors })
            
        case .genre(let genre):
            _movies = Query(filter: #Predicate<Movie> { $0.genreId == genre.id })
       
        }
        
    }
    
    @Environment(\.modelContext) private var context

    private func deleteMovie(indexSet: IndexSet) {
        indexSet.forEach { index in
            let movie = movies[index]
            context.delete(movie)
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    var body: some View {
        List {
            ForEach(movies) { movie in
                NavigationLink(value: movie) {
                    
                    HStack(alignment: .firstTextBaseline) {
                        VStack(alignment: .leading) {
                            Text(movie.title)
                            Text(movie.genre.title)
                            Text("Number of reviews: \(movie.reviewsCount)")
                                .font(.caption)
                            Text("Number of actors: \(movie.actorsCount)")
                                .font(.caption)
                        }
                        Spacer()
                        Text(movie.year.description)
                    }
                    
                }
            }.onDelete(perform: deleteMovie)
        }.navigationDestination(for: Movie.self) { movie in
            MovieDetailScreen(movie: movie)
        }
    }
}

#Preview {
    MovieListView(filterOption: .none)
        .modelContainer(for: [Movie.self])

}
