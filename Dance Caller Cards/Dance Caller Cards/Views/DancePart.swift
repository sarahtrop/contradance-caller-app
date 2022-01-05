//
//  DancePartV.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/3/22.
//

import SwiftUI

struct DancePart: View {
    var name: String
    var figures: [Dance.Figure]
    
    var body: some View {
        HStack(alignment: .top) {
            Text(name)
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.trailing, 2)
                .font(.system(size: 14))
            VStack(alignment: .leading) {
                ForEach(figures) { figure in
                    HStack {
                        Text("(\(figure.beats))")
                            .fontWeight(.light)
                        Text(figure.figure)
                    }
                    .font(.system(size: 12))
                    .padding(.vertical, 1)
                }
            }
            .offset(x: 5)
        }
        .multilineTextAlignment(.leading)
    }
}

struct DancePart_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading) {
            DancePart(name: "A1", figures: ModelData().programs[0].dances[0].A1)
            DancePart(name: "A2", figures: ModelData().programs[0].dances[0].A2)
            DancePart(name: "B1", figures: ModelData().programs[0].dances[0].B1)
            DancePart(name: "B2", figures: ModelData().programs[0].dances[0].B2)
        }
    }
}
