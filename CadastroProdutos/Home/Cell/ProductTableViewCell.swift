//
//  ProductTableViewCell.swift
//  CadastroProdutos
//
//  Created by Gabriel Fontenele da Silva on 20/06/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    static let identifier: String = "ProductTableViewCell"

    lazy var productCellScreen = {
        let view = ProductScreen()
              view.translatesAutoresizingMaskIntoConstraints = false
              view.backgroundColor = .clear
              view.layer.cornerRadius = 8
              view.layer.masksToBounds = true
              return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupLayout()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configurationCell(product: Product) {
        self.productCellScreen.productLabel.text = "Produto: \(product.product)"
        self.productCellScreen.priceLabel.text = "Valor do produto R$ \(product.price)"
    }
    
    private func setupLayout(){
        self.contentView.addSubview(self.productCellScreen)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.productCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.productCellScreen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.productCellScreen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.productCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}
