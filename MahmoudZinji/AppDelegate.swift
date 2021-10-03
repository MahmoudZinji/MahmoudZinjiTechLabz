//
//  AppDelegate.swift
//  MahmoudZinji
//
//  Created by User on 02/10/2021.
//

import UIKit
import SVProgressHUD
import GoogleMobileAds

//ca-app-pub-3808595699271505~5418250234

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        callNeededFunctions()
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
    
    //MARK: -CallAllFunctions
    private func callNeededFunctions() {
        
        setupSVProgress()
        openStartPage()
        getJsonData()
    }
    
    //MARK: -SVPROGRESS
    func setupSVProgress(){
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setForegroundColor(.black)
        SVProgressHUD.setDefaultMaskType(.gradient)
        SVProgressHUD.setFont(UIFont.systemFont(ofSize: 16))
        SVProgressHUD.setRingRadius(10)
    }
    
    //launch
    func launch(rootViewController: UIViewController) {
        let frame = UIScreen.main.bounds
        self.window = UIWindow(frame: frame)
        let nav = UINavigationController(rootViewController: rootViewController)
        self.window!.rootViewController = nav
        self.window!.makeKeyAndVisible()
    }
    
    func openStartPage() {
        launch(
            rootViewController:
                UIStoryboard(name: "Recipes", bundle: nil)
                .instantiateViewController(withIdentifier: "ViewController")
        )
        return
    }
    
    func getJsonData() {
        if let path = Bundle.main.path(forResource: "JsonData", ofType: "json") {
            do {
                
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                  if let jsonResult =
                        jsonResult as? Dictionary<String, AnyObject>,
                     let allFoods = jsonResult["AllFoods"] as? [[String:Any]]{
                            // do stuff
                    UserPreferences.allFoodsDict = allFoods
                    print("")
                    
                  }
              } catch {
                   // handle error
              }
        }
    }
}

