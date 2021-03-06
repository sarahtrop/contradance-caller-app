//
//  DancePreview.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/5/22.
//

import SwiftUI

struct DancePreview: View {
    var dance: Dance
    
    func filterAndJoinTags(tags: [Tag]) -> [Tag] {
        // take in a list of tags, filter on category, then map
        // to strings and return a single string of joined tags
        // we don't care about figure tags for this display
        let filteredTags = dance.tags.filter({ $0.category != "figure" })
        return filteredTags
    }
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(dance.name!)
                    .font(.headline)
                Text(dance.choreographerName)
                    .font(.subheadline)
            }
            .padding(.horizontal, 5.0)
            Spacer()
            Divider()
            ForEach(filterAndJoinTags(tags: dance.tags), id: \.self) { tag in
                Text(verbatim: tag.name!)
                    .font(.caption)
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(tag.color)
                    )
            }
        }
        .padding(.horizontal, 2)
        .padding(.vertical, 5)
        .fixedSize(horizontal: false, vertical: true)
    }
}

//struct DancePreview_Previews: PreviewProvider {
//    static var previews: some View {
//        DancePreview()
//    }
//}
