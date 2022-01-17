//
//  NavBarIcons.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/16/22.
//

import SwiftUI

struct FilterIcon: View {
    let color: Color = Color("AccentColor")
    let trailingPadding: CGFloat = 10
    let width: CGFloat = 40
    let height: CGFloat = 25
    let shadowRadius: Double = 0.5
    
    var body: some View {
        Image(systemName: "slider.horizontal.3")
            .resizable()
            .foregroundColor(color)
            .padding(.trailing, trailingPadding)
            .frame(width: width, height: height)
            .shadow(color: .gray, radius: shadowRadius)
    }
}

struct AddIcon: View {
    let color: Color = Color.green
    let trailingPadding: CGFloat = 10
    let width: CGFloat = 40
    let height: CGFloat = 30
    let shadowRadius: Double = 0.5
    
    var body : some View {
        Image(systemName: "plus.circle")
            .resizable()
            .foregroundColor(color)
            .padding(.trailing, trailingPadding)
            .frame(width: width, height: height)
            .shadow(color: .gray, radius: shadowRadius)
    }
}

struct XcodeLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    public var views: [LibraryItem] {
        LibraryItem(FilterIcon(),
                    visible: true,
                    title: "Top Bar Filter Icon",
                    category: .control)
        LibraryItem(AddIcon(),
                    visible: true,
                    title: "Top Bar Add Icon",
                    category: .control)
    }
}
