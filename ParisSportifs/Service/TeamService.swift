//
//  TeamService.swift
//  ParisSportifs
//
//  Created by Achraf Ben Tekaya on 05/10/2023.
//

import Foundation
import AlamofireObjectMapper
import Alamofire

public struct TeamService {
    
    //API to retreive the list of teams in a selected league
    static func getTeams(leagueName: String, _ handler:@escaping ([Team]?) -> Void){
        
        //make the url encoded from the given parameters
        let encodedLeagueName =
        leagueName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let URL = Constants.beginUrl + Constants.apiKey + "/search_all_teams.php?l=" + encodedLeagueName
        
        //make api request with alamofire and parse then store the response on the model designed
        Alamofire.request(URL).responseObject { (response: DataResponse<TeamsResponse>) in

            let teamsResponse = response.result.value
            if let teams = teamsResponse?.teams {
                //success case
                handler(teams)
            }
            else {
                //error case
                handler(nil)
            }
        }
    }
    
    //API to retreive the selected team details
    static func getTeamDetails(teamName: String, _ handler:@escaping (Team?) -> Void){
        
        //make the url encoded from the given parameters
        let encodedTeamName =
        teamName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let URL = Constants.beginUrl + Constants.apiKey + "/searchteams.php?t=" + encodedTeamName

        //make api request with alamofire and parse then store the response on the model designed
        Alamofire.request(URL).responseObject { (response: DataResponse<TeamsResponse>) in

            let teamsResponse = response.result.value
            if let teams = teamsResponse?.teams {
                //success case
                handler(teams[0])
            }
            else {
                //error case
                handler(nil)
            }
        }
    }

    
}
