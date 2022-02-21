//
//  CharacterTableViewCell.swift
//  HarryPotterCharacters
//
//  Created by Hasan Basri Ozturk on 12/07/2021.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet var charImage: UIImageView!
    @IBOutlet var charName: UILabel!
    
    func configureCell(_ character: Character) {
        charName.text = character.name
        
        ImageProvider.shared.getImage(character.image) { image in
            DispatchQueue.main.async {
                self.charImage.image = image
            }
        }
    }

}
