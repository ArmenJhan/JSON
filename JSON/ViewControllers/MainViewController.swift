//
//  MainViewController.swift
//  JSON
//
//  Created by Armen Madoyan on 09.11.2022.
//

import UIKit

class MainViewController: UITableViewController {
    
    private var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        fetchProduct()
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? ProductsCell else { return UITableViewCell() }
        let product = products[indexPath.row]
       
        cell.configure(with: product)
        cell.activityIndicator.startAnimating()
        cell.activityIndicator.hidesWhenStopped = true
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let infoVC = segue.destination as? InfoViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return}
        infoVC?.info = products[indexPath.row]
        
    }
}

// MARK: - Networking
extension MainViewController {
    private func fetchProduct() {
        NetworkManager.shared.fetch([Product].self, from: Link.productURL.rawValue) { [weak self] result in
            switch result{
            case .success(let products):
                self?.products = products
                self?.tableView.reloadData()
                print(products)
        
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
