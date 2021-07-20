

import Foundation

class Service {
    static let shared = Service()
    
    func  fetchApps(searchTerm: String, completion: @escaping ((SearchResult?, Error?)->Void))  {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        fetchGenericJSON(urlString: urlString, completion: completion)
    }
    
    func fetchTopGrossing (completion: @escaping (AppGroup?, Error?)->Void) {
        let topGrossingURL = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
        fetchAppGroup(urlString: topGrossingURL, completion: completion)
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?)->Void) {
        let gameURL = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"
      fetchAppGroup(urlString: gameURL, completion: completion)
    }
    
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?)->Void) {
        fetchGenericJSON(urlString: urlString, completion:  completion)
    }
    
    func fetchSocialApps (completion: @escaping ([SocialApp]?, Error?)->Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
       fetchGenericJSON(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJSON <T: Decodable>(urlString: String, completion: @escaping (T?, Error?)->Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url){ data, resp, err in
            if let err = err {
                completion(nil, err)
                return
            }
            guard let data = data else { return }
            
            do {
                let objects = try JSONDecoder().decode(T.self, from: data)
              completion(objects, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
