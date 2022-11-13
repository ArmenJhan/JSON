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
    let rating: Double
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case image = "image_link"
        case price = "price"
        case description = "description"
        case rating = "rating"
        
    }
    
    init(name: String, image: String?, price: String, description: String, rating: Double) {
        self.name = name
        self.image = image
        self.price = price
        self.description = description
        self.rating = rating
    }
    
    init(productData: [String: Any]) {
        name = productData["name"] as? String ?? ""
        image = productData["image"] as? String ?? ""
        price = productData["price"] as? String ?? ""
        description = productData["description"] as? String ?? ""
        rating = productData["rating"] as? Double ?? 0.0
    }
    
    static func getProducts(from value: Any) -> [Product] {
        guard let productsData = value as? [[String: Any]] else { return [] }
        return productsData.map { Product(productData: $0) }
    }
}
