//
//  CharacterDetailView.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import Foundation
import UIKit

class CharacterDetailView: UIView {
    
    lazy var containerView: UIView = {
        let cv = UIView.newAutoLayout()
        return cv
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel.newAutoLayout()
        return lbl
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel.newAutoLayout()
        return lbl
    }()
    
    lazy var lineView: UIView = {
        let tlv = UIView.newAutoLayout()
        return tlv
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView.newAutoLayout()
        return iv
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView.newAutoLayout()
        return tv
    }()
    
    lazy var backButton: UIButton = {
        let btn = UIButton.newAutoLayout()
        return btn
    }()
    
    lazy var favButton: UIButton = {
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
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(lineView)
        containerView.addSubview(imageView)
        containerView.addSubview(tableView)
        containerView.addSubview(backButton)
        containerView.addSubview(favButton)
        
        style()
    }
    
    func setupConstraints() {
        containerView.autoPinEdgesToSuperviewEdges()
        
        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 70)
        titleLabel.autoSetDimension(.height, toSize: 30)
        
        backButton.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        backButton.autoPinEdge(toSuperviewEdge: .top, withInset: 40)
        backButton.autoSetDimensions(to: CGSize(width: 30, height: 30))
        
        favButton.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        favButton.autoPinEdge(toSuperviewEdge: .top, withInset: 40)
        favButton.autoSetDimensions(to: CGSize(width: 35, height: 35))
        
        descriptionLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        descriptionLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 10)
        
        lineView.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        lineView.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        lineView.autoPinEdge(.top, to: .bottom, of: descriptionLabel, withOffset: 10)
        lineView.autoSetDimension(.height, toSize: 1)
        
        imageView.autoPinEdge(toSuperviewEdge: .left, withInset: 50)
        imageView.autoPinEdge(toSuperviewEdge: .right, withInset: 50)
        imageView.autoPinEdge(.top, to: .bottom, of: lineView, withOffset: 10)
        imageView.autoSetDimension(.height, toSize: 200)
        
        tableView.autoPinEdge(toSuperviewEdge: .left)
        tableView.autoPinEdge(toSuperviewEdge: .right)
        tableView.autoPinEdge(toSuperviewEdge: .bottom)
        tableView.autoPinEdge(.top, to: .bottom, of: imageView, withOffset: 10)
    }
    
    func configure(with viewModel: CharacterDetailViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        
        descriptionLabel.sizeToFit()
        
        setButtonImage(isFav: viewModel.isFav)
        
        guard let imageString = viewModel.image?.path else { return }
        guard let imageExtension = viewModel.image?.thumbnailExtension else { return }
        let stringURL = imageString + "." + imageExtension
        guard let url = URL(string: stringURL) else { return }
        imageView.kf.setImage(with: .network(url))
        
        setupConstraints()
    }
    
    func setButtonImage(isFav: Bool) {
        if isFav {
            favButton.setImage(Images.getImage(.fullStar), for: .normal)
        } else {
            favButton.setImage(Images.getImage(.emptyStar), for: .normal)
        }

    }
    
    func style() {
        lineView.backgroundColor = .black
        
        titleLabel.font = Fonts.getFont(.vBold, size: 16)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        
        descriptionLabel.font = Fonts.getFont(.vRegular, size: 14)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .black
        
        imageView.contentMode = .scaleAspectFit
        
        backButton.setImage(Images.getImage(.backIcon), for: .normal)
    }
}
