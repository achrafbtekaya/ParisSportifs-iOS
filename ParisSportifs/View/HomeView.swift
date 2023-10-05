//
//  HomeView.swift
//  ParisSportifs
//
//  Created by Achraf Ben Tekaya on 05/10/2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeVM: HomeViewModel

    var body: some View {
        NavigationView {
            GeometryReader { geometry in //to retreive screen width
                LoadingView(isShowing: $homeVM.isLoading) { //loading view will be shown according to view model bool
                    ZStack(alignment: .top) {
                        
                        if let teams = homeVM.teams {
                            //show teams logo list if exist
                            TeamsLogosCollectionView(teamList: teams)
                        }
                        
                        //autocompletion : show league list accoridng to search bar value
                        LeaguesListView(homeVM: homeVM, parentView: geometry)
                    }
                    //if error bool is true in the view model, show error popup
                    .alert("Error !", isPresented: $homeVM.isError, actions: {
                        Button("Cancel", role: .cancel, action: {})
                        Button("Retry", role: .none, action: {
                            homeVM.retryFailedApi()
                        })
                    }, message: {
                        Text(homeVM.errorText)
                    })

                }
            }
        }
        
    }
    
}

struct LeaguesListView: View {
    @ObservedObject var homeVM: HomeViewModel
    @State private var searchText = ""
    
    var parentView: GeometryProxy
    @State var searchResults: [String] = []
    @State var isSubmitted = false

    var body: some View {
        List {
            //show suggestion leagues list items
            ForEach(searchResults, id: \.self) { strLeague in
                Text(strLeague)
                    //on tap on suggestion
                    .onTapGesture {
                        //get the teams list of the selected league
                        homeVM.getTeams(leagueName: strLeague)
                        //set the selected league name on the search bar
                        searchText = strLeague
                        //hide suggestion list
                        self.searchResults = []
                        //confirm submit
                        self.isSubmitted = true
                    }
            }
        }
        //search bar
        .searchable(text: $searchText, prompt: "Search by league")
        //on change text on search bar
        .onChange(of: searchText, perform: { searchText in
            //check if wa should show the suggestion list or not
            if searchText.isEmpty || homeVM.leagues == nil || isSubmitted == true {
                self.isSubmitted = false
                self.searchResults = []
            } else {
                self.isSubmitted = false
                self.searchResults = homeVM.leagues!.filter { $0.strLeague!.lowercased() .contains(searchText.lowercased()) }
                    .map { $0.strLeague ?? "" }
            }

        })
        //suggestion list size and style
        .frame(height: searchResults.isEmpty ? 0 : parentView.size.height/3)
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }

}

struct TeamsLogosCollectionView: View {
    let teamList: [Team]
    //teams logo columns
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                //iterate teams logo list items
                ForEach(teamList, id: \.self) { team in
                    //if we can get the logo url then show image on async image
                    if let logoUrl = URL(string: team.strTeamBadge ?? "") {
                        //each logo image will show the details view on tapping
                        NavigationLink(destination: TeamDetailsView(teamName: team.strTeam ?? "", teamDetailsVM: TeamDetailsViewModel())) {
                            //logo image loading
                            AsyncImage(
                                url: logoUrl,
                                content: { image in
                                    image.resizable()
                                         .aspectRatio(contentMode: .fill)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                        }
                    } else {
                        Text("Loading failed")
                    }
                }
            }
        }
    }
}

struct LoadingView<Content>: View where Content: View {

    @Binding var isShowing: Bool  // should the modal be visible?
    var content: () -> Content
    var text: String?  // the text to display under the ProgressView - defaults to "Loading..."

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                // the content to display - if the modal is showing, we'll blur it
                content()
                    .disabled(isShowing)
                    .blur(radius: isShowing ? 2 : 0)
                
                // all contents inside here will only be shown when isShowing is true
                if isShowing {
                    // this Rectangle is a semi-transparent black overlay
                    Rectangle()
                        .fill(Color.black)
                        .opacity(isShowing ? 0.6 : 0)
                        .edgesIgnoringSafeArea(.all)

                    // the magic bit - our ProgressView just displays an activity
                    // indicator, with some text underneath showing what we are doing
                    VStack(spacing: 48) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .black))
                            .scaleEffect(2.0, anchor: .center)
                        Text(text ?? "Loading...")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                    }
                    .frame(width: 250, height: 200)
                    .background(Color.white)
                    .cornerRadius(16)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeVM: HomeViewModel())
    }
}
