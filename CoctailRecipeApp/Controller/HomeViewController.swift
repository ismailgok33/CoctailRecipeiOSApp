//
//  ViewController.swift
//  CoctailRecipeApp
//
//  Created by İsmail on 6.03.2022.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var collectionView: UICollectionView?
    
    private var cocktailViewModel: CocktailViewModel!
    
    private var cocktails = [Cocktail]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        setUpCollectionView()
//        getAllCocktailsFromViewModel()
        fetchAllCocktails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.tintColor = .label
//        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Helpers
    
    func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width / 2) - 36, height: (view.frame.size.width / 2) + 30)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CocktailCollectionViewCell.self, forCellWithReuseIdentifier: CocktailCollectionViewCell.cellIdentifier)
        collectionView.register(CocktailCollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CocktailCollectionHeader.headerReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        collectionView.fillSuperview(padding: UIEdgeInsets(top: 16, left: 24, bottom: 16, right: 24))
        collectionView.backgroundColor = .systemGray6
    }
    
//    func getAllCocktailsFromViewModel() {
//        cocktailViewModel = CocktailViewModel()
//        cocktailViewModel.fetchAllCocktails()
//        print("DEBUG: allCocktails are \(cocktailViewModel.allCocktails)")
//        self.cocktails = cocktailViewModel.allCocktails
//    }
    
    func fetchAllCocktails() {
        URLSession.shared.request(url: URL(string: APIController.searchByName), expecting: CocktailResponse.self) { [weak self] result in
            switch result {
            case .success(let cocktails):
                self?.cocktails = cocktails.drinks
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

// MARK: - CollectionView Extension

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cocktails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CocktailCollectionViewCell.cellIdentifier, for: indexPath) as! CocktailCollectionViewCell
        
        let cocktail = cocktails[indexPath.row]
        cell.labelView.text = cocktail.name
        
        if let url = URL(string: cocktail.imageSource) {
            cell.imageView.kf.setImage(with: url)
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CocktailCollectionHeader.headerReuseIdentifier, for: indexPath) as! CocktailCollectionHeader
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cocktail = cocktails[indexPath.row]
        
        let detailVC = CocktailDetailsViewController()
        detailVC.viewModel = CocktailViewModel(cocktail: cocktail)
        detailVC.cocktail = cocktail
//        detailVC.title = cocktail.name
        detailVC.modalPresentationStyle = .fullScreen
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}

