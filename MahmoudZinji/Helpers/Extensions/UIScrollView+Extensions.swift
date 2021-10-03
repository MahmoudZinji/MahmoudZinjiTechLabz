//
//  UIButton Extensions.swift
//  Storzati
//
//  Created by User on 26/04/2021.
//

import Foundation
import UIKit
import EmptyDataSet_Swift

extension UIScrollView {

    func showEmptyDataSet(title: String = "",
                          description: String = "",
                          buttonTitle: String?,
                          image: UIImage = UIImage(),
                          backgroundColor: UIColor = UIColor.clear,
                          customButtonImage: UIImage? = nil,
                          verticalOffset:CGFloat=0,
                          onButtonPressed: (()->())? = nil) {
        
        let titleAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0).bold]
        let titleString = NSAttributedString(string: title, attributes: titleAttributes)
        let descriptionAttribues = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16).bold]
        let detailString = NSAttributedString(string: description, attributes: descriptionAttribues)
        let buttonTitleAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0).bold,
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        
        let buttontitleString = NSAttributedString(string: (buttonTitle==nil ? "":buttonTitle!), attributes: buttonTitleAttributes)
        //capInsets
        let _ = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        
        //rectInsets
        let _ = UIEdgeInsets(top: 0, left: -50, bottom: 0, right: -50)
        var buttonImage:UIImage = UIImage()
        if customButtonImage != nil {
            buttonImage = customButtonImage!
        } else {
            if buttonTitle != nil {
                // buttonImage = (UIImage.init(named: "albania-backgroumd-button")?.resizableImage(withCapInsets: capInsets, resizingMode: .stretch).withAlignmentRectInsets(rectInsets))!
            }

        }
        emptyDataSetView { view in
            view.titleLabelString(titleString)
                .detailLabelString(detailString)
                .image(image)
                .dataSetBackgroundColor(backgroundColor)
                .buttonTitle(buttontitleString, for: .normal)
                .buttonImage(buttonImage, for: .normal)
//                .buttonBackgroundImage(buttonImage, for: .normal)
                .shouldFadeIn(true)
                .isTouchAllowed(true)
                .isScrollAllowed(false)
                .verticalSpace(18)
                .verticalOffset(verticalOffset)
                .isImageViewAnimateAllowed(false)
                .didTapDataButton {
                    onButtonPressed?()
                }
        }
        reloadEmptyDataSet()
    }

    func startLoading(title: String? = nil) {
        var titleAttributedString:NSAttributedString?
        if let title = title {
            let titleAttributes = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18).bold]
            titleAttributedString = NSAttributedString(string: title, attributes: titleAttributes)
        }

        let animation = CABasicAnimation.init(keyPath: "transform")
        animation.fromValue = NSValue.init(caTransform3D: CATransform3DIdentity)
        animation.toValue = NSValue.init(caTransform3D: CATransform3DMakeRotation(.pi/2, 0.0, 0.0, 1.0))
        animation.duration = 0.25
        animation.isCumulative = true
        animation.repeatCount = MAXFLOAT
        emptyDataSetView { view in
            view.titleLabelString(titleAttributedString)
                .image(UIImage.init(named: "loadingGold"))
//                .image(UIImage.init(named: "Loading Background Image"))
                .imageAnimation(animation)
                .dataSetBackgroundColor(UIColor.clear)
                .shouldFadeIn(true)
                .verticalSpace(18)
                .isTouchAllowed(true)
                .isScrollAllowed(false)
                .isImageViewAnimateAllowed(true)
        }
        reloadEmptyDataSet()
    }
}
