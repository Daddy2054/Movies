//
//  MovieListScreen.swift
//  Movies
//
//  Created by Jean on 13/11/24.
//


import SwiftUI
import SwiftData

enum Sheets: Identifiable  {
    case addMovie
    case addActor
    
    case showFilter
    var id: Int {
        hashValue
    }
}
struct MovieListScreen: View {
    
    @Environment(\.modelContext) private var context
    
//    @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
    @Query(filter:#Predicate<Movie> {$0.title.contains("man")}) private var movies: [Movie]
    @Query(sort: \Actor.name, order: .forward) private var actors: [Actor]
    
    @State private var actorName: String = ""
    
    @State private var activeSheet: Sheets?
    @State private var  filterOption: FilterOption = .none
    
    private func saveActor()    {
        let actor = Actor(name: actorName)
        context.insert(actor)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack (alignment: .firstTextBaseline) {
                Text("Movies").font(.largeTitle)
                Spacer()
                Button("Filter"){
                  activeSheet = .showFilter
                }
            }
            MovieListView(movies: movies)
            Text("Actors").font(.largeTitle)
            ActorsListView(actors: actors)
        }
        .padding()
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Add Actor") {
                        activeSheet = .addActor
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                Button("Add Movie") {
                    activeSheet = .addMovie
                }
            }
        })
            .sheet(item: $activeSheet, content: {activeSheet in
                switch activeSheet {
                case .addMovie:
                    NavigationStack {
                        AddMovieScreen()
                    }
                case .addActor:
                    Text("Add Actor").font(.largeTitle)
                    
                    TextField("Actor Name", text: $actorName)
                        .textFieldStyle(.roundedBorder)
                        .presentationDetents([.fraction(0.25)])
                        .padding()
                    Button("Save") {
                        saveActor()
                        self.activeSheet = nil
                    }
                case .showFilter:
                    FilterSelectionScreen(filterOption: $filterOption)
                }
            })
    }
}

#Preview {
    NavigationStack {
        MovieListScreen()
            .modelContainer(for: [Movie.self, Review.self, Actor.self])
    }
}
