//
//  HomeViewController.swift
//  CadastroProdutos
//
//  Created by Gabriel Fontenele da Silva on 20/06/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeScreen: HomeScreen?
    var products: [Product] = []
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = self.homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("entrou na home")
        self.hidesBottomBarWhenPushed = true
        self.homeScreen?.configTableViewDelegate(delegate: self, dataSource: self)
        self.setupNavigationBar()
        self.loadProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.hidesBottomBarWhenPushed = true
        homeScreen?.tableView.reloadData()
    }
    
    private func loadProducts() {
           products = ProductManager.shared.getProducts()
           homeScreen?.tableView.reloadData()
       }
    
    private func setupNavigationBar(){
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(registerProduct))
        navigationItem.rightBarButtonItem = addButton
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    @objc func registerProduct() {
        let registerVC = RegisterViewController()
            navigationController?.pushViewController(registerVC, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else {
                return UITableViewCell()
            }
            
            let product = products[indexPath.row]
            cell.configurationCell(product: product)
        cell.selectionStyle = .none
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
               let detailVC = DetailViewController(product: product)
               detailVC.product = product
               navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
