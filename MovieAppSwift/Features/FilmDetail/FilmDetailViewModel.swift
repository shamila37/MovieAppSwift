//
//  FilmDetailViewModel.swift
//  MovieAppSwift
//
//  Created by Shamila Ashan Gunarathna on 2025-11-08.
//

import Foundation
import Observation

@Observable
class FilmDetailViewModel {
    var state: LoadingState<[Person]> = .idle
    
    private let service: NetworkService
    
    init(service: NetworkService = DefaultNetworkingService()) {
        self.service = service
    }
    
    func fetchPerson(film: Film) async {
        guard !state.isLoading else { return }

        state = .loading

        var loadedPeople: [Person] = []
        
        do {
            try await withThrowingTaskGroup(of: Person.self) { group in
                for personInfoURL in film.people {
                    group.addTask {
                        try await self.service.fetchPerson(url: personInfoURL)
                    }
                    
                    for try await person in group {
                        loadedPeople.append(person)
                    }
                }
            }
            
            state = .loaded(loadedPeople)
        } catch {
            state = .error("Somthing went wrong")
        }
    }
}
