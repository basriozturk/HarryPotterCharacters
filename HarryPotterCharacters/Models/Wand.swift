//
//  Wand.swift
//  HarryPotterCharacters
//
//  Created by Hasan Basri Ozturk on 12/07/2021.
//

import Foundation

struct Wand: Decodable {
    let wood: String?
    let core: String?
    let length: NillableInt?
}

struct NillableInt: Decodable {
    let value: Int
    let hasValue: Bool
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            value = try container.decode(Int.self)
            hasValue = true
        } catch {
            hasValue = false
            value = -1
        }
    }
}
