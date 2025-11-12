//
//  SimplifiedFilmsScreen.swift
//  MovieAppSwift
//
//  Created by Shamila Ashan Gunarathna on 2025-11-08.
//

import SwiftUI

struct SimplifiedFilmsScreen: View {
    @State private var viewModel = SimplifiedFilmsViewModel()
    
    var body: some View {
        VStack{
            switch viewModel.state {
            case .idle:
                Text("Idle")
            case .loading:
                Text("Loading")
            case .success:
                List(viewModel.films) { film in
                    List(viewModel.films) { films in
                        Text(film.title)
                    }
                }
            case .error:
                Text(viewModel.errorMessage)
            }
            
        }
    }
    
}
