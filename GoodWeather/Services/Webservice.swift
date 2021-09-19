//
//  Service.swift
//  GoodWeather
//
//  Created by 石川大輔 on 2021/08/12.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class Webservice {

    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {

        URLSession.shared.dataTask(with: resource.url) { data, response, error in

            print(data)

            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
