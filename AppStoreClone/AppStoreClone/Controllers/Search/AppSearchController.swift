//
//  AppSearchViewController.swift
//  AppStoreClone
//
//  Created by Decagon on 13/07/2021.
//

import UIKit

class AppSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    fileprivate let cellID = "id1234"
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate var appResult = [Result]()
    
    fileprivate let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter search term above..."
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutCells()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        setupSearchBar()
//        fetchItunesApps()
      
    }
    
    fileprivate func setupSearchBar () {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    
    var timer: Timer?
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Service.shared.fetchApps(searchTerm: searchText) { res, err in
               
                self.appResult = res?.results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
  
    
    fileprivate func fetchItunesApps () {
        Service.shared.fetchApps(searchTerm: "Twitter") { res, err in
            if let error = err {
                print("Failed to do the magic: \(error)")
            }
            self.appResult = res?.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    
    func layoutCells() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 5.0
        layout.minimumLineSpacing = 5.0
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width), height: 350)
        collectionView!.collectionViewLayout = layout
    }
    
  
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = appResult.count != 0
        return appResult.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell
        cell.appResult = appResult[indexPath.item]
        return cell
    }
}
