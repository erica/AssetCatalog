import Foundation

extension JSONEncoder {
    /// Shared configuration point for asset catalog JSON encoding
    public static var assets: JSONEncoder {
        let encoder = JSONEncoder()
        return encoder
    }
}

/// Shared core
public struct Info: Codable {
    public let author = "AssetCatalog"
    public let version = 1
}

