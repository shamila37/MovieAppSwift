//
//  FilmDetailScreen.swift
//  MovieAppSwift
//
//  Created by Shamila Ashan Gunarathna on 2025-11-07.
//

import SwiftUI

struct FilmDetailScreen: View {
    let film: Film
    let favoritesViewModel: FavoritesViewModel
    
    @State private var viewModel = FilmDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                FilmImageView(urlPath: film.bannerImage)
                    .frame(width: 300, height: 450)
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 8)
            
//            HStack {
//                Text(film.title)
//                    .font(.title)
//                    .bold()
//                    .padding(.horizontal)
//                
//                Spacer()
                
//                FavoriteButton(filmID: film.id,
//                               favoritesViewModel: favoritesViewModel)
//                .font(.title)
//                .controlSize(.large)
//                .padding(.horizontal)
//            }
            
            VStack(alignment: .leading, spacing: 10){
                Text(film.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Divider()
                
                Grid(alignment: .leading){
                    InfoRow(label: "Director", value: film.director)
                    InfoRow(label: "Producer", value: film.producer)
                    InfoRow(label: "Release Date", value: film.releaseYear)
                    InfoRow(label: "Running Time", value: "\(film.duration) minutes")
                    InfoRow(label: "Score", value: "\(film.score)/100")
                }
                .padding()
                
                Divider()
                
                Text("Description")
                    .font(.headline)
                
                Text(film.description)

                CharacterSectionView(viewModel: viewModel)
                
            }
            .padding()
//            VStack{
//                if let score = film.score {
//                    Label("Rating: \(score)/100", systemImage: "star.fill")
//                        .foregroundColor(.yellow)
//                }
//                Spacer()
//                if let duration = film.duration {
//                    Label("Duration: \(duration) mins", systemImage: "clock")
//                }
//                Spacer()
//                if let releaseYear = film.releaseYear {
//                    Label("Release Year: \(releaseYear)", systemImage: "calendar")
//                        .foregroundColor(.gray)
//                }
//            }
//            .font(.subheadline)
//            .padding(.horizontal)
//            .padding(.bottom, 10)
            
//            Text(film.description)
//                .font(.body)
//                .padding(.horizontal)
//                .padding(.bottom, 40)
//            
//            Text("Actors : " )
//                .font(.headline)
//                .padding(.top, 20)
            
            
        }
//        .navigationTitle(film.title)
//        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchPerson(film: film)
        }
        .toolbar{
            FavoriteButton(filmID: film.id,
                           favoritesViewModel: favoritesViewModel)
        }
    }
}

fileprivate struct CharacterSectionView:  View {
    let viewModel: FilmDetailViewModel
    
    var body: some View {
        GroupBox {
            VStack(alignment: .leading, spacing: 12) {
                Text("Characters")
                    .font(.headline)
                
                switch viewModel.state {
                case .idle:
                    EmptyView()
                case .loading:
                    ProgressView()
                case .loaded(let people):
                    ForEach(people) { person in
                        Text(person.name)
                    }
                case .error(let error):
                    Text(error)
                        .foregroundStyle(.red)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}


//networking, wrappers,
