//
//  Products.swift
//  JSON
//
//  Created by Armen Madoyan on 09.11.2022.
//

import Foundation

struct Product: Decodable {
    let name: String
    let image: String?
    let price: String
    let description: String
    let category: String
}
