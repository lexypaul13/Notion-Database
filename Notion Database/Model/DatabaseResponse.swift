//
//  Database.swift
//  Notion Database
//
//  Created by Alex Paul on 1/30/22.
//

import Foundation

struct DatabaseResponse: Codable {
    let object: String
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case object = "object"
        case results = "results"
    }
}

struct Result: Codable {
    let properties: Properties
    
    enum CodingKeys: String, CodingKey {
        case properties = "properties"
    }
}

struct Properties: Codable {
    let tags: Tags
    let name: Name

    enum CodingKeys: String, CodingKey {
        case tags = "Tags"
        case name = "Name"
    }
}

struct Name: Codable {
    let title: [Title]
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
    }
}

struct Title: Codable {
    let text: Text
    let plainText: String

    enum CodingKeys: String, CodingKey {
        case text = "text"
        case plainText = "plain_text"
    }
}
 
struct Text: Codable {
    let content: String

    enum CodingKeys: String, CodingKey {
        case content = "content"
    }
}

 
struct Tags: Codable {
    let multiSelect: [MultiSelect]
    
    enum CodingKeys: String, CodingKey {
        case multiSelect = "multi_select"
    }
}

struct MultiSelect: Codable {
    let id: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}


