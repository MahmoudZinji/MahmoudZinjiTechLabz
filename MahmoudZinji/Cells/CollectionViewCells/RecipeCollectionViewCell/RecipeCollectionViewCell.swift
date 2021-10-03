//
//  RecipeCollectionViewCell.swift
//  MahmoudZinji
//
//  Created by User on 02/10/2021.
//

import UIKit
import Kingfisher

class RecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainHolderView: UIView!
    @IBOutlet weak var imageHolderView: UIView!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeDesc: UILabel!
    @IBOutlet weak var recipeDuration: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override class func description() -> String {
        return "RecipeCollectionViewCell"
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        mainHolderView.addShadow(ofColor: UIColor.lightGray, radius: 3, offset: .zero, opacity: 0.5)
        layoutIfNeeded()
    }
    
    func setImage(image : String) {
        let imagePath = image

        let urlString = imagePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string: urlString)
        
        recipeImage.kf.setImage(with: url)
    }
    
    func setRecipeName(name : String) {
        recipeName.text = name
    }
    
    func setRecipeDuration(name : String) {
        recipeDuration.text = name
    }
    
    func setRecipeDesc(name : String) {
        recipeDesc.text = name
    }
}
