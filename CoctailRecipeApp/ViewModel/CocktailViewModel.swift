//
//  CocktailViewModel.swift
//  CoctailRecipeApp
//
//  Created by İsmail on 9.03.2022.
//

import Foundation

class CocktailViewModel {
    var allCocktails = [Cocktail]()
//    let allCocktailsURL = URL(string: APIController.allCocktailsURL)
    let allCocktailsURL = URL(string: APIController.searchByName)
    
    func fetchAllCocktails() {
        URLSession.shared.request(url: allCocktailsURL, expecting: CocktailResponse.self) { [weak self] result in
            switch result {
            case .success(let cocktails):
                self?.allCocktails = cocktails.drinks
                print("DEBUG: coctails are \(cocktails)")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // TODO: add a attributedText to display ingredients in a row by row manner
}
