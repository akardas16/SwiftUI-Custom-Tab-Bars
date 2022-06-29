//
//  CustomTabBarView.swift
//  CombineApp
//
//  Created by Abdullah Kardas on 27.06.2022.
//

import SwiftUI

struct CustomTabBarView: View {
    
     var tabs:[TabItem]
    var barType:BarTypes
    @Binding var selectedTabTitle:String
    @Namespace private var namespace
    
    var body: some View {
        TabBarStyles.navigationBarBackButtonHidden().navigationBarHidden(true)
    }
    
}

struct CustomTabBarView_Previews: PreviewProvider {
    
    static var tabs:[TabItem] = [.home,.favorites,.settings]
    static var previews: some View {
        
        VStack {
            Spacer()
            CustomTabBarView(tabs: tabs, barType: .overLine, selectedTabTitle: .constant("Favorites"))
        
        }
    }
}


extension CustomTabBarView {
    private var TabBarStyles: some View {
       
        HStack{
            ForEach(tabs) { tab in
                switch barType {
                case .overLine:
                    tabBarOverLine(tab: tab).onTapGesture {
                        switchToTab(tab: tab)
                    }
                case .underLine:
                    tabBarUnderLine(tab: tab).onTapGesture {
                        switchToTab(tab: tab)
                    }
                case .capsule:
                    tabBarCapsule(tab: tab).onTapGesture {
                        switchToTab(tab: tab)
                    }
                case .standart:
                    defaultTabBar(tab: tab).onTapGesture {
                        switchToTab(tab: tab)
                    }
                case .bottomCircle:
                    tabBarBottomCircle(tab: tab).onTapGesture {
                        switchToTab(tab: tab)
                    }
                }
                
            }
        }.padding(8).background(
            Color.gray.opacity(0.2)
                //.cornerRadius(radius: 12, corners: [.topLeft,.topRight])
                .ignoresSafeArea(edges: .bottom)
        )
    }
    //STYLES
    func defaultTabBar(tab:TabItem) -> some View{
        VStack{
            Image(systemName: tab.imageName).font(.subheadline)
            Text(tab.title).font(.system(size: 10, weight: .semibold, design: .rounded))
        }.foregroundColor(selectedTabTitle.elementsEqual(tab.title) ? tab.color : Color.gray)
            .padding(.vertical,8)
            .frame(maxWidth: .infinity)
            .background(selectedTabTitle.elementsEqual(tab.title) ? tab.color.opacity(0.2) : Color.clear).cornerRadius(12)
    }
    

    private func switchToTab(tab:TabItem){
        withAnimation(.easeOut) {
            selectedTabTitle = tab.title
        }
    }
    
    func tabBarCapsule(tab:TabItem) -> some View{
        VStack{
            Image(systemName: tab.imageName).font(.subheadline)
            Text(tab.title).font(.system(size: 10, weight: .semibold, design: .rounded))
        }.foregroundColor(selectedTabTitle.elementsEqual(tab.title) ? tab.color : Color.gray)
            .padding(.vertical,8)
            .frame(maxWidth: .infinity)
            .background(
                ZStack{
                    if selectedTabTitle.elementsEqual(tab.title) {
                        Capsule(style: .continuous).fill(tab.color.opacity(0.2)).matchedGeometryEffect(id: "background_capsule", in: namespace)
                    }
                }
            )
    }
    
   
    
    func tabBarOverLine(tab:TabItem) -> some View{
        VStack{
        
            if selectedTabTitle.elementsEqual(tab.title) {
                Capsule(style: .continuous).fill(tab.color).frame(height: 4).frame(maxWidth: .infinity)
                    //.opacity(selectedTabTitle.elementsEqual(tab.title) ? 1 : 0)
                    .padding(.horizontal,24).padding(.bottom,12).matchedGeometryEffect(id: "background_capsule", in: namespace)
            }else {
                Capsule(style: .continuous).fill(Color.clear).frame(height: 4).frame(maxWidth: .infinity)
                    //.opacity(selectedTabTitle.elementsEqual(tab.title) ? 1 : 0)
                    .padding(.horizontal,24).padding(.bottom,12)
            }
            
            Image(systemName: selectedTabTitle.elementsEqual(tab.title) ? "\(tab.imageName).fill" : tab.imageName).font(.subheadline)
            Text(tab.title).font(.system(size: 12, weight: .semibold, design: .rounded))
        }.foregroundColor(selectedTabTitle.elementsEqual(tab.title) ? tab.color : Color.gray)
            .padding(.vertical,8)
            .frame(maxWidth: .infinity)

    }
    func tabBarUnderLine(tab:TabItem) -> some View{
        VStack{
        
            
            Image(systemName: selectedTabTitle.elementsEqual(tab.title) ? "\(tab.imageName).fill" : tab.imageName).font(.subheadline)
            Text(tab.title).font(.system(size: 12, weight: .semibold, design: .rounded))
            
            if selectedTabTitle.elementsEqual(tab.title) {
                Capsule(style: .continuous).fill(tab.color).frame(height: 4).frame(maxWidth: .infinity)
                    //.opacity(selectedTabTitle.elementsEqual(tab.title) ? 1 : 0)
                    .padding(.horizontal,24).padding(.top,8).matchedGeometryEffect(id: "background_capsule", in: namespace)
            }else {
                Capsule(style: .continuous).fill(Color.clear).frame(height: 4).frame(maxWidth: .infinity)
                    //.opacity(selectedTabTitle.elementsEqual(tab.title) ? 1 : 0)
                    .padding(.horizontal,24).padding(.bottom,8)
            }
        }.foregroundColor(selectedTabTitle.elementsEqual(tab.title) ? tab.color : Color.gray)
            .padding(.vertical,8)
            .frame(maxWidth: .infinity)

    }
    
    func tabBarBottomCircle(tab:TabItem) -> some View{
        VStack{
        
            
            Image(systemName: selectedTabTitle.elementsEqual(tab.title) ? "\(tab.imageName).fill" : tab.imageName).font(.subheadline)
            Text(tab.title).font(.system(size: 12, weight: .semibold, design: .rounded))
            
            if selectedTabTitle.elementsEqual(tab.title) {
                Circle().fill(tab.color)
                    .frame(width: 6, height: 6)
                   .matchedGeometryEffect(id: "background_capsule", in: namespace)
            }else {
                Circle().fill(Color.clear)
                    .frame(width: 6, height: 6)
                    
            }
        }.foregroundColor(selectedTabTitle.elementsEqual(tab.title) ? tab.color : Color.gray)
            .padding(.vertical,8)
            .frame(maxWidth: .infinity)

    }
    
}


struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

//step 2 - embed shape in viewModifier to help use with ease

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
