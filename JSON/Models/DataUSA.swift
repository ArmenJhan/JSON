//
//  Model.swift
//  JSON
//
//  Created by Armen Madoyan on 06.11.2022.
//


struct DataUsa: Decodable {
    let data: [Data]
    let source: [Source]
}

struct Data: Decodable {
    let idNation:String
    let nation: String
    let idYear: Int
    let year: String
    let population: Int
    let slugNation: String
    
    enum CodingKeys: String, CodingKey {
        case idNation = "ID Nation"
        case nation = "Nation"
        case idYear = "ID Year"
        case year = "Year"
        case population = "Population"
        case slugNation = "Slug Nation"
        
    }
}

struct Source: Decodable {
    let measures: [String]
    let annotations: Annotations
}

struct Annotations: Decodable{
    let sourceName: String
    let sourceDescription: String
    let datasetName: String
    let datasetLink: String
    let tableId: String
    let topic: String
    let subtopic: String
    
    enum CodingKeys: String, CodingKey {
        case sourceName =  "source_name"
        case sourceDescription =    "source_description"
        case datasetName =   "dataset_name"
        case datasetLink =  "dataset_link"
        case tableId =  "table_id"
        case topic =   "topic"
        case subtopic =  "subtopic"
    }
}


