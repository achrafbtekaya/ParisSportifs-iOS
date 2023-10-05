//
//  TeamDetailsView.swift
//  ParisSportifs
//
//  Created by Achraf Ben Tekaya on 05/10/2023.
//

import SwiftUI

struct TeamDetailsView: View {
    var teamName: String
    
    @ObservedObject var teamDetailsVM: TeamDetailsViewModel

    var body: some View {
        NavigationView {
            //loading view
            LoadingView(isShowing: $teamDetailsVM.isLoading) {
                ScrollView {
                    //vstack to place each element of the view
                    VStack (alignment: .leading) {
                        //if the url of the team banner image is retreived
                        if let teambannerUrl = URL(string: teamDetailsVM.selectedTeam?.strTeamBanner ?? "") {
                            //show it in async umage component
                            AsyncImage(
                                url: teambannerUrl,
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                        }
                        Spacer()
                        //show team country
                        Text(teamDetailsVM.selectedTeam?.strCountry ?? "")
                            .font(.body)
                        Spacer()
                        //show team league name
                        Text(teamDetailsVM.selectedTeam?.strLeague ?? "")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                        //show team description
                        Text(teamDetailsVM.selectedTeam?.strDescriptionEN ?? "")
                            .font(.body)
                        Spacer()
                        
                    }
                    .padding(4)
                }
            }
        }
        //show the team name as navigation title
        .navigationTitle(teamName)
        .onAppear {
            //when the team details screen appear, call get team details api to retreive selected team details
            teamDetailsVM.getTeamDetails(teamName: teamName)
        }
    }
}


struct TeamDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailsView(teamName: "Team Title", teamDetailsVM: TeamDetailsViewModel())
    }
}
