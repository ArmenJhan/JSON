//
//  MainViewController.swift
//  JSON
//
//  Created by Armen Madoyan on 09.11.2022.
//

import UIKit

class MainViewController: UITableViewController {
    
    private var populations: [Data] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataUSA()
    }
    
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        populations.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UsaCell
        let population = populations[indexPath.row]
        
        cell.configure(with: population)
        
        return cell
    }
    
}

// MARK: - Networking
extension MainViewController {
    private func fetchDataUSA() {
        guard let url = URL(string: "https://datausa.io/api/data?drilldowns=Nation&measures=Population") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data =  data else {
                print(error?.localizedDescription ?? "No error")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let agify = try decoder.decode(DataUsa.self, from: data)
                print(agify)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
