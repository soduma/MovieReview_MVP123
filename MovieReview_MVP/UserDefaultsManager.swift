//
//  UserDefaultsManager.swift
//  MovieReview_MVP
//
//  Created by 장기화 on 2022/01/25.
//

import Foundation

protocol UserDefaultsManagerProtocol {
    func getMovies() -> [Movie]
    func addMovie(_ newValue: Movie)
    func removeMovie(_ value: Movie)
}

struct UserDefaultsManager: UserDefaultsManagerProtocol {
    enum Key: String {
        case movie
    }
    
    func getMovies() -> [Movie] {
        guard let data = UserDefaults.standard.data(forKey: Key.movie.rawValue) else { return [] }
        return (try? PropertyListDecoder().decode([Movie].self, from: data)) ?? []
    }
    
    func addMovie(_ newValue: Movie) {
        var currentMovies: [Movie] = getMovies()
        currentMovies.insert(newValue, at: 0)
        
        saveMovie(currentMovies)
    }
    
    func removeMovie(_ value: Movie) {
        let currentMovies: [Movie] = getMovies()
        let newValue = currentMovies.filter { $0.title != value.title }
        
        saveMovie(newValue)
    }
    
    private func saveMovie(_ value: [Movie]) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: Key.movie.rawValue)
    }
}
