//
//  ProductsCell.swift
//  JSON
//
//  Created by Armen Madoyan on 09.11.2022.
//

import UIKit

class ProductsCell: UITableViewCell {

    @IBOutlet var productsImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    
    func configure(with product: Product) {
        nameLabel.text = product.name
        priceLabel.text = product.price
        categoryLabel.text = product.category
        
        guard let imageURL = URL(string: product.image ?? "") else { return }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async { [weak self] in
                self?.productsImage.image = UIImage(data: imageData)
            }
        }
    }
}
