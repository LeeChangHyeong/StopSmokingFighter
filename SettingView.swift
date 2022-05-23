//
//  SettingView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/07.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var timerManager: TimerManager
    @Binding var cigCount: Double?
    @Binding var cigPrice: Double?
    @Binding var showingAlert: Bool
    @Binding var touch: Bool
    @Binding var lose: Int
    
    @Binding var collectedImages: [String]
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("설정"), footer: Text("")){
                    NavigationLink(destination: UserCheckView(cigCount: $cigCount, cigPrice: $cigPrice)){
                        Label("흡연량 설정",systemImage: "lungs.fill")
                        
                    }
                    NavigationLink(destination:Fail(timerManager: timerManager, cigCount: $cigCount, cigPrice: $cigPrice, showingAlert: $showingAlert, touch: $touch, lose: $lose)
                                   
                                    
                    )
                                   {
                            Label("금연 포기하기",systemImage: "xmark.circle.fill")
                            
                        }
                    
                    
                   
                    
                }.foregroundColor(.black)
                
                
                Section(header: Text("금연 도우미"), footer: Text("")){
                    NavigationLink(destination: TipPage()){
                        Label("금연 꿀팁",systemImage: "lightbulb")
                        
                    }
                    NavigationLink(destination: ReasonView(timerManager: timerManager)){
                        Label("금연 중 내 몸 변화",systemImage: "heart")
                    }
                    
                    NavigationLink(destination: galleryView(collectedImages: $collectedImages)){
                    Label("갤러리",systemImage: "magazine")
                    }
                }.foregroundColor(.black)
            }
        }.navigationViewStyle(.stack)
        
        
    }
   

}
