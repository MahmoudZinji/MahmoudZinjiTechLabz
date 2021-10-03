//
//  ReceipesModel.swift
//  MahmoudZinji
//
//  Created by User on 02/10/2021.
//

import UIKit
import ObjectMapper

class ReceipesModel : Mappable {
    
    var name : String?
    var imageurl : String?
    var timetoprepare : String?
    var smalldescription : String?
    var ingredients : [String]?
    var steps : [String]?

    required init?(map: Map) {

    }

    func mapping(map: Map) {

        name <- map["name"]
        imageurl <- map["imageurl"]
        timetoprepare <- map["timetoprepare"]
        smalldescription <- map["smalldescription"]
        ingredients <- map["ingredients"]
        steps <- map["steps"]
    }
}
