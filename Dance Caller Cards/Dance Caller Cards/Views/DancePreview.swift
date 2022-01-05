//
//  DancePreview.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/3/22.
//

import SwiftUI

struct DancePreview: View {
    var dance: Dance
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(dance.name)
                    .font(.headline)
                Text(dance.author)
                    .font(.subheadline)
            }
            .padding(.horizontal, 5.0)
            Spacer()
            Divider()

            Text(dance.tags.map{ $0.name }.joined(separator: ", "))
                .font(.system(size: 12))
                .fontWeight(.light)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.trailing)
                .padding(/*@START_MENU_TOKEN@*/.horizontal, 5.0/*@END_MENU_TOKEN@*/)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(nil)
        }
    }
}

struct DancePreview_Previews: PreviewProvider {
    static var previews: some View {
        DancePreview(dance: ModelData().programs[0].dances[0])
            .previewLayout(.fixed(width: 300, height: 60))
    }
}
