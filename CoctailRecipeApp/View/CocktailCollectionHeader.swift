//
//  CocktailCollectionHeader.swift
//  CoctailRecipeApp
//
//  Created by İsmail on 7.03.2022.
//

import UIKit

class CocktailCollectionHeader: UICollectionReusableView {

    // MARK: - Properties
    static let headerReuseIdentifier = "cellHeader"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Popular Drinks"
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.centerY(inView: self)
        label.anchor(paddingTop: 16, paddingLeft: 32, paddingBottom: 16, paddingRight: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
}
