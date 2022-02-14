import UIKit

struct Movies: Codable {
    var movieName: String
    var movieRating: String
    var releaseDate: String
    var youtubeLink: String
    var description: String
    var poster: Data {
        didSet { _ = mainImage }
    }
    lazy var mainImage: UIImage = {
        UIImage(data: poster)!
    }()
}
