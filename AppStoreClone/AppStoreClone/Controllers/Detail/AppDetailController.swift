//
//  AppDetailController.swift
//  AppStoreClone
//
//  Created by Decagon on 20/07/2021.
//

import UIKit

class AppDetailController: BaseListController, UICollectionViewDelegateFlowLayout{
    
    let detailId = "detailId"
    var appId: String! {
        didSet {
            let url = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            Service.shared.fetchGenericJSON(urlString: url) { (result: SearchResult?, err) in
                print(result?.results.first?.releaseNotes)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailId, for: indexPath) as! AppDetailCell
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}
