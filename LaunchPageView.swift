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
            VStack{
                
                HStack{
                    Text("좋은인")
                        .font(.system(size: 33, weight: .light, design: .monospaced))
                        .animation(.easeInOut(duration: 3).delay(1))
                        .opacity(textAnimation ? 1 : 0)
                    
                        .foregroundColor(.pink)
                    Text("연")
                        .font(.system(size: 60, weight: .semibold, design: .monospaced))
                    
                    
                }
                .frame(maxWidth:200,alignment: .trailing)
                HStack{
                    Text("금")
                        .font(.system(size: 33, weight: .light, design: .monospaced))
                        .opacity(textAnimation2 ? 1 : 0)
                        .foregroundColor(.mint)
                    Text("연")
                        .font(.system(size: 60, weight: .semibold, design: .monospaced))
                }
                .frame(maxWidth:200, alignment: .trailing)
                .padding()
                
            }
            .onAppear {
                withAnimation(.spring(response:2)) {
                    textAnimation = true
                }
                
                withAnimation(.spring(response: 2).delay(1)){
                    textAnimation2 = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    self.isActive = true
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
