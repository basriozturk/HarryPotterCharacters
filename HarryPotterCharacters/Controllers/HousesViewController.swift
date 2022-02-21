//
//  HomeViewController.swift
//  HarryPotterCharacters
//
//  Created by Hasan Basri Ozturk on 12/07/2021.
//

import UIKit

class HousesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func gryffindorPressed(_ sender: UIButton) {
        showCharacterListView(for: .houses(house: .Gryffindor))
    }
    
    @IBAction func ravenclawPressed(_ sender: UIButton) {
        showCharacterListView(for: .houses(house: .Ravenclaw))
    }
    
    @IBAction func slytherinPressed(_ sender: UIButton) {
        showCharacterListView(for: .houses(house: .Slytherin))
    }
    
    @IBAction func hufflepuffPressed(_ sender: UIButton) {
        showCharacterListView(for: .houses(house: .Hufflepuff))
    }
    
    func showCharacterListView(for dataType: CharacterListDataTypes) {
        let vc = CharacterListViewController.instantiate(fromStoryboard: .Main)
        let viewModel = CharacterListViewModel(dataType: dataType)
        vc.viewModel = viewModel
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
