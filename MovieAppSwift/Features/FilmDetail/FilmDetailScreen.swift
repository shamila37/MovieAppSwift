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
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                FilmImageView(urlPath: film.bannerImage)
                    .frame(width: 300, height: 450)
//                AsyncImage(url: URL(string: film.bannerImage)) { image in
//                    image
//                        .resizable()
//                        .scaledToFill()
//                        .cornerRadius(12)
//                        .shadow(radius: 5)
//                        .padding(5)
//                }placeholder: {
//                    ProgressView()
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 8)
                
                HStack {
                    Text(film.title)
                        .font(.title)
                        .bold()
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    FavoriteButton(filmID: film.id,
                                   favoritesViewModel: favoritesViewModel)
                    .font(.title)
                    .controlSize(.large)
                    .padding(.horizontal)
                }
            
                HStack{
                    if let score = film.score {
                        Label("Rating: \(score)", systemImage: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    Spacer()
                    if let duration = film.duration {
                        Label("Duration: \(duration) mins", systemImage: "clock")
                    }
                    Spacer()
                    if let releaseYear = film.releaseYear {
                        Label("Release Year: \(releaseYear)", systemImage: "calendar")
                            .foregroundColor(.gray)
                    }
                }
                .font(.subheadline)
                .padding(.horizontal)
                .padding(.bottom, 10)
                
                Text(film.description)
                    .font(.body)
                    .padding(.horizontal)
                    .padding(.bottom, 40)
            
                Button(action: {
                    // TODO: open trailer link or show alert
                }) {
                    HStack {
                        Image(systemName: "play.circle.fill")
                        Text("Watch Trailer")
                    }
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.15))
                    .cornerRadius(12)
                }
                .padding(.horizontal)

            }
            .navigationTitle(film.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
//}
