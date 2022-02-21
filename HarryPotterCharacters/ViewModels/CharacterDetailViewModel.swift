//
//  CharacterDetailViewModel.swift
//  HarryPotterCharacters
//
//  Created by Hasan Basri Ozturk on 12/07/2021.
//

import Foundation

class CharacterDetailViewModel: CharacterDetailViewModelProtocol {
    
    let name: String
    let species: String
    let gender: String
    let dateOfBirth: String
    let eyeColour: String
    let hairColour: String
    
    init(character: Character) {
        self.name = character.name == "" ? "unknown" : character.name
        self.species = character.species == "" ? "unknown" : character.species
        self.gender = character.gender == "" ? "unknown" : character.gender
        self.dateOfBirth = character.dateOfBirth == "" ? "unknown" : character.dateOfBirth
        self.eyeColour = character.eyeColour == "" ? "unknown" : character.eyeColour
        self.hairColour = character.hairColour == "" ? "unknown" : character.hairColour
    }
    
}

protocol CharacterDetailViewModelProtocol {
    var name: String { get }
    var species: String { get }
    var gender: String { get }
    var dateOfBirth: String { get }
    var eyeColour: String { get }
    var hairColour: String { get }
}
