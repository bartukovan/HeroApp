//
//  CharactersView.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import Foundation
import UIKit
import PureLayout

class CharactersView: UIView {
    
    lazy var containerView: UIView = {
        let cv = UIView.newAutoLayout()
        return cv
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel.newAutoLayout()
        return lbl
    }()
    
    lazy var titleLineView: UIView = {
        let tlv = UIView.newAutoLayout()
        return tlv
    }()
    
    lazy var searchTextField: UITextField = {
        let tfl = UITextField.newAutoLayout()
        return tfl
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    lazy var switchLayoutButton: UISwitch = {
        let btn = UISwitch.newAutoLayout()
        btn.isOn = true
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
        containerView.addSubview(titleLineView)
        containerView.addSubview(collectionView)
        containerView.addSubview(switchLayoutButton)
        containerView.addSubview(searchTextField)
        setupConstraints()
        style()
    }
    
    func setupConstraints() {
        containerView.autoPinEdgesToSuperviewEdges()
        
        switchLayoutButton.autoPinEdge(toSuperviewEdge: .top, withInset: 50)
        switchLayoutButton.autoPinEdge(toSuperviewEdge: .right, withInset: 40)
        switchLayoutButton.autoSetDimensions(to: CGSize(width: 40, height: 40))
        
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 60)
        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        titleLabel.autoSetDimension(.height, toSize: 20)
        
        titleLineView.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        titleLineView.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        titleLineView.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 10)
        titleLineView.autoSetDimension(.height, toSize: 1)
        
        searchTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        searchTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        searchTextField.autoPinEdge(.top, to: .bottom, of: titleLineView, withOffset: 5)
        searchTextField.autoSetDimension(.height, toSize: 20)
        
        collectionView.autoPinEdge(toSuperviewEdge: .left)
        collectionView.autoPinEdge(toSuperviewEdge: .right)
        collectionView.autoPinEdge(toSuperviewEdge: .bottom)
        collectionView.autoPinEdge(.top, to: .bottom, of: searchTextField, withOffset: 20)
    }
    
    func style() {
        titleLabel.font = Fonts.getFont(.vBold, size: 20)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        
        titleLineView.backgroundColor = .black
        
        searchTextField.placeholder = "Search"
        
    }
    
    func configure(with viewModel: CharactersViewModel) {
        let vm = viewModel
        titleLabel.text = vm.title
        switchLayoutButton.isHidden = vm.isSwitchHidden
    }
    
}
