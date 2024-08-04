//
//  RemoteDataSource.swift
//  MekarsariMart
//
//  Created by BEI-Zikri on 05/08/24.
//

import Foundation
import Alamofire

protocol RemoteDataSourceProtocol: AnyObject {
    func getProducts(result: @escaping (Result<ProductsResponse, URLError>) -> Void)
}

final class RemoteDataSource: NSObject {
    private override init() {}
    
    static let shareInstance = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    func getProducts(result: @escaping (Result<ProductsResponse, URLError>) -> Void) {
        
        guard let url = URL(string: Endpoints.Gets.products.url) else { return }
        
        AF.request(url).validate().responseDecodable(of: ProductsResponse.self){ response  in
            switch response.result {
            case .success(let value):
                result(.success(value))
            case .failure:
                result(.failure(.invalidResponse))
            }
        }
    }
}
