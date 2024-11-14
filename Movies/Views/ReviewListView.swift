//
//  ReviewListView.swift
//  Movies
//
//  Created by Jean on 14/11/24.
//

import SwiftUI

struct ReviewListView: View {

    let reviews: [Review]
    
    var body: some View {
        List {
            ForEach(reviews) { review in
                VStack (alignment: .leading)              {
                    Text(review.subject)
                    Text(review.body)
                }
                
            }
        }
    }
}

#Preview {
    ReviewListView(reviews: [])
}
