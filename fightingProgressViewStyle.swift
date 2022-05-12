////
////  fightingProgressViewStyle.swift
////  StopSmokingStandard
////
////  Created by 이창형 on 2022/05/07.
////
import SwiftUI

struct honeyBeeProgressViewStyle: ProgressViewStyle {
    @Binding var value: Double
    @Binding var total: Double
    
    func makeBody(configuration: Configuration) -> some View {
        return GeometryReader{ geometry in
            VStack(){
                ZStack{
                    
                    ProgressView(configuration)
                        .accentColor(Color.buttonColor)
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                    
                        
                        if value < total{
                            ZStack{
                                HStack{
                                    Spacer()
                                        Text("🚬")
                                            .font(.system(size: 30))
                                            .frame(height: CGFloat(geometry.size.height/2)).padding(.bottom)
                                    
                                        
                                    }
                                HStack{
                                    
                                    Text("💨")
                                        .animation(Animation.easeInOut(duration: 2)
                                                            .repeatForever(autoreverses: true))
                                        .font(.system(size: 20))
                                    //                        .scaleEffect(x: -1, y: 1, anchor: .center)
                                        .frame(maxWidth: CGFloat(geometry.size.width / total * CGFloat(value)+23), alignment: .bottomTrailing)
                                    Spacer()
                                }
                                   
                                        .frame(height: CGFloat(geometry.size.height/2))
                                
                        }
                        
                            
                            
                        }else{
                            Text("🥳")
                                .font(.system(size: 30))
                                .frame(maxWidth: CGFloat(geometry.size.width / total * CGFloat(value)), alignment: .bottomTrailing)
                                .frame(height: CGFloat(geometry.size.height/2))
                        }
                 
                }
                
              
                
            }
        }
    }
}
