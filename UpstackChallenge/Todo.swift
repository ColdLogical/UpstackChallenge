import Foundation

struct Todo: Codable {
        // MARK: - Instance Variables
        var completed: Bool
        var id: Int
        var title: String
        var userId: Int
}
