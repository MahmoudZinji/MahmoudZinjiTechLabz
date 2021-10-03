//
//  ViewController.swift
//  MahmoudZinji
//
//  Created by User on 02/10/2021.
//

import UIKit
import SwiftMessages

class BaseViewController: UIViewController,Storyboarded {

    var cartLogo : UIBarButtonItem?
    var addIcon : UIBarButtonItem?
    
    open override func awakeFromNib() {
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func hideNav() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func showNav() {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Functions
    
    @objc func backTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - SwiftMessages
    
    func showSwiftErrorMessage(title: String, description: String) {
        let error = MessageView.viewFromNib(layout: .tabView)
        error.configureTheme(.error)
        error.configureContent(title: title, body: description)
        error.button?.setTitle(title, for: .normal)
        
        SwiftMessages.show(view: error)

    }
    
    func showSwiftMessage(title: String, description: String) {
        let warning = MessageView.viewFromNib(layout: .cardView)
        warning.configureTheme(.warning)
        warning.configureDropShadow()
        
//        let iconText = ["🤔", "😳", "🙄", "😶"].randomElement()!
        
        warning.configureContent(title: title, body: description, iconText: "")
        warning.button?.isHidden = true
        var warningConfig = SwiftMessages.defaultConfig
        warningConfig.duration = .seconds(seconds: 1.5)
        warningConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        warningConfig.presentationStyle = .center
        SwiftMessages.show(config: warningConfig, view: warning)
    }
    
    func showSwiftWarningMessage(title: String, description: String) {
        let warning = MessageView.viewFromNib(layout: .cardView)
        warning.configureTheme(.warning)
        warning.configureDropShadow()
        
//        let iconText = ["🤔", "😳", "🙄", "😶"].randomElement()!
        
        warning.configureContent(title: title, body: description, iconText: "")
        warning.button?.isHidden = true
        var warningConfig = SwiftMessages.defaultConfig
        warningConfig.duration = .seconds(seconds: 1.5)
        warningConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        warningConfig.presentationStyle = .center
        
        SwiftMessages.show(config: warningConfig, view: warning)
    }
    
    func showSwiftSuccessMessage(title: String, description: String) {
                
        let success = MessageView.viewFromNib(layout: .cardView)
        success.configureTheme(.success)
        success.configureDropShadow()
        success.configureContent(title: title, body: description)
        success.button?.isHidden = true
        var successConfig = SwiftMessages.defaultConfig
        successConfig.presentationStyle = .center
        successConfig.duration = .seconds(seconds: 1.5)
        successConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        
        SwiftMessages.show(config: successConfig, view: success)
    }
}

//MARK:-UIGestureRecognizerDelegate
extension BaseViewController:UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
}
