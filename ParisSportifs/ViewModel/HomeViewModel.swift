//
//  HomeViewModel.swift
//  ParisSportifs
//
//  Created by Achraf Ben Tekaya on 05/10/2023.
//

import Foundation

class HomeViewModel:ObservableObject {
    
    @Published var leagues: [League]!
    @Published var teams: [Team]!
    var leagueName = ""
    
    @Published var isLoading = false
    @Published var isError = false
    @Published var errorText = ""
    var errorCode = 0

    init(shouldCallAPI: Bool = true) {
        //get leagues list on init app
        if shouldCallAPI { getLeagues() }
    }
    
    func getLeagues(){
        //bool to show loading view
        isLoading = true
        
        LeagueService.getLeagues { leagues in
            //stop loading
            self.isLoading = false
            
            if let leaguesList = leagues {
                //get leagues list
                self.leagues = leaguesList
            }
            else {
                //bool to show error popup
                self.isError = true
                //error text to be shown
                self.errorText = "Get leagues request error"
                //error code to determine which api should be retried
                self.errorCode = 1
            }
        }
    }
    
    func getTeams(leagueName: String){
        //bool to show loading view
        isLoading = true

        TeamService.getTeams(leagueName: leagueName) { teams in
            //stop loading
            self.isLoading = false
            //store league name to be used in the view
            self.leagueName = leagueName

            if let teamsList = teams {
                let sortedTeamsList = self.sortTeamsList(teams: teamsList)
                self.teams = self.keepOneTeamOutOfTwo(teams: sortedTeamsList)
            }
            else {
                //bool to show error popup
                self.isError = true
                //error text to be shown
                self.errorText = "Get teams request error"
                //error code to determine which api should be retried
                self.errorCode = 2
            }
        }
    }
    
    func retryFailedApi() {
        //According to error code, retry the failed api
        switch errorCode {
        case 1:
            getLeagues()
        case 2:
            getTeams(leagueName: leagueName)
        default:
            break
        }
    }
    
    func sortTeamsList (teams: [Team]) -> [Team] {
        return teams
        //display teams list sorted in anti-alphabetical order
        .sorted{ $0.strTeam ?? "" > $1.strTeam ?? "" }
    }
    
    func keepOneTeamOutOfTwo (teams: [Team]) -> [Team] {
        return teams
        //keep only 1 team / 2 as requested
        .enumerated()
        .filter({ index, _ in
            index % 2 == 0
        })
        .map { $0.element }
    }

}
