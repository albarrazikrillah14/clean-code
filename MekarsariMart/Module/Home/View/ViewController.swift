//
//  ViewController.swift
//  MekarsariMart
//
//  Created by BEI-Zikri on 05/08/24.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var resultText: UILabel!
    private var presenter: HomePresenter?
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let productUseCase = Injection.init().productsUseCase()
        presenter = HomePresenter(productsUseCase: productUseCase)
        
        // Bind to the loadingState
        presenter?.$loadingState
            .sink(receiveValue: { [weak self] isLoading in
                DispatchQueue.main.async {
                    if isLoading {
                        self?.resultText.text = "Loading..."
                    }
                }
            })
            .store(in: &cancellables)
        
        // Bind to the products
        presenter?.$products
            .sink(receiveValue: { [weak self] products in
                DispatchQueue.main.async {
                    if !products.isEmpty {
                        self?.resultText.text = "\(products)"
                    }
                }
            })
            .store(in: &cancellables)
        
        // Bind to the error
        presenter?.$error
            .sink(receiveValue: { [weak self] error in
                DispatchQueue.main.async {
                    if !error.isEmpty {
                        self?.resultText.text = error
                    }
                }
            })
            .store(in: &cancellables)
        
        // Fetch products
        presenter?.getProducts()
    }
}
