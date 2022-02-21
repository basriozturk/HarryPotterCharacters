//
//  Character.swift
//  HarryPotterCharacters
//
//  Created by Hasan Basri Ozturk on 12/07/2021.
//

import Foundation

struct Character: Decodable {
    let name: String
    let species: String
    let gender: String
    let house: House
    let dateOfBirth: String
    let yearOfBirth: NillableInt
    let ancestry: String
    let eyeColour: String
    let hairColour: String
    let wand: Wand
    let patronus: String
    let hogwartsStudent: Bool
    let hogwartsStaff: Bool
    let actor: String
    let alive: Bool
    let image: String
}

enum House: String, Decodable {
    case Gryffindor
    case Slytherin
    case Hufflepuff
    case Ravenclaw
    case none = ""
}
