//
//  AppTabView.swift
//  CombineApp
//
//  Created by Abdullah Kardas on 27.06.2022.
//

import SwiftUI

struct AppTabView: View {
    @State var selectedTabTitle:String = TabItem.home.title
    @Environment(\.presentationMode) var presentationMode
    var type:BarTypes
   
    var body: some View {
       
        
        TabBarContainerView(selection: $selectedTabTitle,barType: type) {
            view1.tabBarItem(tab: .home, selectedTabTitle: $selectedTabTitle)
            Color.blue.ignoresSafeArea().tabBarItem(tab: .favorites, selectedTabTitle: $selectedTabTitle)
            Color.yellow.ignoresSafeArea().tabBarItem(tab: .settings, selectedTabTitle: $selectedTabTitle)
        }
    }
    
    var view1: some View {
        ZStack{
            Color.red.ignoresSafeArea()
            Button("back"){
                presentationMode.wrappedValue.dismiss()
            }.foregroundColor(.white)
        }
    }
    
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}

struct FirstView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color.red.ignoresSafeArea()
                List{
                    NavigationLink {
                        AppTabView(type: .bottomCircle)
                    } label: {
                        Text("bottomCircle").foregroundColor(.black)
                    }
                    
                    NavigationLink {
                        AppTabView(type: .underLine)
                    } label: {
                        Text("underLine").foregroundColor(.black)
                    }
                    
                    NavigationLink {
                        AppTabView(type: .capsule)
                    } label: {
                        Text("capsule").foregroundColor(.black)
                    }
                    
                    NavigationLink {
                        AppTabView(type: .overLine)
                    } label: {
                        Text("overLine").foregroundColor(.black)
                    }
                    
                    NavigationLink {
                        AppTabView(type: .standart)
                    } label: {
                        Text("standart").foregroundColor(.black)
                    }

                }
            }
        }
      
    }
}



