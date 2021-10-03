//
//  ViewController.swift
//  MahmoudZinji
//
//  Created by User on 02/10/2021.
//

import Foundation
import UIKit
import SVProgressHUD

class ViewController: BaseViewController {
    
    // MARK: - IBOutlet Properties
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    let viewModel = ViewModel()
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToViewModel()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Custom Methods
    private func setupUI() {
        viewModel.fetchData()
        self.hideNav()
        collectionView.register(UINib(nibName: RecipeCollectionViewCell.description(), bundle: nil), forCellWithReuseIdentifier: RecipeCollectionViewCell.description())
    }
    
    private func bindToViewModel() {
        // Show Hide Loading Indicator
        self.viewModel.isLoading.bind { (state) in
            if state == true {
                self.collectionView.startLoading(title: AppTexts.pleaseWait)
            }
            if state == true {
                SVProgressHUD.show(withStatus: AppTexts.pleaseWait)
            } else {
                SVProgressHUD.dismiss()
            }
        }
        
        self.viewModel.responseSucceded.bind { bool in
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - IBAction Methods
    
    // MARK: - Response Func
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let _ = self.viewModel.getDataForDetails(at: indexPath).name {
            
            let viewController = RecipeDetailViewController.instantiateFrom(storyboard: .Recipes)
            viewController.recipe = self.viewModel.getDataForDetails(at: indexPath)
            
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getData(at: section).receipes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.description(), for: indexPath) as? RecipeCollectionViewCell else {
            return UICollectionViewCell()
        }
        viewModel.configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfCellsInRow = 2
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: 220)
    }
}
