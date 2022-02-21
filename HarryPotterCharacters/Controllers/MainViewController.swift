//
//  MainViewController.swift
//  HarryPotterCharacters
//
//  Created by Hasan Basri Ozturk on 21/02/2022.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func allCharactersPressed(_ sender: UIButton) {
        showCharacterListView(for: .allCharacters)
    }
    
    @IBAction func staffPressed(_ sender: UIButton) {
        showCharacterListView(for: .staff)
    }
    
    @IBAction func studentsPressed(_ sender: UIButton) {
        showCharacterListView(for: .students)
    }
    
    @IBAction func housesPressed(_ sender: UIButton) {
        pushToHousesMenu()
    }
    
    func showCharacterListView(for dataType: CharacterListDataTypes) {
        let vc = CharacterListViewController.instantiate(fromStoryboard: .Main)
        let viewModel = CharacterListViewModel(dataType: dataType)
        vc.viewModel = viewModel
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func pushToHousesMenu() {
        let vc = HousesViewController.instantiate(fromStoryboard: .Main)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
