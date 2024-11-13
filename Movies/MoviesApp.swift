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
            MovieListScreen()
        }
        }.modelContainer(for: [Movie.self])
    }
}
