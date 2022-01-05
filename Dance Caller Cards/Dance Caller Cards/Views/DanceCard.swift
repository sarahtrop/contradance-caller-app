//
//  DanceCard.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/3/22.
//

import SwiftUI

struct DanceCard: View {
    var dance: Dance
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // set the title, author, tags at the top
                DancePreview(dance: dance)
                    .frame(height: geometry.size.height / 8)
                    .ignoresSafeArea(edges: .top)
                    .padding(.top, 1)
                Divider()
                // include the figures of the dance, divided into the parts of the song (a, b)
                VStack(alignment: .leading) {
                    DancePart(name: "A1", figures: dance.A1)
                    DancePart(name: "A2", figures: dance.A2)
                    DancePart(name: "B1", figures: dance.B1)
                    DancePart(name: "B2", figures: dance.B2)
                }
                .offset(x: geometry.size.width / 8 * -1)
                // if there are caller notes, display them
                if dance.notes != "" {
                    Divider()
                    Text(dance.notes)
                        .font(.system(size: 12))
                        .padding(.horizontal, 2)
                        .padding(.bottom, 2)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding(.all, 2)
            .border(Color.gray, width: 1)
        }
    }
}

struct DanceCard_Previews: PreviewProvider {
    static var previews: some View {
        DanceCard(dance: ModelData().programs[0].dances[0])
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
