//
//  ProductsInteractor.swift
//  MekarsariMart
//
//  Created by BEI-Zikri on 05/08/24.
//

import Foundation

protocol ProductsUseCase {
    func getProduct(completion: @escaping (Result<[ProductModel], URLError>) -> Void)
}

class ProductsInteractor: ProductsUseCase {
    private var repository: MekarsariMartRepositoryProtocol
    
    init(repository: MekarsariMartRepositoryProtocol) {
        self.repository = repository
    }
    
    func getProduct(completion : @escaping (Result<[ProductModel], URLError>) -> Void) {
        return repository.getProducts { result in
            completion(result)
        }
    }
}
