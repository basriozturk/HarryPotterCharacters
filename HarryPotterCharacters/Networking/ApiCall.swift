//
//  ApiCall.swift
//  HarryPotterCharacters
//
//  Created by Hasan Basri Ozturk on 12/07/2021.
//

import Foundation
import Alamofire

class ApiCall {
    
    func fetchCharacterData(_ ofType: CharacterListDataTypes, completion: @escaping ([Character]?) -> Void) {
        let request = AF.request(ofType.getDataURLString())
        
        request.responseDecodable(of: [Character].self) { response in
            if response.error != nil {
                completion(nil)
                return
            }
            
            guard let response = response.value else {
                completion(nil)
                return
            }
            
            let sortedResponse = self.sortCharacterListByName(response)
            completion(sortedResponse)
        }
    }
    
    func sortCharacterListByName(_ list: [Character]) -> [Character] {
        return list.sorted { $0.name < $1.name }
    }
}
