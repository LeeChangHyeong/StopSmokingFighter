//
//  OnboardingLastPageView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/08.
//

import SwiftUI

struct OnboardingLastPageView: View {
    let imageName: String
    let title: String
    let subtitle: String
    
    @Binding var isFirstLaunching: Bool
    
    var body: some View {
        
        
        GeometryReader{ geometry in
        VStack {
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: geometry.size.width - 100, height: geometry.size.height - 400 )
                .padding()
            
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.vertical,5)
                .frame(maxWidth:.infinity,alignment: .leading)
            Text(subtitle)
                .font(.body)
                .padding(.horizontal)
                .frame(maxWidth:.infinity,alignment: .leading)
            
            // 온보딩 완료 버튼.
            // AppStorage의 isFirstLaunching 값을 false로 바꾸기 때문에, 다음번에 앱을 실행할 때는 OnboardingTabView를 띄우지 않음.
            Button {
                isFirstLaunching.toggle()
            } label: {
                Text("시작하기")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color("buttonColor"))
                    .cornerRadius(6)
                    
                    
            }
            .padding()
        
        
        }
        .position(x:geometry.size.width/2 , y: geometry.size.height/2)

        }
    }
}
