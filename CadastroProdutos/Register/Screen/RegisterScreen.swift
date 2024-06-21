//
//  RegisterScreen.swift
//  CadastroProdutos
//
//  Created by Gabriel Fontenele da Silva on 20/06/24.
//

import UIKit

protocol RegisterScreenProtocol: class {
    func switchValueChanged(isOn: Bool)
    func actionRegisterProductButton()
}

class RegisterScreen: UIView {
    
    weak private var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var titleNavigationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Registrar seu produto"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var productNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.placeholder = "   Digite o produto"
        textField.textColor = .darkGray
        textField.layer.cornerRadius = 15
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.4
        textField.layer.shadowRadius = 3.0
        textField.layer.masksToBounds = false
        return textField
    }()
    
    lazy var productDescriptiobLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Descreva o produto abaixo"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var productDescriptionTextField: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        //textField.placeholder = "Descrição do produto"
        textField.textColor = .darkGray
        textField.layer.cornerRadius = 15
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.4
        textField.layer.shadowRadius = 3.0
        textField.layer.masksToBounds = false
        return textField
    }()
    
    lazy var productPriceTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "   Digite o valor do produto"
        textField.keyboardType = .decimalPad
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 15
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.4
        textField.layer.shadowRadius = 3.0
        textField.layer.masksToBounds = false
        return textField
    }()
    
    lazy var availableForSaleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "   Disponível para venda"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var productUISwitch: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.translatesAutoresizingMaskIntoConstraints = false
        uiSwitch.onTintColor = UIColor.green
        uiSwitch.addTarget(self, action: #selector(self.switchValueChanged(_:)), for: .valueChanged)
        return uiSwitch
    }()
    
    lazy var registerProductButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar", for: .normal)
        button.setTitleColor(UIColor(named: "BackgroundBlue"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(self.actionRegisterProductButton), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 3.0
        button.layer.masksToBounds = false
 
        return button
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
    
    private func setupLayout(){
        self.addSubview(self.titleNavigationLabel)
        self.addSubview(self.productNameTextField)
        self.addSubview(self.productDescriptiobLabel)
        self.addSubview(self.productDescriptionTextField)
        self.addSubview(self.productPriceTextField)
        self.addSubview(self.availableForSaleLabel)
        self.addSubview(self.productUISwitch)
        self.addSubview(self.registerProductButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.titleNavigationLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 18),
            self.titleNavigationLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.productNameTextField.topAnchor.constraint(equalTo: self.titleNavigationLabel.bottomAnchor, constant: 32),
            self.productNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            self.productNameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            self.productNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.productDescriptiobLabel.topAnchor.constraint(equalTo: self.productNameTextField.bottomAnchor, constant: 18),
            self.productDescriptiobLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.productDescriptionTextField.topAnchor.constraint(equalTo: self.productDescriptiobLabel.bottomAnchor,constant: 8),
            self.productDescriptionTextField.leadingAnchor.constraint(equalTo: self.productNameTextField.leadingAnchor),
            self.productDescriptionTextField.trailingAnchor.constraint(equalTo: self.productNameTextField.trailingAnchor),
            self.productDescriptionTextField.heightAnchor.constraint(equalToConstant: 100),
            
            self.productPriceTextField.topAnchor.constraint(equalTo: self.productDescriptionTextField.bottomAnchor, constant: 18),
            self.productPriceTextField.leadingAnchor.constraint(equalTo: self.productNameTextField.leadingAnchor),
            self.productPriceTextField.trailingAnchor.constraint(equalTo: self.productNameTextField.trailingAnchor),
            self.productPriceTextField.heightAnchor.constraint(equalTo: self.productNameTextField.heightAnchor),
            
            self.availableForSaleLabel.topAnchor.constraint(equalTo: self.productPriceTextField.bottomAnchor, constant: 32),
            self.availableForSaleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.productUISwitch.topAnchor.constraint(equalTo: self.availableForSaleLabel.bottomAnchor, constant: 8),
            self.productUISwitch.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.registerProductButton.topAnchor.constraint(equalTo: self.productUISwitch.bottomAnchor, constant: 64),
            self.registerProductButton.leadingAnchor.constraint(equalTo: self.productNameTextField.leadingAnchor),
            self.registerProductButton.trailingAnchor.constraint(equalTo: self.productNameTextField.trailingAnchor),
            self.registerProductButton.heightAnchor.constraint(equalTo: self.productNameTextField.heightAnchor),
        ])
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        self.delegate?.switchValueChanged(isOn: sender.isOn)
    }
    
    @objc func actionRegisterProductButton(){
        print("clicou para registrar o produto")
        self.delegate?.actionRegisterProductButton()
    }
}
