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
        
        return cell
    }
    
}

// MARK: - Networking
extension MainViewController {
    private func fetchProduct() {
        NetworkManager.shared.fetch([Product].self, from: "https://mockyard.herokuapp.com/products") { [weak self] result in
            switch result{
            case .success(let products):
                print(products)
        
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
//        guard let url = URL(string: "https://mockyard.herokuapp.com/products") else { return }
//
//        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No error discription")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                self?.products = try decoder.decode([Product].self, from: data)
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//            } catch let error {
//                print(error.localizedDescription)
//            }
//        }.resume()
    }
   
}
