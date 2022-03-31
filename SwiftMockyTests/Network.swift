//
//  Network.swift
//  SwiftMockyTests
//
//  Created by Björn Roßborsky-Stoß on 31.03.22.
//

import Combine
import Foundation

protocol NetworkProtocol {
    func asyncLoad() async throws
}

class Networking: ObservableObject, NetworkProtocol {
    
    @Published private(set) var pokemonData: [Pokemon] = []
    
    private var url: URL {
        URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=5&offset=0")!
    }

    enum PokemonError: Error {
        case noData
        case serverError
    }
    @MainActor private func updateList(_ newPokemons: [Pokemon]) {
        self.pokemonData += newPokemons
    }
    
    func asyncLoad() async throws -> Void {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard (response as? HTTPURLResponse)?.statusCode == 200
        else { throw PokemonError.serverError }

        guard let decoded = try? JSONDecoder().decode(PokemonResponse.self, from: data)
        else { throw PokemonError.noData }

        await updateList(decoded.results)
    }
    
}
