import Foundation

class Posts : ObservableObject {
    
    @Published var postDetails = [PostDetails]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    if let safeData = data {
                        self.decode(data: safeData)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func decode(data : Data) {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(PostDecode.self, from: data)
            postDetails = result.hits
        } catch {
            print(error)
        }
    }
}
