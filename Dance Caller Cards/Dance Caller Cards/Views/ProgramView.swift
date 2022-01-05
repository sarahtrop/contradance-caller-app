//
//  ProgramView.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/3/22.
//

import SwiftUI

struct ProgramView: View {
    var program: Program
    
    var body: some View {
        NavigationView {
            ScrollView {
                List(program.dances) { dance in
                    NavigationLink {
                        DanceCard(dance: dance)
                            .shadow(color:.gray, radius: 1)
                    } label: {
                        DancePreview(dance: dance)
                    }
                }
            }
        }
        .navigationTitle(program.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProgramView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramView(program: ModelData().programs[0])
    }
}
