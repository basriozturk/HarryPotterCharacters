//
//  CharacterListViewController.swift
//  HarryPotterCharacters
//
//  Created by Sean Startin on 23/06/2021.
//

import UIKit

class CharacterListViewController: UIViewController {
    
    @IBOutlet var charactersTableview: UITableView!
    
    var activityIndicator = UIActivityIndicatorView(style: .large)
    
    var viewModel: CharacterListViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitle()
        
        createActivityInd()
        startLoadingAnimation()
        
        viewModel.loadData {
            DispatchQueue.main.async {
                self.fillCharactersTable()
            }
        }
        
        charactersTableview.dataSource = self
        charactersTableview.delegate = self
    }
    
    func setNavigationTitle() {
        self.navigationItem.title = viewModel.presentingDataType.getTitle()
    }
    
    func createActivityInd() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.isHidden = true
    }
    
    func startLoadingAnimation() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        charactersTableview.isHidden = true
    }
    
    func stopLoadingAnimation() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        charactersTableview.isHidden = false
    }
    
    func fillCharactersTable() {
        self.charactersTableview.reloadData()
        self.stopLoadingAnimation()
    }
    
}

extension CharacterListViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let characters = viewModel.characters {
            return characters.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: CharacterTableViewCell.self, for: indexPath)
        let cellViewModel = CharacterTableViewCellViewModel(cell: cell)
        if let characters = viewModel.characters {
            cellViewModel.configureCell(characters[indexPath.row])
        }
        return cell
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let characters = viewModel.characters else { return }
        let vc = CharacterDetailViewController.instantiate(fromStoryboard: .Main)
        let viewModel = CharacterDetailViewModel(character: characters[indexPath.row])
        vc.viewModel = viewModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

