//
//  DanceCard.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/5/22.
//

import SwiftUI

fileprivate struct DancePart: View {
    @EnvironmentObject var settings: UserSettings
    
    var figures: [Figure]
    
    var body: some View {
        HStack(alignment: .top) {
            if settings.showPartNames {
                Text(figures[0].part!)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .frame(width: 30)
                    .padding(.leading, 7)
                    .padding(.bottom, 3)
                    .font(.system(size: 16))
            }
            HStack {
                VStack(alignment: .leading) {
                    ForEach(figures) { figure in
                        Text(figure.beatsString(settings.beatsNotation))
                            .fontWeight(.light)
                            .padding(.bottom, 0.2)
                    }
                }
                .frame(width: 30)
                VStack(alignment: .leading) {
                    ForEach(figures) { figure in
                        Text(figure.figure!)
                            .padding(.bottom, 0.2)
                    }
                }
            }
            .font(.system(size: 14))
            .padding(.bottom, 3)
            Spacer()
        }
    }
}

fileprivate struct DanceContents: View {
    @EnvironmentObject var settings: UserSettings
    
    var dance: Dance

    var body: some View {
        VStack {
            DancePart(figures: dance.figures.filter({$0.part == "A1"}).sorted())
                .environmentObject(settings)
            DancePart(figures: dance.figures.filter({$0.part == "A2"}).sorted())
                .environmentObject(settings)
            DancePart(figures: dance.figures.filter({$0.part == "B1"}).sorted())
                .environmentObject(settings)
            DancePart(figures: dance.figures.filter({$0.part == "B2"}).sorted())
                .environmentObject(settings)
        }
    }
}

struct DanceCard: View {
    @EnvironmentObject var settings: UserSettings

    var dance: Dance
    var isExpanded: Bool = false

    var body: some View {
        VStack {
            // set the title, author, tags at the top
            DancePreview(dance: dance)
            if isExpanded {
                Divider()
                // include the figures of the dance, divided into the parts of the song (a, b)
                DanceContents(dance: dance)
                // if there are caller notes, display them
                if !dance.notes!.isEmpty {
                    VStack {
                        Divider()
                        HStack {
                            Text(dance.notes!)
                                .font(.system(size: 14))
                                .padding(.all, 7)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

//struct DanceCard_Previews: PreviewProvider {
//    static let settings = UserSettings()
//
//    static var previews: some View {
//        DanceCard(dance: ModelData().dances[0])
//            .environmentObject(settings)
//    }
//}
