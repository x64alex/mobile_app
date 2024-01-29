import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            TabView {
                MealsListView()
                    .tabItem {
                        Label("All meals", systemImage: "2.circle")
                    }
                Text("Manage section")
                    .tabItem {
                        Label("Manage section", systemImage: "2.circle")
                    }
            }
        }
    }
}

