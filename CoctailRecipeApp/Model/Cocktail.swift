//
//  Cocktail.swift
//  CoctailRecipeApp
//
//  Created by İsmail on 9.03.2022.
//

import Foundation

struct CocktailResponse: Decodable {
    let drinks: [Cocktail]
    
//    enum CodingKeys: String, CodingKey {
//        case drinks
//    }
}

struct Cocktail: Decodable {
    let idDrink: String
    let name: String
    let isAlcoholic: String
    let glass: String
    let instructions: String
    let imageSource: String
    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    let measure1: String?
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    
    enum CodingKeys: String, CodingKey {
//        case drinks
        case idDrink
        case name = "strDrink"
        case isAlcoholic = "strAlcoholic"
        case glass = "strGlass"
        case instructions = "strInstructions"
        case imageSource = "strDrinkThumb"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
    }
}



