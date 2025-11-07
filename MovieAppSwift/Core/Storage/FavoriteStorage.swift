//
//  FavoriteStorage.swift
//  MovieAppSwift
//
//  Created by Shamila Ashan Gunarathna on 2025-11-07.
//

import Foundation

protocol FavoriteStorage {
    func load() -> Set<String>
    func save(favoriteIDs: Set<String>)
}
