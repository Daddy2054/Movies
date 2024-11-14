//
//  ActorListView.swift
//  Movies
//
//  Created by Jean on 14/11/24.
//

import SwiftUI

struct ActorsListView: View {
    let actors: [Actor]

    var body: some View {
        List(actors) { actor in
            Text(actor.name)
        }
    }
}

#Preview {
    ActorsListView(actors: [])
}
