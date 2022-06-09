//
//  DetailVC+TableView.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import Foundation
import UIKit

extension DetailVC: UITableViewDelegate {
    
}

extension DetailVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return comics.count
        case 1:
            return events.count
        case 2:
            return series.count
        case 3:
            return stories.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "default") else { return UITableViewCell() }
        cell.textLabel?.font = Fonts.getFont(.vRegular, size: 12)
        
        var item: ComicsItem?
        switch indexPath.section {
        case 0:
            item = comics[indexPath.row]
        case 1:
            item = events[indexPath.row]
        case 2:
            item = series[indexPath.row]
        case 3:
            item = stories[indexPath.row]
        default:
            return UITableViewCell()
        }

        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = item?.name
        cell.textLabel?.sizeToFit()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let lbl = UILabel(frame: .zero)
        lbl.textAlignment = .center
        
        switch section {
        case 0:
            lbl.text = "Comics"
        case 1:
            lbl.text = "Events"
        case 2:
            lbl.text = "Series"
        case 3:
            lbl.text = "Stories"
        default:
            return lbl
        }
        return lbl
    }
}
