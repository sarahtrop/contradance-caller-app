//
//  ProgramView.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/18/22.
//

import SwiftUI

struct ProgramView: View {
    var program: Program
    
    var body: some View {
        VStack {
            HStack {
                Text(program.name)
                    .font(.headline)
                Spacer()
                Text(program.getDateString())
                    .font(.subheadline)
            }
            Divider()
            ExpandableDanceCardList(dances: program.getDancesInOrder())
        }
    }
}

struct ProgramView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramView(program: ModelData().programs[0])
    }
}
