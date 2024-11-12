//
//  String+Extensions.swift
//  Movies
//
//  Created by Jean on 12/11/24.
//

import Foundation

extension String {
    var isEmptyOrWhitespace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
