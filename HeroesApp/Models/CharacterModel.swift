
import Foundation

// MARK: - CharacterModel
struct CharacterModel: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: DataClass?
}

// MARK: CharacterModel convenience initializers and mutators

extension CharacterModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CharacterModel.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        code: Int?? = nil,
        status: String?? = nil,
        copyright: String?? = nil,
        attributionText: String?? = nil,
        attributionHTML: String?? = nil,
        etag: String?? = nil,
        data: DataClass?? = nil
    ) -> CharacterModel {
        return CharacterModel(
            code: code ?? self.code,
            status: status ?? self.status,
            copyright: copyright ?? self.copyright,
            attributionText: attributionText ?? self.attributionText,
            attributionHTML: attributionHTML ?? self.attributionHTML,
            etag: etag ?? self.etag,
            data: data ?? self.data
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let offset, limit, total, count: Int?
    let results: [Result]?
}

// MARK: DataClass convenience initializers and mutators

extension DataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DataClass.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        offset: Int?? = nil,
        limit: Int?? = nil,
        total: Int?? = nil,
        count: Int?? = nil,
        results: [Result]?? = nil
    ) -> DataClass {
        return DataClass(
            offset: offset ?? self.offset,
            limit: limit ?? self.limit,
            total: total ?? self.total,
            count: count ?? self.count,
            results: results ?? self.results
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let name, resultDescription: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics, series: Comics?
    let stories: Stories?
    let events: Comics?
    let urls: [URLElement]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
    }
}

// MARK: Result convenience initializers and mutators

extension Result {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Result.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        name: String?? = nil,
        resultDescription: String?? = nil,
        modified: String?? = nil,
        thumbnail: Thumbnail?? = nil,
        resourceURI: String?? = nil,
        comics: Comics?? = nil,
        series: Comics?? = nil,
        stories: Stories?? = nil,
        events: Comics?? = nil,
        urls: [URLElement]?? = nil
    ) -> Result {
        return Result(
            id: id ?? self.id,
            name: name ?? self.name,
            resultDescription: resultDescription ?? self.resultDescription,
            modified: modified ?? self.modified,
            thumbnail: thumbnail ?? self.thumbnail,
            resourceURI: resourceURI ?? self.resourceURI,
            comics: comics ?? self.comics,
            series: series ?? self.series,
            stories: stories ?? self.stories,
            events: events ?? self.events,
            urls: urls ?? self.urls
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Comics
struct Comics: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
    let returned: Int?
}

// MARK: Comics convenience initializers and mutators

extension Comics {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Comics.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        available: Int?? = nil,
        collectionURI: String?? = nil,
        items: [ComicsItem]?? = nil,
        returned: Int?? = nil
    ) -> Comics {
        return Comics(
            available: available ?? self.available,
            collectionURI: collectionURI ?? self.collectionURI,
            items: items ?? self.items,
            returned: returned ?? self.returned
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI: String?
    let name: String?
}

// MARK: ComicsItem convenience initializers and mutators

extension ComicsItem {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ComicsItem.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        resourceURI: String?? = nil,
        name: String?? = nil
    ) -> ComicsItem {
        return ComicsItem(
            resourceURI: resourceURI ?? self.resourceURI,
            name: name ?? self.name
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Stories
struct Stories: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
    let returned: Int?
}

// MARK: Stories convenience initializers and mutators

extension Stories {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Stories.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        available: Int?? = nil,
        collectionURI: String?? = nil,
        items: [ComicsItem]?? = nil,
        returned: Int?? = nil
    ) -> Stories {
        return Stories(
            available: available ?? self.available,
            collectionURI: collectionURI ?? self.collectionURI,
            items: items ?? self.items,
            returned: returned ?? self.returned
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI: String?
    let name: String?
    let type: ItemType?
}

// MARK: StoriesItem convenience initializers and mutators

extension StoriesItem {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(StoriesItem.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        resourceURI: String?? = nil,
        name: String?? = nil,
        type: ItemType?? = nil
    ) -> StoriesItem {
        return StoriesItem(
            resourceURI: resourceURI ?? self.resourceURI,
            name: name ?? self.name,
            type: type ?? self.type
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum ItemType: String, Codable {
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String?
    let thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: Thumbnail convenience initializers and mutators

extension Thumbnail {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Thumbnail.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        path: String?? = nil,
        thumbnailExtension: String?? = nil
    ) -> Thumbnail {
        return Thumbnail(
            path: path ?? self.path,
            thumbnailExtension: thumbnailExtension ?? self.thumbnailExtension
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - URLElement
struct URLElement: Codable {
    let type: URLType?
    let url: String?
}

// MARK: URLElement convenience initializers and mutators

extension URLElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(URLElement.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        type: URLType?? = nil,
        url: String?? = nil
    ) -> URLElement {
        return URLElement(
            type: type ?? self.type,
            url: url ?? self.url
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum URLType: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

