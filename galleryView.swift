//
//  galleryView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/18.
//

import SwiftUI




struct galleryView: View {
    @Binding var isActive1: Bool
    @Environment(\.dismiss) private var dismiss
    var pictures: [String] = ["mainPicture","p1","p2","p3","p4","p5","p6","p7","p8","p9","p10","p11","p12","p13","p14","p15","p16","p17","p18","p19","p20"]
    @Binding var collectedImages: [String]
    
    let rows: [GridItem] = [
        
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
//        GridItem(.flexible())
        
    ]
    
  
    
    //    @Binding var pictureName: String
    var body: some View {
        GeometryReader { geometry in
        ScrollView(){
          
                
            LazyVGrid(columns: rows) {
                
                ForEach(pictures, id: \.self) { pictureName in
                    if collectedImages.contains(pictureName) {
                        NavigationLink{
                            imageView(image: pictureName, isActive2: self.$isActive1)
                        } label: {
                            Image(pictureName)
                                .resizable()
                                .scaledToFit()
//                                .frame(width: 100, height: 100)
                                .overlay(Rectangle().foregroundColor(.gray).opacity(0.2))
                            
                        }
                        .isDetailLink(false)
                        
                    } else {
                        
                        Image(pictureName)
                            .resizable()
                            .scaledToFit()
//                            .frame(width: 100, height: 100)
                            .blur(radius: 8)
                            .overlay(Rectangle().foregroundColor(.gray).opacity(0.2))
                        
                        
                    }
                }
                
            }

            
        }
        .navigationBarTitle(Text("갤러리"), displayMode: .inline)
        .onDisappear(perform: {
            dismiss()
        }).padding(.horizontal)
        }
            
    }
    
}

