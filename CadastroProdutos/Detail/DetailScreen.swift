//
//  DetailScreen.swift
//  CadastroProdutos
//
//  Created by Gabriel Fontenele da Silva on 20/06/24.
//

import UIKit

class DetailScreen: UIView {
    
    var product: Product?

    lazy var productNameLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 24, weight: .bold)
            label.textColor = .white
            return label
        }()
        
        lazy var productDescriptionLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 18, weight: .regular)
            label.textColor = .white
            label.numberOfLines = 0
            return label
        }()
        
        lazy var productPriceLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 18, weight: .regular)
            label.textColor = .white
            return label
        }()
        
        lazy var productAvailabilityLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 18, weight: .regular)
            label.textColor = .white
            return label
        }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupBackground()
        self.setupLayout()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackground(){
        self.backgroundColor = UIColor(named: "BackgroundBlue")
    }
    
    private func setupLayout() {
           self.addSubview(productNameLabel)
           self.addSubview(productDescriptionLabel)
           self.addSubview(productPriceLabel)
           self.addSubview(productAvailabilityLabel)
       }
    
    private func setupConstraints() {
            NSLayoutConstraint.activate([
                productNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
                productNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                productNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

                productDescriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 20),
                productDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                productDescriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

                productPriceLabel.topAnchor.constraint(equalTo: productDescriptionLabel.bottomAnchor, constant: 20),
                productPriceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                productPriceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

                productAvailabilityLabel.topAnchor.constraint(equalTo: productPriceLabel.bottomAnchor, constant: 20),
                productAvailabilityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                productAvailabilityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            ])
        }
}
