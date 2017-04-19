//
//  ProductTableCell.swift
//  SportsStores
//
//  Created by libo on 2017/4/5.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class ProductTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
   
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var stockSteper: UIStepper!
    
    @IBOutlet weak var stockField: UITextField!
    
    var productId: Int?
    
    var product: Product?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
