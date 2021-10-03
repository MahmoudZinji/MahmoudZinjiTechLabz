//
//  RecipeDetailViewController.swift
//  MahmoudZinji
//
//  Created by User on 02/10/2021.
//


import Foundation
import UIKit
import GoogleMobileAds

class RecipeDetailViewController: BaseViewController {
    
    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var recipe : ReceipesModel?
    var viewModel = RecipeDetailVM()
    private var interstitial: GADInterstitialAd?
    
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Custom Methods
    private func setupUI() {
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
                               request: request, completionHandler: {
                                [self] ad, error in
                                if let error = error {
                                    print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                                    return
                                }
                                interstitial = ad
                                interstitial?.fullScreenContentDelegate = self
                               }
        )
        
        viewModel.recipe = recipe
        
        tableView.register(UINib(nibName: DirectionsTableViewCell.description(), bundle: nil), forCellReuseIdentifier: DirectionsTableViewCell.description())
        
        tableView.register(UINib(nibName: IngredientsTableViewCell.description(), bundle: nil), forCellReuseIdentifier: IngredientsTableViewCell.description())
    }
    
    // MARK: - IBAction Methods
    @IBAction func backPressed(_ sender: UIButton) {
        if interstitial != nil {
            interstitial?.present(fromRootViewController: self)
        } else {
            self.navigationController?.popViewController()
        }
    }
    
    // MARK: - Response Func
}

//MARK:-UITableViewDelegate
extension RecipeDetailViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 35
        }else if indexPath.section == 1 {
            return 75
        }else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Ingredients"
        }else if section == 1 {
            return "Directions"
        }else {
            return ""
        }
    }
}

//MARK:-UITableViewDataSource
extension RecipeDetailViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.recipe?.ingredients?.count ?? 0
        } else if section == 1 {
            return recipe?.steps?.count ?? 0
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IngredientsTableViewCell.description(), for: indexPath) as? IngredientsTableViewCell else {
                return UITableViewCell()
            }
            viewModel.configureIngredientsCell(cell: cell, index: indexPath.row)
            return cell
        }else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DirectionsTableViewCell.description(), for: indexPath) as? DirectionsTableViewCell else {
                return UITableViewCell()
            }
            viewModel.configureDirectionsCell(cell: cell, index: indexPath.row)
            return cell
        }else {
            return UITableViewCell()
        }
    }
}

//MARK: -GADFullScreenContentDelegate

extension RecipeDetailViewController: GADFullScreenContentDelegate {
    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }
    
    /// Tells the delegate that the ad presented full screen content.
    func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did present full screen content.")
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
    }
}
