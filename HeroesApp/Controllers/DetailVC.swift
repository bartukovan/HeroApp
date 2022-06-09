//
//  DetailVC.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import UIKit
import RealmSwift
import CoreMedia

class DetailVC: UIViewController {
    
    var characterDetail: Result?
    var favouriteObject: Favourites!

    var detailView = CharacterDetailView(frame: UIScreen.main.bounds)
    
    var comics = [ComicsItem]()
    var events = [ComicsItem]()
    var series = [ComicsItem]()
    var stories = [ComicsItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTableView()
        getDatas()
        detailView.backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        detailView.favButton.addTarget(self, action: #selector(addorRemoveFavourites(sender:)), for: .touchUpInside)
        
    }
    
    override func loadView() {
        view = detailView
    }
    
    func setupViews() {
        view.backgroundColor = .white
        if favouriteObject != nil {
            let thumbnail = Thumbnail(path: favouriteObject.imagePath, thumbnailExtension: favouriteObject.imageExtension)
            
            detailView.configure(with: CharacterDetailViewModel(
                                    title: favouriteObject.name,
                                    description: favouriteObject.charDescription,
                                    image: thumbnail, isFav: favouriteObject.isFav))
        } else {
            detailView.configure(with: CharacterDetailViewModel(
                                    title: characterDetail?.name ?? "",
                                    description: characterDetail?.resultDescription ?? "",
                                    image: characterDetail?.thumbnail,
                                    isFav: Favourites.get(id: characterDetail?.id ?? 0) != nil))
        }
        
    }
    
    func getDatas() {
        if let comi = characterDetail?.comics?.items {
            comics = comi
        }
        
        if let seri = characterDetail?.series?.items {
            series = seri
        }
        
        if let even = characterDetail?.events?.items {
            events = even
        }
        
        if let stori = characterDetail?.stories?.items {
            stories = stori
        }
        
        DispatchQueue.main.async {
            self.detailView.tableView.reloadData()
        }
    }
    
    @objc func addorRemoveFavourites(sender: UIButton) {
        let item = characterDetail
        
        guard let thumbnail = item?.thumbnail else { return }
        guard let itemId = item?.id else { return }
        
        guard Favourites.get(id: itemId) != nil else {
            
            Favourites.write(
                id: item?.id ?? 0,
                name: item?.name ?? "",
                charDescription: item?.resultDescription ?? "",
                image: thumbnail,
                isFav: true,
                seriesCount: item?.series?.items?.count ?? 0)
            
            detailView.setButtonImage(isFav: true)
            
            return
        }
        
        Favourites.delete(id: item?.id ?? 0)
        
        detailView.setButtonImage(isFav: false)
    }

    
    func setupTableView() {
        let tv = detailView.tableView
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "default")
        tv.allowsSelection = false
    }
    
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
}

#if DEBUG
import SwiftUI

struct DetailVC_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            DetailVC()
        }.previewDevice("iPhone 11")
    }
}
#endif

