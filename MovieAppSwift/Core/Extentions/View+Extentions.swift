//
//  View+Extentions.swift
//  MovieAppSwift
//
//  Created by Shamila Ashan Gunarathna on 2025-11-08.
//

import SwiftUI

extension View {
    func setAppearenceTheme() -> some View {
        modifier(AppearenceThemeViewModifiers() )
    }
}

struct AppearenceThemeViewModifiers: ViewModifier {
    @AppStorage("appearanceTheme")
    private var appearanceTheme: AppearanceTheme = .system
    
    func body(content: Content) -> some View {
        content
            .preferredColorScheme(colorScheme())
    }
    
    func colorScheme() -> ColorScheme? {
        switch appearanceTheme {
        case .system:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
    
    
}
