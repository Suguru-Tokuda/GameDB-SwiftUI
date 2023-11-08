//
//  RawgGameResponse.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import Foundation

// MARK: - Welcome
struct GamesResponse: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [GameResult]?

    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
    }
}

// MARK: - Result
struct GameResult: Codable, Identifiable, Hashable {
    let id: Int
    let slug, name: String
    let released: String?
    let backgroundImage: String
    let rating: Double?
    let ratings: [Rating]?
    let reviewsCount: Int?
    let saturatedColor, dominantColor: String?
    let platforms: [PlatformElement]?
    
    static func == (lhs: GameResult, rhs: GameResult) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(id: Int, slug: String, name: String, backgroundImage: String) {
        self.id = id
        self.slug = slug
        self.name = name
        self.backgroundImage = backgroundImage
        self.released = ""
        self.rating = 0.0
        self.ratings = []
        self.reviewsCount = 0
        self.saturatedColor = ""
        self.dominantColor = ""
        self.platforms = []
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.slug = try container.decode(String.self, forKey: .slug)
        self.name = try container.decode(String.self, forKey: .name)
        self.released = try container.decodeIfPresent(String.self, forKey: .released)
        self.backgroundImage = try container.decode(String.self, forKey: .backgroundImage)
        self.rating = try container.decodeIfPresent(Double.self, forKey: .rating)
        self.ratings = try container.decodeIfPresent([Rating].self, forKey: .ratings)
        self.reviewsCount = try container.decodeIfPresent(Int.self, forKey: .reviewsCount)
        self.saturatedColor = try container.decodeIfPresent(String.self, forKey: .saturatedColor)
        self.dominantColor = try container.decodeIfPresent(String.self, forKey: .dominantColor)
        self.platforms = try container.decodeIfPresent([PlatformElement].self, forKey: .platforms)
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }

    enum CodingKeys: String, CodingKey {
        case id, slug, name, released
        case backgroundImage = "background_image"
        case rating
        case ratings
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case platforms
    }
}

// MARK: - EsrbRating
struct EsrbRating: Codable {
    let id: Int?
    let name, slug: String?
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name, slug: String?
    let gamesCount: Int?
    let imageBackground: String?
    let domain: Domain?
    let language: Language?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case domain, language
    }
}

enum Domain: String, Codable {
    case appsAppleCOM = "apps.apple.com"
    case epicgamesCOM = "epicgames.com"
    case gogCOM = "gog.com"
    case marketplaceXboxCOM = "marketplace.xbox.com"
    case microsoftCOM = "microsoft.com"
    case nintendoCOM = "nintendo.com"
    case playGoogleCOM = "play.google.com"
    case storePlaystationCOM = "store.playstation.com"
    case storeSteampoweredCOM = "store.steampowered.com"
}

enum Language: String, Codable {
    case eng = "eng"
}

// MARK: - ParentPlatform
struct ParentPlatform: Codable {
    let platform: EsrbRating?
}

// MARK: - PlatformElement
struct PlatformElement: Codable {
    let platform: PlatformPlatform?
    let releasedAt: String?
    let requirementsEn, requirementsRu: Requirements?

    enum CodingKeys: String, CodingKey {
        case platform
        case releasedAt = "released_at"
        case requirementsEn = "requirements_en"
        case requirementsRu = "requirements_ru"
    }
}

// MARK: - PlatformPlatform
struct PlatformPlatform: Codable {
    let id: Int?
    let name, slug: String?
    let image, yearEnd: JSONNull?
    let yearStart: Int?
    let gamesCount: Int?
    let imageBackground: String?

    enum CodingKeys: String, CodingKey {
        case id, name, slug, image
        case yearEnd = "year_end"
        case yearStart = "year_start"
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
}

// MARK: - Requirements
struct Requirements: Codable {
    let minimum, recommended: String?
}

// MARK: - Rating
struct Rating: Codable {
    let id: Int?
    let title: Title?
    let count: Int?
    let percent: Double?
}

enum Title: String, Codable {
    case exceptional = "exceptional"
    case meh = "meh"
    case recommended = "recommended"
    case skip = "skip"
}

// MARK: - ShortScreenshot
struct ShortScreenshot: Codable {
    let id: Int?
    let image: String?
}

// MARK: - Store
struct Store: Codable {
    let id: Int?
    let store: Genre?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
