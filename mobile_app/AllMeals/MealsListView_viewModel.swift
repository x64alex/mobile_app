import Foundation

import SwiftUI
import Combine

class MealViewModel<T: Decodable>: ObservableObject {
    @Published var meals: [T] = []
    @Published var isOffline: Bool = false

    private var cancellables: Set<AnyCancellable> = []

    public func fetchMeals() {
        guard let url = URL(string: Constants.webAdressAll) else {
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [T].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    self.isOffline = false
                case .failure(let error):
                    print("Error: \(error)")
                    self.isOffline = true
                }
            } receiveValue: { [weak self] meals in
                self?.meals = meals
            }
            .store(in: &cancellables)
    }
}
