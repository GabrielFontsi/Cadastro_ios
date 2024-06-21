//
//  ProductScreen.swift
//  CadastroProdutos
//
//  Created by Gabriel Fontenele da Silva on 20/06/24.
//

import UIKit

class ProductScreen: UIView {
    
    lazy var productLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "BackgroundBlue")
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "BackgroundBlue")
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        self.addSubview(self.productLabel)
        self.addSubview(self.priceLabel)
    }
    
    private func setupContraints(){
        NSLayoutConstraint.activate([
            
            self.productLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.productLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            
            self.priceLabel.topAnchor.constraint(equalTo: self.productLabel.bottomAnchor, constant: 12),
            self.priceLabel.leadingAnchor.constraint(equalTo: self.productLabel.leadingAnchor)
        ])
    }
    
}
