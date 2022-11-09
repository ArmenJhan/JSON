//
//  ViewController.swift
//  JSON
//
//  Created by Armen Madoyan on 06.11.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         fetchAgify()
    }

    private func fetchAgify() {
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

