//
//  UsaCell.swift
//  JSON
//
//  Created by Armen Madoyan on 09.11.2022.
//

import UIKit

class UsaCell: UITableViewCell {

    @IBOutlet var nationLebel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var populationLabel: UILabel!
    
    func configure(with data: Data) {
        nationLebel.text = data.nation
        yearLabel.text = data.year
        populationLabel.text = data.population.formatted()
    }

}
