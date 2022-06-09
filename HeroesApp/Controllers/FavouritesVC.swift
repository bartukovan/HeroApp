//
//  FavouritesVC.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import UIKit
import RealmSwift

class FavouritesVC: UIViewController {
    
    let favouritesView = CharactersView(frame: UIScreen.main.bounds)
    var favourites: Results<Favourites>?
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getFavs()
    }
    
    override func loadView() {
        view = favouritesView
    }
    
    func setupViews() {
        view.backgroundColor = .white
        favouritesView.configure(with: CharactersViewModel(title: "Favoriler", isSwitchHidden: true))
        favouritesView.searchTextField.isHidden = true
    }
    
    func setupCollectionView() {
        let cv = favouritesView.collectionView
        collectionView = cv
        cv.delegate = self
        cv.dataSource = self
        cv.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.className)
    }

    func getFavs() {
        favourites = Favourites.getAll()
        collectionView.reloadData()
    }
    
    @objc func addorRemoveFavourites(sender: UIButton) {
        guard let fav = Favourites.get(id: sender.tag) else { return }
        Favourites.delete(id: fav.id)
        collectionView.reloadData()
    }

}

#if DEBUG
import SwiftUI

struct FavouritesVC_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            FavouritesVC()
        }.previewDevice("iPhone 11")
    }
}
#endif
