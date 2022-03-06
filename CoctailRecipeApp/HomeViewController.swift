//
//  ViewController.swift
//  CoctailRecipeApp
//
//  Created by İsmail on 6.03.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 3
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width / 2) - 6, height: (view.frame.size.width / 2) - 6)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.register(CoctailCollectionViewCell.self, forCellWithReuseIdentifier: CoctailCollectionViewCell.cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoctailCollectionViewCell.cellIdentifier, for: indexPath) as! CoctailCollectionViewCell
                
        return cell
    }
    
    
}

