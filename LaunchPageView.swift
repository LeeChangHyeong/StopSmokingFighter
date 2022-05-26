//
//  LaunchPageView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/08.
//

import SwiftUI

struct LaunchPageView: View {
    @State var textAnimation: Bool = false
    @State var textAnimation2: Bool = false
    @State var isActive: Bool = false
    
   
    var body: some View {
        if isActive {
            ContentView()
        }
        else{
            ZStack{
                Rectangle()
                    .foregroundColor(.buttonColor)
                    .scaledToFill()
                    .ignoresSafeArea()
                    
                Image("launchPageImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.isActive = true
                }
            }
            }
        }
    }
    
}





struct LaunchPageView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchPageView()
    }
}
