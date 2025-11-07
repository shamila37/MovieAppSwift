//
//  Favorite.swift
//  MovieAppSwift
//
//  Created by Shamila Ashan Gunarathna on 2025-11-07.
//

import SwiftData

@Model
final class Favorite {
    @Attribute(.unique) var filmID: String

    init(filmID: String) {
        self.filmID = filmID
    }
}
