//
//  TabBarPreferenceKey.swift
//  CombineApp
//
//  Created by Abdullah Kardas on 28.06.2022.
//

import Foundation
import SwiftUI

struct TabBarPreferenceKey:PreferenceKey {
    
    static var defaultValue:[TabItem] = []
    
    static func reduce(value: inout [TabItem], nextValue: () -> [TabItem]) {
        value += nextValue()
    }
    
    
}

struct tabBarItemViewModifier:ViewModifier {
    
    let tab: TabItem
    @Binding var selectedTabTitle:String
    func body(content: Content) -> some View {
        content
            .opacity(
                selectedTabTitle == tab.title ? 1.0 : 0.0
            ).animation(.none, value: selectedTabTitle)
            .preference(key: TabBarPreferenceKey.self, value: [tab])
    }
}

extension View {
    func tabBarItem(tab:TabItem,selectedTabTitle:Binding<String>) -> some View {
        modifier(tabBarItemViewModifier(tab: tab, selectedTabTitle: selectedTabTitle))
    }
}
