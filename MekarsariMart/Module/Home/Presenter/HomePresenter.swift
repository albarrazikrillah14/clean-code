//
//  HomePresenter.swift
//  MekarsariMart
//
//  Created by BEI-Zikri on 05/08/24.
//

import Foundation
import Combine

protocol HomePresenterProtocol {
    func getProducts() -> Void
}

class HomePresenter: HomePresenterProtocol {
    private var productsUseCase: ProductsUseCase
    
    init(productsUseCase: ProductsUseCase) {
        self.productsUseCase = productsUseCase
    }
    
    @Published var products: [ProductModel] = []
    @Published var error = ""
    @Published var loadingState = false
    
    func getProducts() {
        self.loadingState = true
        productsUseCase.getProduct { result in
            switch result {
            case .success(let value):
                self.products = value
                self.loadingState = false
            case .failure(let error):
                self.error = error.localizedDescription
                self.loadingState = false
            }
        }
    }
}
