//
//  TabView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/07.
//

import SwiftUI


struct TabBar: View {
    
    
    
    
    @StateObject var timerManager = TimerManager()
    @State var showingAlert = false
    @AppStorage("cigCount") var cigCount: Double?
    @AppStorage("cigPrice") var cigPrice: Double?
    @AppStorage("LOSE") var lose: Int = 0
    @AppStorage("Touch") var touch: Bool = false
    @AppStorage("collectedImages") var collectedImages: [String] = ["mainPicture"]
    @AppStorage("coinUse") var coinUse = 0
    
    
    var body: some View {
        TabView {
            TimerView(timerManager: timerManager, cigCount: $cigCount, cigPrice: $cigPrice, lose: $lose, touch: $touch, collectedImages: $collectedImages, coinUse: $coinUse)
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }
            
            SettingView(timerManager: timerManager, cigCount: $cigCount, cigPrice: $cigPrice, showingAlert: $showingAlert, touch: $touch, lose: $lose, collectedImages: $collectedImages)
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("설정/정보")
                }
        }.accentColor(Color.intColor)
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

