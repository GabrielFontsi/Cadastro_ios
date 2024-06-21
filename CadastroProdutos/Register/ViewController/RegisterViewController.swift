//
//  RegisterViewController.swift
//  CadastroProdutos
//
//  Created by Gabriel Fontenele da Silva on 20/06/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    weak var homeViewController: HomeViewController?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.delegate(delegate: self)
    }
}

extension RegisterViewController: RegisterScreenProtocol {
    func actionRegisterProductButton() {
        
        guard let name = registerScreen?.productNameTextField.text,
                 let description = registerScreen?.productDescriptionTextField.text,
                 let priceText = registerScreen?.productPriceTextField.text,
                 let price = Double(priceText),
                 let isAvailable = registerScreen?.productUISwitch.isOn else {
                     return
                 }
           
           let product = Product(product: name, description: description, price: price, isAvailable: isAvailable)
           ProductManager.shared.addProduct(product)
           navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    func switchValueChanged(isOn: Bool) {
        if isOn {
                print("ON")
            } else {
                print("OFF")
            }
        }
    }

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
