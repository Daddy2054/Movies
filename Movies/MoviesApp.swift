//
//  MoviesApp.swift
//  Movies
//
//  Created by Jean on 12/11/24.
//

import SwiftUI

@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
            AddMovieScreen()
        }
        }.modelContainer(for: [Movie.self])
    }
}
