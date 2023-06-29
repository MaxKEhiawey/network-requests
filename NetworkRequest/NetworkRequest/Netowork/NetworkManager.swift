//
//  NetworkManager.swift
//  NetworkRequest
//
//  Created by AMALITECH MACBOOK on 15/06/2023.
//

import Foundation
import Combine

class NetworkManager {
    func fetchData() -> AnyPublisher<[TVMazeModel], Error> {
        guard let requestURL = URL(string: "https://api.tvmaze.com/shows") else {
            return Fail(error: Errors.emptyURL).eraseToAnyPublisher()
        }
      var request = URLRequest(url: requestURL)
        // request.addValue("application/json", forHTTPHeaderField: "Content-Type")
       //  request.addValue("Bearer $2b$10$Ke1iwieFO7/7qsSKU.GYU.oYXZMW1EeHrwd4xx9ylboJik5mstZk6", forHTTPHeaderField: "X-Access-Key")
        return URLSession.shared.dataTaskPublisher(for: request)
            .map({$0.data})
            .decode(type: [TVMazeModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
enum Errors: Error {
    case emptyURL
}


class TVMazeViewModel: ObservableObject {
    var cancelleable = Set<AnyCancellable>()
    @Published var allTVmaze: [TVMazeModel] = []
    let network = NetworkManager()
    func fetchData() {
        network.fetchData()
            .sink { completion  in
                print(completion )
            } receiveValue: { allData in
                self.allTVmaze = allData
                print("fetch data", self.allTVmaze)
                
            }
            .store(in: &cancelleable)
    }
}
