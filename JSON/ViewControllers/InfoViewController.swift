//
//  InfoViewController.swift
//  JSON
//
//  Created by Armen Madoyan on 12.11.2022.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var infoTextView: UITextView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var info: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTextView.text = info.description
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchImage()

    }
    
    @IBAction func cancelAction() {
        dismiss(animated: true)
    }
    
    private func fetchImage() {
        NetworkManager.shared.fetchImage(from: Link.productURL.rawValue) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.imageView.image = UIImage(data: imageData)
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
