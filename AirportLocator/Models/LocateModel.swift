//
//  LocateModel.swift
//  AirportLocator
//
//  Created by Gamil Ali Qaid Shamar on 25/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

// this class model has been created online by using response JSON from google API,
// this model should match the same structure of response JSON
// JSONDecoder() has been used to decode response data to model

import Foundation

// MARK: - LocateModel
class LocateModel: Codable {
    var htmlAttributions: [JSONAny]?
    var nextPageToken: String?
    var results: [Result]?
    var status: String?

    enum CodingKeys: String, CodingKey {
        case htmlAttributions
        case nextPageToken
        case results
        case status
    }

    init(htmlAttributions: [JSONAny]?, nextPageToken: String?, results: [Result]?, status: String?) {
        self.htmlAttributions = htmlAttributions
        self.nextPageToken = nextPageToken
        self.results = results
        self.status = status
    }
}

// MARK: LocateModel convenience initializers and mutators

extension LocateModel {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(LocateModel.self, from: data)
        self.init(htmlAttributions: me.htmlAttributions, nextPageToken: me.nextPageToken, results: me.results, status: me.status)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        htmlAttributions: [JSONAny]?? = nil,
        nextPageToken: String?? = nil,
        results: [Result]?? = nil,
        status: String?? = nil
    ) -> LocateModel {
        return LocateModel(
            htmlAttributions: htmlAttributions ?? self.htmlAttributions,
            nextPageToken: nextPageToken ?? self.nextPageToken,
            results: results ?? self.results,
            status: status ?? self.status
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
class Result: Codable {
    var formattedAddress: String?
    var geometry: Geometry?
    var icon: String?
    var id: String?
    var name: String?
    var openingHours: OpeningHours?
    var photos: [Photo]?
    var placeID: String?
    var plusCode: PlusCode?
    var rating: Double?
    var reference: String?
    var types: [TypeElement]?
    var userRatingsTotal: Int?

    enum CodingKeys: String, CodingKey {
        case formattedAddress
        case geometry
        case icon
        case id
        case name
        case openingHours
        case photos
        case placeID
        case plusCode
        case rating
        case reference
        case types
        case userRatingsTotal
    }

    init(formattedAddress: String?, geometry: Geometry?, icon: String?, id: String?, name: String?, openingHours: OpeningHours?, photos: [Photo]?, placeID: String?, plusCode: PlusCode?, rating: Double?, reference: String?, types: [TypeElement]?, userRatingsTotal: Int?) {
        self.formattedAddress = formattedAddress
        self.geometry = geometry
        self.icon = icon
        self.id = id
        self.name = name
        self.openingHours = openingHours
        self.photos = photos
        self.placeID = placeID
        self.plusCode = plusCode
        self.rating = rating
        self.reference = reference
        self.types = types
        self.userRatingsTotal = userRatingsTotal
    }
    
    init(formattedAddress: String?) {
        self.formattedAddress = formattedAddress
        
    }
}

// MARK: Result convenience initializers and mutators

extension Result {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Result.self, from: data)
        self.init(formattedAddress: me.formattedAddress, geometry: me.geometry, icon: me.icon, id: me.id, name: me.name, openingHours: me.openingHours, photos: me.photos, placeID: me.placeID, plusCode: me.plusCode, rating: me.rating, reference: me.reference, types: me.types, userRatingsTotal: me.userRatingsTotal)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        formattedAddress: String?? = nil,
        geometry: Geometry?? = nil,
        icon: String?? = nil,
        id: String?? = nil,
        name: String?? = nil,
        openingHours: OpeningHours?? = nil,
        photos: [Photo]?? = nil,
        placeID: String?? = nil,
        plusCode: PlusCode?? = nil,
        rating: Double?? = nil,
        reference: String?? = nil,
        types: [TypeElement]?? = nil,
        userRatingsTotal: Int?? = nil
    ) -> Result {
        return Result(
            formattedAddress: formattedAddress ?? self.formattedAddress,
            geometry: geometry ?? self.geometry,
            icon: icon ?? self.icon,
            id: id ?? self.id,
            name: name ?? self.name,
            openingHours: openingHours ?? self.openingHours,
            photos: photos ?? self.photos,
            placeID: placeID ?? self.placeID,
            plusCode: plusCode ?? self.plusCode,
            rating: rating ?? self.rating,
            reference: reference ?? self.reference,
            types: types ?? self.types,
            userRatingsTotal: userRatingsTotal ?? self.userRatingsTotal
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Geometry
class Geometry: Codable {
    var location: Location?
    var viewport: Viewport?

    enum CodingKeys: String, CodingKey {
        case location
        case viewport
    }

    init(location: Location?, viewport: Viewport?) {
        self.location = location
        self.viewport = viewport
    }
}

// MARK: Geometry convenience initializers and mutators

extension Geometry {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Geometry.self, from: data)
        self.init(location: me.location, viewport: me.viewport)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        location: Location?? = nil,
        viewport: Viewport?? = nil
    ) -> Geometry {
        return Geometry(
            location: location ?? self.location,
            viewport: viewport ?? self.viewport
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Location
class Location: Codable {
    var lat: Double?
    var lng: Double?

    enum CodingKeys: String, CodingKey {
        case lat
        case lng
    }

    init(lat: Double?, lng: Double?) {
        self.lat = lat
        self.lng = lng
    }
}

// MARK: Location convenience initializers and mutators

extension Location {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Location.self, from: data)
        self.init(lat: me.lat, lng: me.lng)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        lat: Double?? = nil,
        lng: Double?? = nil
    ) -> Location {
        return Location(
            lat: lat ?? self.lat,
            lng: lng ?? self.lng
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Viewport
class Viewport: Codable {
    var northeast: Location?
    var southwest: Location?

    enum CodingKeys: String, CodingKey {
        case northeast
        case southwest
    }

    init(northeast: Location?, southwest: Location?) {
        self.northeast = northeast
        self.southwest = southwest
    }
}

// MARK: Viewport convenience initializers and mutators

extension Viewport {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Viewport.self, from: data)
        self.init(northeast: me.northeast, southwest: me.southwest)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        northeast: Location?? = nil,
        southwest: Location?? = nil
    ) -> Viewport {
        return Viewport(
            northeast: northeast ?? self.northeast,
            southwest: southwest ?? self.southwest
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - OpeningHours
class OpeningHours: Codable {
    var openNow: Bool?

    enum CodingKeys: String, CodingKey {
        case openNow
    }

    init(openNow: Bool?) {
        self.openNow = openNow
    }
}

// MARK: OpeningHours convenience initializers and mutators

extension OpeningHours {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(OpeningHours.self, from: data)
        self.init(openNow: me.openNow)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        openNow: Bool?? = nil
    ) -> OpeningHours {
        return OpeningHours(
            openNow: openNow ?? self.openNow
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Photo
class Photo: Codable {
    var height: Int?
    var htmlAttributions: [String]?
    var photoReference: String?
    var width: Int?

    enum CodingKeys: String, CodingKey {
        case height
        case htmlAttributions
        case photoReference
        case width
    }

    init(height: Int?, htmlAttributions: [String]?, photoReference: String?, width: Int?) {
        self.height = height
        self.htmlAttributions = htmlAttributions
        self.photoReference = photoReference
        self.width = width
    }
}

// MARK: Photo convenience initializers and mutators

extension Photo {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Photo.self, from: data)
        self.init(height: me.height, htmlAttributions: me.htmlAttributions, photoReference: me.photoReference, width: me.width)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        height: Int?? = nil,
        htmlAttributions: [String]?? = nil,
        photoReference: String?? = nil,
        width: Int?? = nil
    ) -> Photo {
        return Photo(
            height: height ?? self.height,
            htmlAttributions: htmlAttributions ?? self.htmlAttributions,
            photoReference: photoReference ?? self.photoReference,
            width: width ?? self.width
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - PlusCode
class PlusCode: Codable {
    var compoundCode: String?
    var globalCode: String?

    enum CodingKeys: String, CodingKey {
        case compoundCode
        case globalCode
    }

    init(compoundCode: String?, globalCode: String?) {
        self.compoundCode = compoundCode
        self.globalCode = globalCode
    }
}

// MARK: PlusCode convenience initializers and mutators

extension PlusCode {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(PlusCode.self, from: data)
        self.init(compoundCode: me.compoundCode, globalCode: me.globalCode)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        compoundCode: String?? = nil,
        globalCode: String?? = nil
    ) -> PlusCode {
        return PlusCode(
            compoundCode: compoundCode ?? self.compoundCode,
            globalCode: globalCode ?? self.globalCode
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum TypeElement: String, Codable {
    case airport = "airport"
    case establishment = "establishment"
    case pointOfInterest = "point_of_interest"
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

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
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

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
