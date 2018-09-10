import Foundation

struct RatingFeed: Codable {
    var results: [Rating]?
}

struct Rating: Codable {
    let averageUserRating: Float?
    let userRatingCount: Int?
}
