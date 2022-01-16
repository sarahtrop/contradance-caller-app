//
//  DancePartV.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/5/22.
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
                .frame(width: 30)
                .padding(.leading, 7)
                .padding(.bottom, 3)
                .font(.system(size: 16))
            HStack {
                VStack(alignment: .leading) {
                    ForEach(figures) { figure in
                        Text("(\(figure.beats))")
                            .fontWeight(.light)
                            .padding(.bottom, 0.2)
                    }
                }
                .frame(width: 30)
                VStack(alignment: .leading) {
                    ForEach(figures) { figure in
                        Text(figure.figure)
                            .padding(.bottom, 0.2)
                    }
                }
            }
            .font(.system(size: 14))
            .padding(.bottom, 3)
        }
    }
}

struct DancePart_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading) {
            DancePart(name: "A1", figures: ModelData().dances[0].figures["A1"] ?? [])
            DancePart(name: "A2", figures: ModelData().dances[0].figures["A2"] ?? [])
            DancePart(name: "B1", figures: ModelData().dances[0].figures["B1"] ?? [])
            DancePart(name: "B2", figures: ModelData().dances[0].figures["B2"] ?? [])
        }
    }
}
