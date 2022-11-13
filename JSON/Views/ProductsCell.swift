//
//  ProductsCell.swift
//  JSON
//
//  Created by Armen Madoyan on 09.11.2022.
//

import UIKit

class ProductsCell: UITableViewCell {
    
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    func configure(with product: Product) {
        nameLabel.text = product.name
        priceLabel.text = product.price
        categoryLabel.text = product.rating.formatted()
        
        NetworkManager.shared.fetchData(from: Link.imageURL.rawValue) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.productImage?.image = UIImage(data: imageData)
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
}
