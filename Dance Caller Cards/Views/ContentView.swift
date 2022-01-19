//
//  ContentView.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/5/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var settings = UserSettings()
    
    var body: some View {
        VStack {
            DanceList()
        }
        .environmentObject(settings)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
