//
//  CharactersTableViewCell.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import Foundation
import UIKit
import Kingfisher

class CharactersCollectionViewCell: UICollectionViewCell {
    
    lazy var containerView: UIView = {
        let cv = UIView.newAutoLayout()
        return cv
    }()
    
    lazy var characterImageView: UIImageView = {
        let iv = UIImageView.newAutoLayout()
        return iv
    }()
    
    lazy var characterNameLabel: UILabel = {
        let lbl = UILabel.newAutoLayout()
        return lbl
    }()
    
    lazy var seriesCountLabel: UILabel = {
        let lbl = UILabel.newAutoLayout()
        return lbl
    }()
    
    lazy var favouritesButton: UIButton = {
        let btn = UIButton.newAutoLayout()
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(characterImageView)
        containerView.addSubview(characterNameLabel)
        containerView.addSubview(favouritesButton)
        containerView.addSubview(seriesCountLabel)
        setupConstraints()
        style()
    }
    
    func setupConstraints() {
        containerView.autoPinEdgesToSuperviewEdges()
        
        seriesCountLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        seriesCountLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        seriesCountLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        seriesCountLabel.autoSetDimension(.height, toSize: 20)
        
        characterNameLabel.autoPinEdge(.bottom, to: .top, of: seriesCountLabel, withOffset: -10)
        characterNameLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        characterNameLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        characterNameLabel.autoSetDimension(.height, toSize: 30)
        
        characterImageView.autoPinEdge(toSuperviewEdge: .left, withInset: 60)
        characterImageView.autoPinEdge(toSuperviewEdge: .right, withInset: 60)
        characterImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        characterImageView.autoPinEdge(.bottom, to: .top, of: characterNameLabel, withOffset: -10)
        
        favouritesButton.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        favouritesButton.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        favouritesButton.autoSetDimensions(to: CGSize(width: 35, height: 35))
    }
    
    func configure(with viewModel: CharactersCVCellViewModel) {
        characterNameLabel.text = viewModel.name
        
        if viewModel.seriesCount != nil {
            seriesCountLabel.text = "Series Count: \(viewModel.seriesCount ?? 0)"
        }
        
        if viewModel.isFav {
            favouritesButton.setImage(Images.getImage(.fullStar), for: .normal)
        } else {
            favouritesButton.setImage(Images.getImage(.emptyStar), for: .normal)
        }
        
        guard let imageString = viewModel.image?.path else { return }
        guard let imageExtension = viewModel.image?.thumbnailExtension else { return }
        let stringURL = imageString + "." + imageExtension
        guard let url = URL(string: stringURL) else { return }
        characterImageView.kf.setImage(with: .network(url))
    }
    
    func style() {
        characterNameLabel.textAlignment = .center
        characterNameLabel.textColor = .black
        
        seriesCountLabel.textAlignment = .center
        seriesCountLabel.textColor = .black
        
        characterImageView.contentMode = .scaleAspectFit
        
    }
    
}
