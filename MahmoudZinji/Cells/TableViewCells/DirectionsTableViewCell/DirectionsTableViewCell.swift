//
//  DirectionsTableViewCell.swift
//  MahmoudZinji
//
//  Created by User on 02/10/2021.
//

import UIKit

class DirectionsTableViewCell: UITableViewCell {

    @IBOutlet weak var mainHolderView: UIView!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var stepDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override class func description() -> String {
        return "DirectionsTableViewCell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setStepLabel(name : String) {
        stepLabel.text = name
    }
    
    func setStepDetail(name : String) {
        stepDetail.text = name
    }
}
