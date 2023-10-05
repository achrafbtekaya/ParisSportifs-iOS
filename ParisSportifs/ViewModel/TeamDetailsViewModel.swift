//
//  TeamDetailsViewModel.swift
//  ParisSportifs
//
//  Created by Achraf Ben Tekaya on 05/10/2023.
//

import Foundation

class TeamDetailsViewModel:ObservableObject {
    
    @Published var selectedTeam: Team!
    var teamName = ""
    
    @Published var isLoading = false
    @Published var isError = false
    @Published var errorText = ""

    init() {
        
    }
    
    func getTeamDetails(teamName: String){
        //bool to show loading view
        isLoading = true

        TeamService.getTeamDetails(teamName: teamName) { team in
            //stop loading
            self.isLoading = false
            //store team name to be used in the view
            self.teamName = teamName

            if let teamDetails = team {
                //store the selected team to show his details in the view
                self.selectedTeam = teamDetails
            }
            else {
                //bool to show error popup
                self.isError = true
                //error text to be shown
                self.errorText = "Get team details request error"
            }
        }
    }
    
    func retryFailedApi() {
        //retry get teams details api on fail
        getTeamDetails(teamName: teamName)
    }

}
