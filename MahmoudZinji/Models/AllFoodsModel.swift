//
//  AllFoodsModel.swift
//  MahmoudZinji
//
//  Created by User on 02/10/2021.
//

import UIKit
import ObjectMapper

class AllFoodsModel : Mappable {
    
    var categoryName : String?
    var receipes : [ReceipesModel]?

    required init?(map: Map) {

    }

    func mapping(map: Map) {

        categoryName <- map["categoryName"]
        receipes <- map["receipes"]
    }
}
