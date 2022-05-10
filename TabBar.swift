//
//  TabView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/07.
//

import SwiftUI

struct TabBar: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.yellow
  }
    
    
    
    @StateObject var timerManager = TimerManager()
    
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
            
            SettingView(timerManager: timerManager, cigCount: $cigCount, cigPrice: $cigPrice)
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("설정/정보")
                        
                }
        }
           
    }
}
