import Combine
import Foundation

struct VoidResponse: Decodable {}

enum APIPath: String {
    case ping = "/ping"
}

struct CryptoService {
    static let apiClient = APIClient()
    static let baseURL = URL(string: "https://api.coingecko.com/api/v3")!
    
    static func request(_ path: APIPath) -> AnyPublisher<VoidResponse, Error> {
        guard let components = URLComponents(url: baseURL.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
        else { fatalError("Failed to create URLComponents") }
        guard let url = components.url else { fatalError("Failed to create url") }
        let request = URLRequest(url: url)
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
