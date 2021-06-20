import Combine
import Foundation

class ViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case loaded
        case error(Error)
    }
    
    enum Event {
        case onAppear
        case onLoaded
        case onFailedToLoad(Error)
    }
    
    private var cancellables: [AnyCancellable] = []
    
    init() {
        ping()
    }
    
    func ping() {
        CryptoService.request(.ping)
            .sink { completion in
                print("ping receiveCompletion completion:", completion)
            } receiveValue: { response in
                print("ping receiveValue response:", response)
            }
            .store(in: &cancellables)
    }
}
