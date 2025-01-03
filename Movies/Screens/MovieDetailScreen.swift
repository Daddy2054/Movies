//
//  MovieDetailScreen.swift
//  Movies
//
//  Created by Jean on 13/11/24.
//

import SwiftUI
import SwiftData

struct MovieDetailScreen: View {
    @Environment(\.modelContext) private var context
    let movie: Movie
    
    @State private var title: String = ""
    @State private var year: Int?
    @State private var showReviewScreen: Bool = false
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)
            Button("Update") {
                guard let year = year else { return }
                
                movie.title = title
                movie.year = year
                
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
                
            }.buttonStyle(.borderless)
            
            Section("Reviews") {
                Button(action: {
                    showReviewScreen = true
                },  label: {
                    Image(systemName: "plus")
                        .frame(maxWidth: .infinity, alignment: .center
                        )
                }
                )
                if movie.reviews.isEmpty  {
                    ContentUnavailableView
                    {
                        Text("No reviews yet")
                    }
                }else {
                    ReviewListView( movie: movie)}
            }
            
            Section("Actors") {
                
                if movie.actors.isEmpty {
                    ContentUnavailableView
                    {
                        Text("No actors yet")
                    }
                }else {
                    
                    List(movie.actors) { actor in
                        ActorCellView(actor: actor)                }
                }
                
            }
        }.onAppear{
            title = movie.title
            year = movie.year
            
        }.sheet(isPresented: $showReviewScreen) {
            NavigationStack
            {
                AddReviewScreen(movie: movie)
            }
        }
    }
}

struct  MovieDetailContainerScreen: View {
    
    @Environment(\.modelContext) private var context
    @State private var movie: Movie?
    
    var body: some View {
        ZStack{
            if let movie {
                MovieDetailScreen(movie:  movie)
            }
        }
        .onAppear {
            movie = Movie(title: "Spiderman" , year: 2023, genre: .action)
            context.insert(movie!)
        }
    }
}
#Preview {
    MovieDetailContainerScreen()
        .modelContainer(for: [Movie.self])
}
