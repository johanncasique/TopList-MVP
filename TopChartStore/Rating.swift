import Foundation

struct RatingFeed: Codable {
    var results: [Rating]?
}

struct Rating: Codable {
    let averageUserRating: Int
    let userRatingCount: Int
}
