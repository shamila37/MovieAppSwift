//
//  MovieAppSwiftApp.swift
//  MovieAppSwift
//
//  Created by Shamila Ashan Gunarathna on 2025-11-07.
//

import SwiftUI
import SwiftData

@main
struct MovieAppSwiftApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Favorite.self)
        }
    }
}
