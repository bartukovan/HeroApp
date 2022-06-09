//
//  FavouritesEntity.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import RealmSwift

struct FavouritesEntity {
    let id: Int
    let name: String
    let charDescription: String
    let image: String
    let imageExtension: String
    let isFav: Bool
    let seriesCount: Int
}

class Favourites: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var charDescription = ""
    @objc dynamic var imagePath = ""
    @objc dynamic var imageExtension = ""
    @objc dynamic var isFav = false
    @objc dynamic var seriesCount = 0
    
    static func write(id: Int, name: String, charDescription: String, image: Thumbnail, isFav: Bool, seriesCount: Int) {
        let fav = Favourites()
        fav.id = id
        fav.name = name
        fav.imagePath = image.path ?? ""
        fav.imageExtension = image.thumbnailExtension ?? ""
        fav.charDescription = charDescription
        fav.isFav = isFav
        fav.seriesCount = seriesCount
        
        let realm = try! Realm()
        
        guard realm.objects(Favourites.self).filter({ $0.id == id }).first == nil else { return }
        
        try! realm.write {
            realm.add(fav)
        }
    }
    
    static func getAll() -> Results<Favourites> {
        let realm = try! Realm()
        return realm.objects(Favourites.self)
    }
    
    static func get(id: Any) -> Favourites? {
        let realm = try! Realm()
        return realm.objects(Favourites.self).filter({ $0.id == id as? Int }).first
    }
    
    static func delete(id: Int) {
        let realm = try! Realm()
        guard let objectToDelete = realm.objects(Favourites.self).filter({ $0.id == id }).first else { return }
        try! realm.write {
            realm.delete(objectToDelete)
        }
    }
    
    @discardableResult
    static func clear() -> Bool {
        if let realm = try? Realm() {
            do {
                try realm.write {
                    realm.delete(realm.objects(Favourites.self))
                }
            } catch {
                return false
            }
            return true
        }
        return true
    }
    
}
