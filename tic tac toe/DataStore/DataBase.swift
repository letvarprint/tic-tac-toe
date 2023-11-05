import Foundation

class DataBase {
    static let shared = DataBase()
    
    var data: [String: Int] = [:]
    private init() {}
    
    func compareAndUpdate(with otherData: [String: Int]) {
        for (key, value) in otherData {
            if let existingValue = data[key] {
                data[key]! += value
            } else {
                data[key] = value
            }
        }
        data = data.sorted(by: { $0.value > $1.value })
            .reduce(into: [:]) { (result, pair) in
                result[pair.key] = pair.value
            }
    }
    
    func sortDictionary() {
        data = data.sorted(by: { $0.value > $1.value })
            .reduce(into: [:]) { (result, pair) in
                result[pair.key] = pair.value
            }
    }
}
