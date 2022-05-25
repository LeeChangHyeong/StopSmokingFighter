//
//  OnboardingPageView2.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/23.
//

//
//  OnboardingPageView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/08.
//

import SwiftUI

struct OnboardingPageView2: View {
    let imageName: String
    let title: String
    let subtitle: String
    
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
            

        } .position(x:geometry.size.width/2 , y: geometry.size.height/2)
        }
        
    }
}

