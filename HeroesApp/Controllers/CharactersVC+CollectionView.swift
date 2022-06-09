//
//  CharactersVC+TableView.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import Foundation
import UIKit

extension CharactersVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailVC()
        vc.characterDetail = characterResult[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)

    }
        
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if characterResult.count - 1 == indexPath.row && totalResult > indexPath.row {
            print("Fetched")
            characterLimit += 30
            getCharacters(charName: charactersView.searchTextField.text ?? "", limit: characterLimit)
        }
    }
}

extension CharactersVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize ?? CGSize(width: collectionView.frame.width, height: 320)
    }
}

extension CharactersVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.className, for: indexPath) as? CharactersCollectionViewCell else { return UICollectionViewCell() }
        
        let char = characterResult[indexPath.row]
        let seriesCount = char.series?.items?.count
        let vm = CharactersCVCellViewModel(name: char.name,
                                           image: char.thumbnail,
                                           isFav: isCharFavourite(charId: char.id), seriesCount: seriesCount ?? 0)
        cell.configure(with: vm)
        
        cell.favouritesButton.addTarget(self, action: #selector(addorRemoveFavourites(sender:)), for: .touchUpInside)
        cell.favouritesButton.tag = indexPath.row
        
        return cell
        
    }
}
