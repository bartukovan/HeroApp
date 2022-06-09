//
//  FavouritesVC+TableView.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import Foundation
import UIKit

extension FavouritesVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // let vc = DetailVC()
        //vc.favouriteObject = favourites?[indexPath.row]
       // navigationController?.pushViewController(vc, animated: true)
    }
}

extension FavouritesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 320)
    }
}


extension FavouritesVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favourites?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.className, for: indexPath) as? CharactersCollectionViewCell else { return UICollectionViewCell() }
        
        guard let char = favourites?[indexPath.row] else { return UICollectionViewCell() }
        let thumbnail = Thumbnail(path: char.imagePath, thumbnailExtension: char.imageExtension)
        let vm = CharactersCVCellViewModel(name: char.name,
                                           image: thumbnail,
                                           isFav: char.isFav, seriesCount: char.seriesCount)
        cell.configure(with: vm)
        
        cell.favouritesButton.addTarget(self, action: #selector(addorRemoveFavourites(sender:)), for: .touchUpInside)
        cell.favouritesButton.tag = indexPath.row
        
        return cell
        
    }
}

