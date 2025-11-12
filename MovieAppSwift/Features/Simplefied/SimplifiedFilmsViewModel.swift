//
//  SimplifiedFilmsViewModel.swift
//  MovieAppSwift
//
//  Created by Shamila Ashan Gunarathna on 2025-11-08.
//

import Observation

enum SimplifiedFilmsScreenState: Equatable {
    case idle
    case loading
    case success
    case error
}

@Observable
class SimplifiedFilmsViewModel {
    var films: [Film] = []
    var errorMessage: String = ""
    var state: SimplifiedFilmsScreenState = .idle
    
    private let service: DefaultNetworkingService
    
    init() {
        service = DefaultNetworkingService()
    }
    
    func fetchFilms() async {
        state = .loading
        
        do {
            let fetchedFilms = try await service.fetchFilms()
            films = fetchedFilms
            state = .success
        } catch {
            errorMessage = "Somthing went wrong"
            state = .error
        }
    }
    
}
