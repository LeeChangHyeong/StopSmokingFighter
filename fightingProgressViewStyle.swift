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
                HStack{
                    if value < total{
                        Text("💨")
                            .font(.system(size: 21))
                        //                        .scaleEffect(x: -1, y: 1, anchor: .center)
                            .frame(maxWidth: CGFloat(geometry.size.width / total * CGFloat(value)), alignment: .trailing)
                            .frame(height: 30)
                    }else{
                        Text("🥳")
                            .font(.system(size: 21))
                            .frame(maxWidth: CGFloat(geometry.size.width / total * CGFloat(value)), alignment: .trailing)
                            .frame(height: 30)
                    }
                    if value < total{
                        Spacer()
                        Text("🚬")
                            .font(.system(size: 23))
                            .frame(width: 24, height: 30, alignment: .bottomTrailing)
                    }
                }
                ProgressView(configuration)
                    .accentColor(.yellow)
                
                if (value/total)*100 > 100{
                    Text("성공 !!")

                    
                      
                }
                else if (value/total)*100 < 100{
                    Text("\((value/total)*100)%")
                       
                        
                }
                
            }
        }
    }
}
