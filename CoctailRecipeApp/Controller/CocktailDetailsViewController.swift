//
//  CoctailDetailsViewController.swift
//  CoctailRecipeApp
//
//  Created by İsmail on 28.03.2022.
//

import UIKit
import Kingfisher

class CocktailDetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    var cocktail: Cocktail?
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = UIImage(named: "coctail_1")
        //        iv.setDimensions(height: 300, width: UIScreen.main.bounds.width)
        //        iv.layer.cornerRadius = 300 / 2
        return iv
    }()
    
    private let cocktailNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        //        label.textColor = .red
        label.textAlignment = .center
        return label
    }()
    
    private let ingredientsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.text = "Ingredients"
        return label
    }()
    
    private let ingredientsTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.textColor = .black
        tv.textAlignment = .left
        return tv
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, height: 300)
        
        cocktailNameLabel.anchor(top: imageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 24, paddingLeft: 12, paddingBottom: 12, paddingRight: 12)
        
        ingredientsLabel.anchor(top: cocktailNameLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 24, paddingLeft: 12, paddingBottom: 12)
        
        ingredientsTextView.anchor(top: ingredientsLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 24, paddingLeft: 12, paddingBottom: 12, paddingRight: 12)
    }
    
    // MARK: - Helpers
    private func configureUI() {
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        
        if let url = URL(string: cocktail?.imageSource ?? "") {
            imageView.kf.setImage(with: url)
        }
        
        cocktailNameLabel.text = cocktail?.name
        ingredientsTextView.text = "- \(cocktail?.ingredient1) \n - \(cocktail?.ingredient2) \n - \(cocktail?.ingredient3) \n - \(cocktail?.ingredient4) \n - \(cocktail?.ingredient5) \n"
        
        view.addSubview(imageView)
        view.addSubview(cocktailNameLabel)
        view.addSubview(ingredientsLabel)
        view.addSubview(ingredientsTextView)
    }
    
    
}
