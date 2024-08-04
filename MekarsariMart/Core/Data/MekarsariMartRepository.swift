//
//  MekarsariMartRepository.swift
//  MekarsariMart
//
//  Created by BEI-Zikri on 05/08/24.
//

import Foundation

protocol MekarsariMartRepositoryProtocol {
    func getProducts(result: @escaping (Result<[ProductModel], URLError>) -> Void)
}

final class MekarsariMartRepository {
    typealias MekarsariMartInstance = (RemoteDataSource) -> MekarsariMartRepository
    
    fileprivate let remote: RemoteDataSource
    
    init(remote: RemoteDataSource) {
        self.remote = remote
    }
    
    static let shareInstance: MekarsariMartInstance = { remote in
            return MekarsariMartRepository(remote: remote)
    }
}

extension MekarsariMartRepository: MekarsariMartRepositoryProtocol {
    func getProducts(result: @escaping (Result<[ProductModel], URLError>) -> Void) {
        return remote.getProducts { remoteResponse in
            switch remoteResponse {
            case .success(let response):
                let mappedProduct = ProductMapper.mapProductResponseToDomain(response: response)
                return result(.success(mappedProduct))
            case .failure:
                return result(.failure(.invalidResponse))
            }
        }
    }
}
