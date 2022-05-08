//
//  ContentView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/05.
//

import SwiftUI


struct ContentView: View {
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true
    
    var body: some View {
        
        
        TabBar()
            .fullScreenCover(isPresented: $isFirstLaunching) {
                            OnboardingTabView(isFirstLaunching: $isFirstLaunching)
                        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
