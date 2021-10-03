//
//  RecipeDetailVM.swift
//  MahmoudZinji
//
//  Created by User on 02/10/2021.
//


import Foundation
import UIKit

class RecipeDetailVM {

    // MARK: - Closures
    var isLoading:Dynamic<Bool> = Dynamic(false)
    var isError:Dynamic<(String,String)> = Dynamic(("",""))
    
    // MARK: - Properties
    var recipe : ReceipesModel?
    
    private var array : [String] = []
    
    var numberOfItems: Int {
        return array.count
    }

    // MARK: - Fetching functions
    
    func fetchData() {

    }
    
    // MARK: - Retieve Data
    
    func getData( at indexPath: IndexPath ) -> String {
        return array[indexPath.row]
    }

    // MARK: - Retieve Data

    func configureIngredientsCell(cell : IngredientsTableViewCell, index : Int) {
        let item = self.recipe?.ingredients?[index]
        
        if let ingredient = item {
            cell.setIngLabel(name: ingredient)
        }
    }
    
    func configureDirectionsCell(cell : DirectionsTableViewCell, index : Int) {
        let item = self.recipe?.steps?[index]
        
        if let step = item {
            cell.setStepLabel(name: "Step \(index + 1)")
            cell.setStepDetail(name: step)
        }
    }
}

