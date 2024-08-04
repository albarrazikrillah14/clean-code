//
//  Injection.swift
//  MekarsariMart
//
//  Created by BEI-Zikri on 05/08/24.
//

import Foundation

final class Injection: NSObject {
    private func provideRepository() -> MekarsariMartRepositoryProtocol {
        
        let remote: RemoteDataSource = RemoteDataSource.shareInstance
        
        return MekarsariMartRepository(remote: remote)
    }
    
    func productsUseCase() -> ProductsUseCase {
        let repository = provideRepository()

        return ProductsInteractor(repository: repository)
    }
   
}
