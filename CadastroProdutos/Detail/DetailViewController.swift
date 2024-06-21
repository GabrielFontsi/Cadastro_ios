//
//  DetailViewController.swift
//  CadastroProdutos
//
//  Created by Gabriel Fontenele da Silva on 20/06/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailScreen: DetailScreen?
    var product: Product
    
    override func loadView() {
        self.detailScreen = DetailScreen()
        self.view = self.detailScreen
    }
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productDetail()
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    private func productDetail(){
        self.detailScreen?.productNameLabel.text = product.product
        self.detailScreen?.productDescriptionLabel.text = product.description
        self.detailScreen?.productPriceLabel.text = "Valor do produto R$ \(product.price)"
        self.detailScreen?.productAvailabilityLabel.text = product.isAvailable ? "Disponível para venda" : "Não disponível para venda"
        
       
        
    }
    
   
       
    
}
