//
//  ReviewListView.swift
//  Movies
//
//  Created by Jean on 14/11/24.
//

import SwiftUI

struct ReviewListView: View {
    @Environment(\.modelContext) private var context
    
    let reviews: [Review]
    
    private func deleteReview(indexSet: IndexSet) {
        indexSet.forEach { index in
            let review = reviews[index]
        context.delete(review)
        }
        
        do {
            try context.save()
            
        } catch {
            print("Error saving: \(error)")
        }
    }
    var body: some View {
        List {
            ForEach(reviews) { review in
                VStack (alignment: .leading)              {
                    Text(review.subject)
                    Text(review.body)
                }
                
            }.onDelete(perform: deleteReview)        }
    }
}

#Preview {
    ReviewListView(reviews: [])
        .modelContainer(for: [Review.self, Movie.self])
}
