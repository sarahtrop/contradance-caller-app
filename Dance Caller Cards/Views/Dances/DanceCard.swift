//
//  DanceCard.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/5/22.
//

import SwiftUI

struct DanceCard: View {
    var dance: Dance
    var isExpanded: Bool = false

    var body: some View {
        VStack {
            DancePreview(dance: dance)
            if isExpanded {
                // set the title, author, tags at the top
                Divider()
                // include the figures of the dance, divided into the parts of the song (a, b)
                HStack {
                    VStack(alignment: .leading) {
                        DancePart(name: "A1", figures: dance.figures["A1"] ?? [])
                        DancePart(name: "A2", figures: dance.figures["A2"] ?? [])
                        DancePart(name: "B1", figures: dance.figures["B1"] ?? [])
                        DancePart(name: "B2", figures: dance.figures["B2"] ?? [])
                    }
                    Spacer()
                }
                // if there are caller notes, display them
                if dance.notes != "" {
                    VStack {
                        Divider()
                        HStack {
                            Text(dance.notes)
                                .font(.system(size: 14))
                                .padding(.all, 7)
                            Spacer()
                        }
                    }
                }
            }
        }
        .background(
            Rectangle()
                .fill(.white)
                .shadow(color: .gray, radius: 2, x:1, y: 2)
        )
    }
}

struct DanceCard_Previews: PreviewProvider {
    static var previews: some View {
        DanceCard(dance: ModelData().dances[0])
    }
}
