//
//  TabItem.swift
//  CombineApp
//
//  Created by Abdullah Kardas on 28.06.2022.
//

import Foundation
import SwiftUI

enum TabItem : Identifiable,Equatable {
 
    case home,favorites,settings
    
    
    var title:String {
        switch self {
        case .home: return "Home"
        case .favorites: return "Favorites"
        case .settings: return "Settings"
        }
    }
    var imageName:String {
        switch self {
        case .home: return "house"
        case .favorites: return "heart"
        case .settings: return "person"
        }
    }
    
    var color:Color {
        switch self {
        case .home: return Color.red
        case .favorites: return Color.blue
        case .settings: return Color.green
        }
    }
    
    var id:UUID {
        switch self {
        case .home: return UUID()
        case .favorites: return UUID()
        case .settings: return UUID()
        }
    }
}
