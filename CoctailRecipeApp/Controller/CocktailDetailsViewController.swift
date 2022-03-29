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
    
    var cocktail: Cocktail? = nil
    var viewModel: CocktailViewModel? = nil
    
    private let scrollView: UIScrollView = {
       let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
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
    
    lazy var ingredientsTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont(name: "Verdana", size: 18)
//        tv.textColor = .black
        tv.textAlignment = .left
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.contentInsetAdjustmentBehavior = .automatic
        return tv
    }()
    
    private let ingredientsHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.text = "Instructions"
        return label
    }()
    
    private let instructionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 18)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
//        navigationController?.navigationBar.prefersLargeTitles = false
        
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.fillSuperview()
        
//        imageView.setDimensions(height: 300, width: UIScreen.main.bounds.width)
        imageView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, height: 300)

        cocktailNameLabel.anchor(top: imageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 24, paddingLeft: 12, paddingBottom: 12, paddingRight: 12)

        ingredientsLabel.anchor(top: cocktailNameLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 24, paddingLeft: 12, paddingBottom: 12)

        ingredientsTextView.anchor(top: ingredientsLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 12, paddingRight: 12)
        
        ingredientsHeaderLabel.anchor(top: ingredientsTextView.bottomAnchor, left: view.leftAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 0)
        
        instructionsLabel.anchor(top: ingredientsHeaderLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 12)
        
    }
    
    // MARK: - Helpers
    private func configureUI() {
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        
        if let url = URL(string: cocktail?.imageSource ?? "") {
            imageView.kf.setImage(with: url)
        }
        
        cocktailNameLabel.text = cocktail?.name
        if let viewModel = viewModel {
            ingredientsTextView.attributedText = viewModel.ingredients
        }
        instructionsLabel.text = cocktail?.instructions ?? "No instructions"
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(cocktailNameLabel)
        scrollView.addSubview(ingredientsLabel)
        scrollView.addSubview(ingredientsTextView)
        scrollView.addSubview(ingredientsHeaderLabel)
        scrollView.addSubview(instructionsLabel)
        
//        let stack = UIStackView(arrangedSubviews: [imageView, cocktailNameLabel, ingredientsLabel, ingredientsTextView])
//        stack.axis = .vertical
//        stack.alignment = .leading
//        stack.spacing = 10
//        stack.distribution = .fillProportionally
        
//        view.addSubview(stack)
//        stack.fillSuperview()
    }
    
    
}
