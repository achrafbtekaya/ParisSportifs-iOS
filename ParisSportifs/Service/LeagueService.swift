//
//  RequestManager.swift
//  ParisSportifs
//
//  Created by Achraf Ben Tekaya on 05/10/2023.
//

import Foundation
import AlamofireObjectMapper
import Alamofire

public struct LeagueService {
    
    //API to retrieve the list of available leagues
    static func getLeagues(_ handler:@escaping ([League]?) -> Void){
        
        //make the url from the given parameters
        let URL = Constants.beginUrl + Constants.apiKey + "/all_leagues.php"
        
        //make api request with alamofire and parse then store the response on the model designed
        Alamofire.request(URL).responseObject { (response: DataResponse<LeaguesResponse>) in

            let leaguesResponse = response.result.value
            if let leagues = leaguesResponse?.leagues {
                //success case
                handler(leagues)
            }
            else {
                //error case
                handler(nil)
            }
        }
    }
    
}
