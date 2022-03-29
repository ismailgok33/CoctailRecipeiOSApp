//
//  CocktailViewModel.swift
//  CoctailRecipeApp
//
//  Created by İsmail on 9.03.2022.
//

import UIKit

class CocktailViewModel {
//    var allCocktails = [Cocktail]()
//    let allCocktailsURL = URL(string: APIController.searchByName)
//
//    func fetchAllCocktails() {
//        URLSession.shared.request(url: allCocktailsURL, expecting: CocktailResponse.self) { [weak self] result in
//            switch result {
//            case .success(let cocktails):
//                self?.allCocktails = cocktails.drinks
//                print("DEBUG: coctails are \(cocktails)")
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    // MARK: - Properties
    
    let cocktail: Cocktail
    
    var ingredients: NSAttributedString {
        
        let ingredients = NSMutableAttributedString(string: cocktail.ingredient1 != nil ? "- \(cocktail.ingredient1!) - \(cocktail.measure1!)" : "No ingredients", attributes: [.font: UIFont.systemFont(ofSize: 18)])
        
        if let ingredient2 = cocktail.ingredient2, !ingredient2.isEmpty {
            let measure: String = "- \(cocktail.measure2 == "" ? "optional" : (cocktail.measure2 ?? "optional"))"
            
            ingredients.append(NSAttributedString(string: "\n- \(ingredient2) \(measure)", attributes: [.font: UIFont.systemFont(ofSize: 18)]))
        }
        
        if let ingredient3 = cocktail.ingredient3, !ingredient3.isEmpty {
            let measure: String = "- \(cocktail.measure3 == "" ? "optional" : (cocktail.measure3 ?? "optional"))"
            ingredients.append(NSAttributedString(string: "\n- \(ingredient3) \(measure)", attributes: [.font: UIFont.systemFont(ofSize: 18)]))
        }
        
        if let ingredient4 = cocktail.ingredient4, !ingredient4.isEmpty {
            let measure: String = "- \(cocktail.measure4 == "" ? "optional" : (cocktail.measure4 ?? "optional"))"
            ingredients.append(NSAttributedString(string: "\n- \(ingredient4) \(measure)", attributes: [.font: UIFont.systemFont(ofSize: 18)]))
        }
        
        if let ingredient5 = cocktail.ingredient5, !ingredient5.isEmpty {
            let measure: String = "- \(cocktail.measure5 == "" ? "optional" : (cocktail.measure5 ?? "optional"))"
            ingredients.append(NSAttributedString(string: "\n- \(ingredient5) \(measure)", attributes: [.font: UIFont.systemFont(ofSize: 18)]))
        }
        return ingredients
    }
    
    
    // MARK: - Initializer
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
    }
    
    
    
    // TODO: add a attributedText to display ingredients in a row by row manner
}
