# SwiftUI-Custom-Tab-Bars


https://user-images.githubusercontent.com/28716129/176546788-3809568f-9b2e-4f9b-8758-1cf6bc212745.mov

# Usage
Add CustomTabBar files into your project and call it like

    struct AppTabView: View {
    @State var selectedTabTitle:String = TabItem.home.title
    var type:BarTypes = .bottomCircle
   
    var body: some View {
       
        
        TabBarContainerView(selection: $selectedTabTitle,barType: type) {
            yourview1().tabBarItem(tab: .home, selectedTabTitle: $selectedTabTitle)
            yourview2().tabBarItem(tab: .favorites, selectedTabTitle: $selectedTabTitle)
            yourview3().tabBarItem(tab: .settings, selectedTabTitle: $selectedTabTitle)
        }
    }
    
    
     }
     
You can custumize tabItems title, image name and color
