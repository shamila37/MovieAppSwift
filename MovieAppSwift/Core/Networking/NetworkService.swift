//
//  NetworkService.swift
//  MovieAppSwift
//
//  Created by Shamila Ashan Gunarathna on 2025-11-07.
//

import Foundation

protocol NetworkService: Sendable {
    func fetchFilms() async throws -> [Film]
    func fetchPerson(url: String) async throws -> Person
//    func searchFilm(for searchTerm: String) async throws -> [Film]
}
