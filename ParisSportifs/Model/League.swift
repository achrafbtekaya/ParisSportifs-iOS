//
//  Ligue.swift
//  ParisSportifs
//
//  Created by Achraf Ben Tekaya on 05/10/2023.
//

import Foundation
import ObjectMapper

// MARK: - LeaguesResponse
struct LeaguesResponse: Mappable {
    var leagues: [League]?
    
    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        leagues <- map["leagues"]
    }
}

// MARK: - League
struct League: Mappable, Hashable {
    var idLeague : String?
    var strLeague : String?
    var strSport : String?
    var strLeagueAlternate : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        idLeague <- map["idLeague"]
        strLeague <- map["strLeague"]
        strSport <- map["strSport"]
        strLeagueAlternate <- map["strLeagueAlternate"]
    }
}

