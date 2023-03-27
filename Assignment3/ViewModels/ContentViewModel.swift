//
//  ContentViewModel.swift
//  Assignment3
//
//  Created by user236826 on 3/26/23.
//

import Foundation

//ViewModel for retrieving data from NASA API
class ContentViewModel : ObservableObject {
    @Published private(set) var pictureData = [QueryResults]()
    //March photos
    private let url = "https://api.nasa.gov/planetary/apod?start_date=2023-03-01&api_key=sKLAbyrly3vXabufshIz8d4fj4tie6rPIhADL9KR"
    
    @Published var hasError = false
    @Published var error : ContentModelError?
    
    /*
    func fetchData() {
        if let url = URL(string: self.url) {
            URLSession
                .shared
                .dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print(error)
                    } else {
                        if let data = data {
                            do {
                                let results = try JSONDecoder().decode([QueryResults].self, from: data)
                                DispatchQueue.main.async {
                                    self.pictureData = results
                                }
                            } catch {
                                print(error)
                            }
                        }
                    }
                }.resume()
        }
    }
    */
    
    @MainActor
    func fetchData() async {
        if let url = URL(string: url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode([QueryResults]?.self, from: data) else {
                    self.hasError.toggle()
                    self.error = ContentModelError.decodeError
                    return
                }
                self.pictureData = results
            } catch {
                self.hasError.toggle()
                self.error = ContentModelError.customError(error: error)
            }
        }
    }
}

extension ContentViewModel {
    enum ContentModelError : LocalizedError {
        case decodeError
        case customError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .decodeError:
                return "Decoding Error"
            case .customError(let error):
                return error.localizedDescription
            }
        }
        
    }
}
