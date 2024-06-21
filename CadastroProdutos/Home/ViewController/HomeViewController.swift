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
        //self.loadProducts()
    }
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadProducts()
        homeScreen?.tableView.reloadData()
    }
    
    private func loadProducts() {
           products = ProductManager.shared.getProducts()
           homeScreen?.tableView.reloadData()
       }
    
    private func setupNavigationBar(){
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(registerProduct))
        //let addButton = UIBarButtonItem(title: "Adicionar produto", style:.done, target: self, action: #selector(registerProduct))
        navigationItem.rightBarButtonItem = addButton
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func registerProduct() {
        let registerVC = RegisterViewController()
            navigationController?.pushViewController(registerVC, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if products.isEmpty {
                let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
                messageLabel.text = "Nenhum produto cadastrado. Clique no botão + para adicionar um produto."
                messageLabel.textColor = .white
                messageLabel.numberOfLines = 0
                messageLabel.textAlignment = .center
                messageLabel.font = UIFont(name: "TrebuchetMS", size: 16)
                messageLabel.sizeToFit()
                tableView.backgroundView = messageLabel
                tableView.separatorStyle = .none
            } else {
                tableView.backgroundView = nil
                tableView.separatorStyle = .singleLine
            }
            return products.count
        }

}


