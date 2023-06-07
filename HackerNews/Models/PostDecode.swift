import Foundation

struct PostDecode : Codable {
    let hits : [PostDetails]
}

struct PostDetails : Codable, Identifiable {
    var id : String {
        return objectID
    }
    let objectID : String
    let points : Int
    let title : String
    let url : String?
}
