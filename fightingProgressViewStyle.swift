////
////  fightingProgressViewStyle.swift
////  StopSmokingStandard
////
////  Created by 이창형 on 2022/05/07.
////
//
//import SwiftUI
//
//struct fightingProgressViewStyle: View {
//    @State private var amount = 0
//    @ObservedObject var timerManager = TimerManager()
//    
//    var body: some View{
//      
//    }
//   
//}
//
//
//struct fightingProgressViewStyle_Previews: PreviewProvider {
//    static var previews: some View {
//        fightingProgressViewStyle()
//    }
//}
import SwiftUI

struct honeyBeeProgressViewStyle: ProgressViewStyle {
    @Binding var value: Double
    @Binding var total: Double
    
    func makeBody(configuration: Configuration) -> some View {
        return GeometryReader{ geometry in
            VStack(){
                ZStack{
                    
                    ProgressView(configuration)
                        .accentColor(.yellow)
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                    
                    
                    //HStack{
                        
                        if value < total{
                            ZStack{
                                HStack{
                                    Spacer()
                                        Text("🚬")
                                            .font(.system(size: 30))
                                            .frame(height: CGFloat(geometry.size.height) - 40).padding(.bottom)
                                        
                                    }
                                HStack{
                                    
                                    Text("💨")
                                        .font(.system(size: 30))
                                    //                        .scaleEffect(x: -1, y: 1, anchor: .center)
                                        .frame(maxWidth: CGFloat(geometry.size.width / total * CGFloat(value)+23), alignment: .bottomTrailing)
                                    Spacer()
                                }
                                    //                                .frame(height: 30)
                                        .frame(height: CGFloat(geometry.size.height - 40))
                                
                        }
                        
                            
                            
                        }else{
                            Text("🥳")
                                .font(.system(size: 30))
                                .frame(maxWidth: CGFloat(geometry.size.width / total * CGFloat(value)), alignment: .bottomTrailing)
                                .frame(height: CGFloat(geometry.size.height - 40))
                        }
                    //}
                    
                }
                
                //                if (value/total)*100 > 100{
                //                    Text("성공 !!")
                //
                //
                //                }
                //                else if (value/total)*100 < 100{
                //                    Text("\((value/total)*100)%")
                //                        .frame(maxWidth:.infinity , alignment: .topLeading)
                //
                //
                //                }
                
                
            }
        }
    }
}
