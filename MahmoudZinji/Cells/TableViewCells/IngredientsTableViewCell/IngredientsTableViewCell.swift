//
//  IngredientsTableViewCell.swift
//  MahmoudZinji
//
//  Created by User on 02/10/2021.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {

    @IBOutlet weak var ingredientLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override class func description() -> String {
        return "IngredientsTableViewCell"
    }
    
    
    func setIngLabel(name : String) {
        ingredientLabel.text = name
    }
}
