//
//  APICall.swift
//  MekarsariMart
//
//  Created by BEI-Zikri on 05/08/24.
//

import Foundation

struct API {
    static let baseUrl = ""
}

protocol Endpoint {
    var url: String { get }
}

enum Endpoints {
    enum Gets: Endpoint {
        case products
        
        public var url: String {
            switch self {
            case .products: return "\(API.baseUrl)products?limit=10&offset=0"
            }
        }
    }
}
