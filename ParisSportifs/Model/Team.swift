//
//  Team.swift
//  ParisSportifs
//
//  Created by Achraf Ben Tekaya on 05/10/2023.
//

import Foundation
import ObjectMapper

// MARK: - TeamsResponse
struct TeamsResponse: Mappable {
    var teams: [Team]?
    
    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        teams <- map["teams"]
    }
}

// MARK: - Team
struct Team : Mappable, Hashable {
    var idTeam : String?
    var idSoccerXML : String?
    var idAPIfootball : String?
    var intLoved : String?
    var strTeam : String?
    var strTeamShort : String?
    var strAlternate : String?
    var intFormedYear : String?
    var strSport : String?
    var strLeague : String?
    var idLeague : String?
    var strLeague2 : String?
    var idLeague2 : String?
    var strLeague3 : String?
    var idLeague3 : String?
    var strLeague4 : String?
    var idLeague4 : String?
    var strLeague5 : String?
    var idLeague5 : String?
    var strLeague6 : String?
    var idLeague6 : String?
    var strLeague7 : String?
    var idLeague7 : String?
    var strDivision : String?
    var strManager : String?
    var strStadium : String?
    var strKeywords : String?
    var strRSS : String?
    var strStadiumThumb : String?
    var strStadiumDescription : String?
    var strStadiumLocation : String?
    var intStadiumCapacity : String?
    var strWebsite : String?
    var strFacebook : String?
    var strTwitter : String?
    var strInstagram : String?
    var strDescriptionEN : String?
    var strDescriptionDE : String?
    var strDescriptionFR : String?
    var strDescriptionCN : String?
    var strDescriptionIT : String?
    var strDescriptionJP : String?
    var strDescriptionRU : String?
    var strDescriptionES : String?
    var strDescriptionPT : String?
    var strDescriptionSE : String?
    var strDescriptionNL : String?
    var strDescriptionHU : String?
    var strDescriptionNO : String?
    var strDescriptionIL : String?
    var strDescriptionPL : String?
    var strKitColour1 : String?
    var strKitColour2 : String?
    var strKitColour3 : String?
    var strGender : String?
    var strCountry : String?
    var strTeamBadge : String?
    var strTeamJersey : String?
    var strTeamLogo : String?
    var strTeamFanart1 : String?
    var strTeamFanart2 : String?
    var strTeamFanart3 : String?
    var strTeamFanart4 : String?
    var strTeamBanner : String?
    var strYoutube : String?
    var strLocked : String?

    init?(map: Map) {

    }
    
    init?(id: String, name : String, image: String, country: String, league: String, description: String) {
        self.idTeam = id
        self.strTeam = name
        self.strTeamLogo = image
        self.strCountry = country
        self.strLeague = league
        self.strDescriptionEN = description
    }

    mutating func mapping(map: Map) {
        idTeam <- map["idTeam"]
        idSoccerXML <- map["idSoccerXML"]
        idAPIfootball <- map["idAPIfootball"]
        intLoved <- map["intLoved"]
        strTeam <- map["strTeam"]
        strTeamShort <- map["strTeamShort"]
        strAlternate <- map["strAlternate"]
        intFormedYear <- map["intFormedYear"]
        strSport <- map["strSport"]
        strLeague <- map["strLeague"]
        idLeague <- map["idLeague"]
        strLeague2 <- map["strLeague2"]
        idLeague2 <- map["idLeague2"]
        strLeague3 <- map["strLeague3"]
        idLeague3 <- map["idLeague3"]
        strLeague4 <- map["strLeague4"]
        idLeague4 <- map["idLeague4"]
        strLeague5 <- map["strLeague5"]
        idLeague5 <- map["idLeague5"]
        strLeague6 <- map["strLeague6"]
        idLeague6 <- map["idLeague6"]
        strLeague7 <- map["strLeague7"]
        idLeague7 <- map["idLeague7"]
        strDivision <- map["strDivision"]
        strManager <- map["strManager"]
        strStadium <- map["strStadium"]
        strKeywords <- map["strKeywords"]
        strRSS <- map["strRSS"]
        strStadiumThumb <- map["strStadiumThumb"]
        strStadiumDescription <- map["strStadiumDescription"]
        strStadiumLocation <- map["strStadiumLocation"]
        intStadiumCapacity <- map["intStadiumCapacity"]
        strWebsite <- map["strWebsite"]
        strFacebook <- map["strFacebook"]
        strTwitter <- map["strTwitter"]
        strInstagram <- map["strInstagram"]
        strDescriptionEN <- map["strDescriptionEN"]
        strDescriptionDE <- map["strDescriptionDE"]
        strDescriptionFR <- map["strDescriptionFR"]
        strDescriptionCN <- map["strDescriptionCN"]
        strDescriptionIT <- map["strDescriptionIT"]
        strDescriptionJP <- map["strDescriptionJP"]
        strDescriptionRU <- map["strDescriptionRU"]
        strDescriptionES <- map["strDescriptionES"]
        strDescriptionPT <- map["strDescriptionPT"]
        strDescriptionSE <- map["strDescriptionSE"]
        strDescriptionNL <- map["strDescriptionNL"]
        strDescriptionHU <- map["strDescriptionHU"]
        strDescriptionNO <- map["strDescriptionNO"]
        strDescriptionIL <- map["strDescriptionIL"]
        strDescriptionPL <- map["strDescriptionPL"]
        strKitColour1 <- map["strKitColour1"]
        strKitColour2 <- map["strKitColour2"]
        strKitColour3 <- map["strKitColour3"]
        strGender <- map["strGender"]
        strCountry <- map["strCountry"]
        strTeamBadge <- map["strTeamBadge"]
        strTeamJersey <- map["strTeamJersey"]
        strTeamLogo <- map["strTeamLogo"]
        strTeamFanart1 <- map["strTeamFanart1"]
        strTeamFanart2 <- map["strTeamFanart2"]
        strTeamFanart3 <- map["strTeamFanart3"]
        strTeamFanart4 <- map["strTeamFanart4"]
        strTeamBanner <- map["strTeamBanner"]
        strYoutube <- map["strYoutube"]
        strLocked <- map["strLocked"]
    }

}
