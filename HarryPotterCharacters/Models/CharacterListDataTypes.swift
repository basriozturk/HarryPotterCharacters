//
//  CharacterListDataTypes.swift
//  HarryPotterCharacters
//
//  Created by Hasan Basri Ozturk on 12/07/2021.
//

import Foundation

enum CharacterListDataTypes {
    case allCharacters
    case staff
    case students
    case houses(house: House)
    
    func getDataURLString() -> String {
        switch self {
        case .allCharacters:
            return AppConstants.allCharactersEndpoint
        case .staff:
            return AppConstants.staffEndpoint
        case .students:
            return AppConstants.studentsEndpoint
        case .houses(house: let house):
            return AppConstants.housesEndpoint + house.rawValue.lowercased()
        }
    }
    
    func getTitle() -> String {
        switch self {
        case .allCharacters:
            return AppConstants.allCharactersNavTitle
        case .staff:
            return AppConstants.staffNavTitle
        case .students:
            return AppConstants.studentsNavTitle
        case .houses(house: let house):
            return house.rawValue
        }
    }
}
