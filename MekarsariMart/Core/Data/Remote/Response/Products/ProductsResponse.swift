//
//  ProductsResponse.swift
//  MekarsariMart
//
//  Created by BEI-Zikri on 05/08/24.
//

import Foundation

struct ProductsResponse: Decodable {
    let status: String
    let data: ProductData
}


struct ProductData: Decodable {
    let count: String
    let products: [Product]
}


struct Product: Decodable {
    let id: String
    let name: String
    let price: Int
    let description: String
    let images: [String]
}
