import Foundation
enum KeyUserDefaults {
   static let saveMovie = "saveMovie"
    static let deleteMovie = "deleteMovie"
}

final class UserDafaultsManager {
    private let defaults = UserDefaults.standard
    static let instance = UserDafaultsManager()
    private func encode(watchedMovie: [Movies], key: String) {
        if let encoderData = try? JSONEncoder().encode(watchedMovie) {
            return defaults.set(encoderData, forKey: key)
        }
    }
    private func decoder(key: String) -> [Movies] {
        if let decoderData = defaults.data(forKey: key) {
            let watchedMovie = try? JSONDecoder().decode([Movies].self, from: decoderData)
            if let resultMovie = watchedMovie {
                return resultMovie
            }
        }
        return[]
    }
    func getWatchedMovie() -> [Movies] {
        decoder(key: KeyUserDefaults.saveMovie)
    }
    func saveWatchedMovie(watchedMovie: Movies) {
        var movie = getWatchedMovie()
        movie.insert(watchedMovie, at: 0)
        encode(watchedMovie: movie, key: KeyUserDefaults.saveMovie)
    }
    func updateMovies(updatedMovie: [Movies]) {
        var movies = getWatchedMovie()
        movies = updatedMovie
        encode(watchedMovie: movies, key: KeyUserDefaults.saveMovie)
    }
    func restoreDeletedMovie(deletedMovie: Movies) {
        var movies = getWatchedMovie()
        movies.append(deletedMovie)
        encode(watchedMovie: movies, key: KeyUserDefaults.saveMovie)
    }
}
