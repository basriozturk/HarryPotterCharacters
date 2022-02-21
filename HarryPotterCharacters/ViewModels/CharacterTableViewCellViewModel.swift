//
//  CharacterCellViewModel.swift
//  HarryPotterCharacters
//
//  Created by Hasan Basri Ozturk on 12/07/2021.
//

import Foundation

class CharacterTableViewCellViewModel {
    
    let cell: CharacterTableViewCell
    
    init(cell: CharacterTableViewCell) {
        self.cell = cell
    }
    
    func configureCell(_ character: Character) {
        cell.configureCell(character)
    }
}
