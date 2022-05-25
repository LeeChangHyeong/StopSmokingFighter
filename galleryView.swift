//
//  galleryView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/18.
//

import SwiftUI

struct galleryView: View {
    @Environment(\.dismiss) private var dismiss
    var pictures: [String] = ["mainPicture","p1","p2","p3","p4","p5","p6","p7","p8","p9","p10","p11","p12","p13","p14","p15"]
    @Binding var collectedImages: [String]
    
    let rows: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    //    @Binding var pictureName: String
    var body: some View {
        
        ScrollView(){
            Text("금연 1 ~ 35일차")
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.top)
                .padding(.leading)
                .padding(.bottom, 5)
            LazyVGrid(columns: rows, alignment: .center) {
                
                ForEach(pictures, id: \.self) { pictureName in
                    if collectedImages.contains(pictureName) {
                        NavigationLink{
                            imageView(image: pictureName)
                        } label: {
                            Image(pictureName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .overlay(Rectangle().foregroundColor(.gray).opacity(0.2))
                        }
                        
                    } else {
                        Image(pictureName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .blur(radius: 8)
                            .overlay(Rectangle().foregroundColor(.gray).opacity(0.2))
                        
                        
                    }
                }
                
            }
            Text("금연 36 ~ 70일차")
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.top, 30)
                .padding(.leading)
                .padding(.bottom, 5)
        }
        .navigationBarTitle(Text("갤러리"), displayMode: .inline)
        .onDisappear(perform: {
            dismiss()
        }).padding(.horizontal)
    }
    
}
