

import Foundation

struct UserPreferences {

    static var allFoods : Array<Any> {
        set {
            UserDefaults.standard.set(newValue, forKey: "allFoods")
            UserDefaults.standard.synchronize()
        }
        get {
              let userInfo = UserDefaults.standard.value(forKey: "allFoods")  ?? ""
              return userInfo as! Array
        }
        
        //let allFoods = AllFoodsModel.init(JSONString: UserPreferences.allFoods)
        //UserPreferences.allFoods = userObject.toJSONString(prettyPrint: true) ?? ""
    }
    
    static var allFoodsResponse : String {

        set {
            UserDefaults.standard.set(newValue, forKey: "allFoodsResponse")
            UserDefaults.standard.synchronize()
        }
        get {
              let userInfo = UserDefaults.standard.value(forKey: "allFoodsResponse")  ?? ""
            return userInfo as! String
        }
        
        //let allFoods = AllFoodsModel.init(JSONString: UserPreferences.userInfo)
        //UserPreferences.allFoodsResponse = userObject.toJSONString(prettyPrint: true) ?? ""
    }
    
    static var allFoodsDict : [[String : Any]]? {

        set {
            UserDefaults.standard.set(newValue, forKey: "allFoodsDict")
            UserDefaults.standard.synchronize()
        }
        get {
              let userInfo = UserDefaults.standard.value(forKey: "allFoodsDict")  ?? ""
            return userInfo as? [[String : Any]]
        }
    }
}
