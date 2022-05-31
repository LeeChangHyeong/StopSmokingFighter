//
//  TabView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/07.
//

import SwiftUI
import Combine

struct TabBar: View {
    
    
    @Environment(\.dismiss) private var dismiss
    @State var isActive : Bool = false
    @State private var selection = 1
    @StateObject var timerManager = TimerManager()
    @State var showingAlert = false
    @AppStorage("cigCount") var cigCount: Double?
    @AppStorage("cigPrice") var cigPrice: Double?
    @AppStorage("LOSE") var lose: Int = 0
    @AppStorage("Touch") var touch: Bool = false
    @AppStorage("collectedImages") var collectedImages: [String] = ["mainPicture"]
    @AppStorage("coinUse") var coinUse = 0
    
    
    var body: some View {
        TabView(selection: $selection) {
            TimerView(timerManager: timerManager, cigCount: $cigCount, cigPrice: $cigPrice, lose: $lose, touch: $touch, collectedImages: $collectedImages, coinUse: $coinUse)
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                    
                }.tag(1)
            
            
            SettingView(isActive: $isActive, timerManager: timerManager, cigCount: $cigCount, cigPrice: $cigPrice, showingAlert: $showingAlert, touch: $touch, lose: $lose, collectedImages: $collectedImages)
                .tabItem {
                    
                    Image(systemName: "gearshape")
                    Text("설정/정보")
                }.tag(2)
                
        }.onTapGesture(count: 2) {
            isActive = false
        }
        .accentColor(Color.intColor)
        
            .onAppear{
                
                let appearance = UITabBarAppearance()
                appearance.backgroundColor = UIColor(Color("buttonColor"))
                
                UITabBar.appearance().standardAppearance = appearance
                UITabBar.appearance().scrollEdgeAppearance = appearance
                UITabBar.appearance().unselectedItemTintColor = UIColor(named: "gray")
                // 네비게이션 색 변경
                UINavigationBar.appearance().tintColor = .black
                
                
            }
        
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

