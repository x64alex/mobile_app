import Foundation

struct Meal: Codable, Identifiable {
    var id: Int
    var name: String
    var type: String
    var calories: Int
    var date: String
    var notes: String?
    
}
