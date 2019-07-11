//
//  CustomerTableViewCell.swift
//  Customernew
//
//  Created by Jordan Capa on 7/11/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var birthdateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func loadData(customer: Customer){
        self.nameLabel.text = customer.name
        self.surnameLabel.text = customer.surname
        self.ageLabel.text = customer.age
        self.birthdateLabel.text = customer.birthdate
    }
    
}
