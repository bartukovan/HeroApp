//
//  CharactersVC.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import UIKit

class CharactersVC: UIViewController, UITextFieldDelegate {
    
    let charactersView = CharactersView(frame: UIScreen.main.bounds)
    var collectionView: UICollectionView!
    var characterResult = [Result]()
    var characterLimit = 30
    var totalResult = 0
    var workItem: DispatchWorkItem?
    
    var cellSize: CGSize?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupCollectionView()
        getCharacters(charName: "Thor", limit: characterLimit)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func loadView() {
        view = charactersView
    }
    
    func setupViews() {
        view.backgroundColor = .white
        charactersView.configure(with: CharactersViewModel(title: "Karakterler", isSwitchHidden: false))
        
        charactersView.switchLayoutButton.addTarget(self, action: #selector(switchLayout(_:)), for: .touchUpInside)
        charactersView.searchTextField.addTarget(self, action: #selector(searchDidChange(_:)), for: .editingChanged)
    }
    
    func setupCollectionView() {
        let cv = charactersView.collectionView
        collectionView = cv
        cv.delegate = self
        cv.dataSource = self
        cv.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.className)
    }
    
    func getCharacters(charName: String, limit: Int) {
        let offSet = limit - 30
        CharacterService.getCharacters(charName: charName, limit: limit, offSet: offSet) { response in
            switch response {
            case .failure(let error):
                print(error)
            case .success(let succ):
                guard let result = succ.data?.results else { return }
                self.totalResult = succ.data?.total ?? 0
                self.characterResult.append(contentsOf: result)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    func isCharFavourite(charId: Int?) -> Bool {
        guard let itemId = charId else { return false }
        
        guard Favourites.get(id: itemId) != nil else { return false }
        return true
    }
    
    @objc func searchDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if text.count >= 3 {
            
            self.workItem?.cancel()
            
            let workItem = DispatchWorkItem { [weak self] in
                self?.characterLimit = 30
                self?.totalResult = 0
                self?.characterResult.removeAll()
                self?.getCharacters(charName: text, limit: self?.characterLimit ?? 0)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: workItem)
            
            self.workItem = workItem
            
        } else {
            self.workItem?.cancel()
        }
    }
    
    @objc func switchLayout(_ sender: UISwitch) {
        if sender.isOn {
            cellSize = CGSize(width: collectionView.frame.width, height: 300)
        } else {
            cellSize = CGSize(width: (collectionView.frame.width - 10) / 2, height: 150)
        }
        
        collectionView.reloadData()
    }
    
    @objc func addorRemoveFavourites(sender: UIButton) {
        let item = characterResult[sender.tag]
        
        guard let thumbnail = item.thumbnail else { return }
        guard let itemId = item.id else { return }
        
        guard Favourites.get(id: itemId) != nil else {
            
            Favourites.write(
                id: item.id ?? 0,
                name: item.name ?? "",
                charDescription: item.resultDescription ?? "",
                image: thumbnail,
                isFav: true,
                seriesCount: item.series?.items?.count ?? 0)
            
            collectionView.reloadData()
            
            return
        }
        
        Favourites.delete(id: item.id ?? 0)
        
        collectionView.reloadData()
    }
}

#if DEBUG
import SwiftUI

struct CharactersVC_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            CharactersVC()
        }.previewDevice("iPhone 11")
    }
}
#endif
