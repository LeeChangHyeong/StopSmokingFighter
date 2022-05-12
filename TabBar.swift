//
//  TabView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/07.
//

import SwiftUI


struct TabBar: View {
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
        
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "gray")
        
        UITabBar.appearance().backgroundColor = UIColor(named: "buttonColor")
        
    }
    
    
    
    @StateObject var timerManager = TimerManager()
    @State var showingAlert = false
    @AppStorage("cigCount") var cigCount: Double?
    @AppStorage("cigPrice") var cigPrice: Double?
    @AppStorage("LOSE") var lose: Int = 0
    @AppStorage("Touch") var touch: Bool = false
    
    
    
    
    var body: some View {
        TabView {
            TimerView(timerManager: timerManager, cigCount: $cigCount, cigPrice: $cigPrice, lose: $lose, touch: $touch)
                .tabItem {
                    Image(systemName: "cross")
                    Text("홈")
                }
            
            SettingView(timerManager: timerManager, cigCount: $cigCount, cigPrice: $cigPrice, showingAlert: $showingAlert, touch: $touch, lose: $lose)
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("설정/정보")
                }
        }.accentColor(Color.intColor)
            .onAppear{
                let appearance = UITabBarAppearance()
                                appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                                appearance.backgroundColor = UIColor(Color("buttonColor"))
                                
                                UITabBar.appearance().standardAppearance = appearance
                                UITabBar.appearance().scrollEdgeAppearance = appearance
                
                
            }
        
    }
}

