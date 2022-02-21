//
//  ImageProvider.swift
//  HarryPotterCharacters
//
//  Created by Hasan Basri Ozturk on 12/07/2021.
//

import Foundation
import UIKit

class ImageProvider {
    
    static let shared = ImageProvider()
    
    private let cache = NSCache<NSString, UIImage>()
    
    func getImage(_ urlStr: String, _ completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            if let image = self.cache.object(forKey: NSString(string: urlStr)) {
                completion(image)
            }
            guard let url = URL(string: urlStr)
            else {
                completion(UIImage(systemName: "person"))
                return
            }
            guard let data = try? Data(contentsOf: url)
            else {
                completion(UIImage(systemName: "person"))
                return
            }
            if let image = UIImage(data: data) {
                self.cache.setObject(image, forKey: NSString(string: urlStr))
                completion(image)
            }
            else {
                completion(UIImage(systemName: "person"))
            }
        }
    }
}
