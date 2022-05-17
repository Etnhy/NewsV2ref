//
//  HomeViewController.swift
//  NewsV2ref
//
//  Created by Evhenii Mahlena on 17.05.2022.
//

import UIKit
import SnapKit

class HomeViewController: MainViewController {
    
   fileprivate lazy var collectionNews: UICollectionView =  {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        var view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .yellow
        view.dataSource = self
        view.delegate = self
        view.register(CollectionNewsCell.self, forCellWithReuseIdentifier: CollectionNewsCell.identifier)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "main"
        configureView()
    }
    
    fileprivate func configureView() {
        view.addSubview(collectionNews)
        
        collectionNews.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return.init(width: self.view.frame.size.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionNewsCell.identifier, for: indexPath) as? CollectionNewsCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .black
        return cell
    }
    
    
}