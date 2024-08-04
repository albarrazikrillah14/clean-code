//
//  ProductMapper.swift
//  MekarsariMart
//
//  Created by BEI-Zikri on 05/08/24.
//

import Foundation

final class ProductMapper {
    static func mapProductResponseToDomain(
        response: ProductsResponse
    ) -> [ProductModel] {
        
        return response.data.products.map { result in
            ProductModel(id: result.id, name: result.name, price: result.price, description: result.description, images: result.images)
        }
    }
}
