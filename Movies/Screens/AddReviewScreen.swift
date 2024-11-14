//
//  AddReviewScreen.swift
//  Movies
//
//  Created by Jean on 13/11/24.
//

import SwiftUI
import SwiftData

struct AddReviewScreen: View {
    
    @Environment(\.dismiss)  private var dismiss
    @Environment(\.modelContext) private var context
    let movie: Movie
    @State private var subject: String = ""
    @State private var description: String = ""
    
    private var isFormValid: Bool {
        !subject.isEmptyOrWhitespace && !description.isEmptyOrWhitespace }
    
    var body: some View {
        Form {
            TextField("Subject", text: $subject)
            TextField("Body", text: $description)
        }.navigationTitle("Add Review")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let review = Review(subject: subject,  body:  description)
                        review.movie = movie
                        context.insert(review)
                        
                        do {
                            try context.save()
                            movie.reviews.append(review)
                            dismiss()
                            
                        } catch {
                            print("Error saving review: \(error)")
                        }
                    }.disabled(!isFormValid)
                }
            }}
}

//#Preview {
//    AddReviewScreen()
//}
