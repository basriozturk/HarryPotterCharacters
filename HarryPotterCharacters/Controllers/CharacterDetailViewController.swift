//
//  CharacterDetailViewController.swift
//  HarryPotterCharacters
//
//  Created by Hasan Basri Ozturk on 12/07/2021.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    var viewModel: CharacterDetailViewModelProtocol!
    
    @IBOutlet var name: UILabel!
    @IBOutlet var species: UILabel!
    @IBOutlet var gender: UILabel!
    @IBOutlet var dateOfBirth: UILabel!
    @IBOutlet var eyeColour: UILabel!
    @IBOutlet var hairColour: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
    }
    
    func setLabels() {
        name.text = "Name: " + viewModel.name
        species.text = "Species: " + viewModel.species
        gender.text = "Gender: " + viewModel.gender
        dateOfBirth.text = "Date of Birth: " + viewModel.dateOfBirth
        eyeColour.text = "EyeColour: " + viewModel.eyeColour
        hairColour.text = "HairColour: " + viewModel.hairColour
    }
    

}
