//
//  ViewModel.swift
//  MahmoudZinji
//
//  Created by User on 02/10/2021.
//


import Foundation
import UIKit

class ViewModel {

    // MARK: - Closures
    var isLoading:Dynamic<Bool> = Dynamic(false)
    var isError:Dynamic<(String,String)> = Dynamic(("",""))
    
    var responseSucceded : Dynamic<(Bool)> = Dynamic(false)
    
    // MARK: - Properties
    
    var array : [AllFoodsModel] = []
    
    var numberOfItems: Int {
        return array.count
    }

    // MARK: - Fetching functions
    
    func fetchData() {
        ServiceLayer.request(router: .getHomePageData)  { (result : Result<BaseModel<AllFoodsModel>, Error>) in
            
            self.isLoading.value = false
            
            switch result {
            case .success(let baseModel):
                if let data = baseModel.arrayData {
                    self.array = data
                    self.responseSucceded.value = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Retieve Data
    
    func getData( at index: Int ) -> AllFoodsModel {
        
        return array[index]
    }
    
    func getDataForDetails( at indexPath: IndexPath ) -> ReceipesModel {
        
        return (array[indexPath.section].receipes?[indexPath.row])!
    }

    // MARK: - Retieve Datan

    func configureCell(cell : RecipeCollectionViewCell, indexPath : IndexPath) {
        let item = self.array[indexPath.section].receipes?[indexPath.row]
        
        if let image = item?.imageurl {
            cell.setImage(image: image)
        }
        
        if let name = item?.name {
            cell.setRecipeName(name: name)
        }
        
        if let duration = item?.timetoprepare {
            cell.setRecipeDuration(name: duration)
        }
        
        if let desc = item?.smalldescription {
            cell.setRecipeDesc(name: desc)
        }
    }
}

