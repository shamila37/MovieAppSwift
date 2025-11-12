//
//  InfoRow.swift
//  MovieAppSwift
//
//  Created by Shamila Ashan Gunarathna on 2025-11-08.
//

import SwiftUI

struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        GridRow {
            Text(label)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .frame(width: 100,
                       alignment: .leading)
            Text(value)
                .font(.subheadline)
        }
    }
}
