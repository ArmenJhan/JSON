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
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    func configure(with product: Product) {
        nameLabel.text = product.name
        priceLabel.text = product.price
        categoryLabel.text = product.category
        
        NetworkManager.shared.fetchImage(from: Link.productURL.rawValue) { [weak self] result in
            switch result {
            case .success(let image):
                self?.productsImage.image = UIImage(data: image)
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
}
