//
//  CharacterListViewModel.swift
//  HarryPotterCharacters
//
//  Created by Hasan Basri Ozturk on 12/07/2021.
//

import Foundation

class CharacterListViewModel: CharacterListViewModelProtocol {
    
    var characters: [Character]?
    var presentingDataType: CharacterListDataTypes
    
    init(dataType: CharacterListDataTypes) {
        self.characters = []
        self.presentingDataType = dataType
    }
    
    func loadData(completion: @escaping () -> Void) {
        fetchData(presentingDataType) { characters in
            self.characters = characters
            completion()
        }
    }
    
    func fetchData(_ forType: CharacterListDataTypes, completion: @escaping ([Character]?) -> Void) {
        ApiCall().fetchCharacterData(forType) { characters in
            completion(characters)
        }
    }
}

protocol CharacterListViewModelProtocol: AnyObject {
    var characters: [Character]? { get set }
    var presentingDataType: CharacterListDataTypes { get set }
    func loadData(completion: @escaping () -> Void)
}
