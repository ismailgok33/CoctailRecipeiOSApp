//
//  CoctialCollectionViewCell.swift
//  CoctailRecipeApp
//
//  Created by İsmail on 6.03.2022.
//

import UIKit

class CocktailCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let cellIdentifier = "coctailCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "coctail_1")
//        imageView.setDimensions(height: 150, width: 150)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
//        imageView.layer.masksToBounds = true
        
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
//        imageView.isUserInteractionEnabled = true
//        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        return imageView
    }()
    
    let labelView: UILabel = {
        let label = UILabel()
        label.text = "Whiskey Smash"
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    
    private let gradientLayer = CAGradientLayer()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
//        imageView.applyshadowWithCorner(containerView: self, cornerRadious: 30)
        createImageOverlay()
        contentView.addSubview(labelView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.fillSuperview()
        
//        gradientLayer.frame = self.frame
        gradientLayer.frame = contentView.bounds
        
        labelView.anchor(left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingLeft: 16, paddingBottom: 8, paddingRight: 16)
    }
    
    // MARK: - Helpers
    
    func createImageOverlay() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5, 1.1]
        gradientLayer.cornerRadius = 30
        gradientLayer.masksToBounds = true
        contentView.layer.addSublayer(gradientLayer)
    }
    
//    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
//        let detailVC = CoctailDetailsViewController()
//        
//    }
    
}

extension UIImageView {
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 10
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
}
