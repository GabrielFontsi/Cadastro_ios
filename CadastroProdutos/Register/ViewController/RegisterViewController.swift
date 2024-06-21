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
        self.registerScreen?.configTextFieldDelegate(delegate: self, textViewDelegate: self)
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
           //navigationController?.pushViewController(HomeViewController(), animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    func switchValueChanged(isOn: Bool) {
        }
    }

extension RegisterViewController: UITextFieldDelegate, UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            if text == "\n" {
                textView.resignFirstResponder()
                return false
            }
            return true
        }
    
}
