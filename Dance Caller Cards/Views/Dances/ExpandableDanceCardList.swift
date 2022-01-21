//
//  ExpandableDanceCardList.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/18/22.
//

import SwiftUI

struct ExpandableDanceCardList : View {
    var dances: [Dance]
    @State private var selection: Set<Dance> = []
    
    var body: some View {
        List {
            ForEach(dances) { dance in
                DanceCard(dance: dance, isExpanded: self.selection.contains(dance))
                    .onTapGesture {
                        self.selectDeselect(dance)
                    }
                    .transition(AnyTransition.move(edge: .top))
                    .animation(.linear, value: 0.3)
            }
        }
        .listStyle(.plain)
    }
    
    private func selectDeselect(_ dance: Dance) -> Void {
        if selection.contains(dance) {
            selection.remove(dance)
        } else {
            selection.insert(dance)
        }
    }
}

//struct ExpandableDanceCardList_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpandableDanceCardList(dances: ModelData().dances)
//    }
//}
