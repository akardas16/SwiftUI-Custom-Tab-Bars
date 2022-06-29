//
//  TabBarContainerView.swift
//  CombineApp
//
//  Created by Abdullah Kardas on 27.06.2022.
//

import SwiftUI


struct TabBarContainerView<Content:View> : View {
    
    @Binding var selectedTabTitle:String
    @State var tabs:[TabItem] = []
    let barType:BarTypes
    let content:Content
    init(selection: Binding<String>?,barType:BarTypes = .overLine ,@ViewBuilder content: () -> Content) {
        self._selectedTabTitle = selection!
        self.barType = barType
        self.content = content()
    }
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                content
            }
            CustomTabBarView(tabs: tabs, barType: barType, selectedTabTitle: $selectedTabTitle)
           
        }.onPreferenceChange(TabBarPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct TabBarContainerView_Previews: PreviewProvider {
    static var tabs:[TabItem] = [.home,.favorites,.settings]
    static var previews: some View {
        TabBarContainerView(selection: .constant("Home")) {
            Color.red
        }
   
    }
}

enum BarTypes{
    case underLine,overLine,capsule,standart,bottomCircle
}
