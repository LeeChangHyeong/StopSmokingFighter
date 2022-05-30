//
//  SettingView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/07.
//

import SwiftUI

struct SettingView: View {
    @State var isActive : Bool = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var timerManager: TimerManager
    @Binding var cigCount: Double?
    @Binding var cigPrice: Double?
    @Binding var showingAlert: Bool
    @Binding var touch: Bool
    @Binding var lose: Int
    
    @Binding var collectedImages: [String]
    
    @State var showAppDescription: Bool = true
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("설정")){
                    NavigationLink(destination: UserCheckView(cigCount: $cigCount, cigPrice: $cigPrice)){
                        Label("흡연량 설정",systemImage: "lungs")
                    }
                    NavigationLink(destination:Fail(timerManager: timerManager, cigCount: $cigCount, cigPrice: $cigPrice, showingAlert: $showingAlert, touch: $touch, lose: $lose)
                                   
                    )
                    {
                        Label("금연 포기하기",systemImage: "xmark.circle")
                        
                    }
                }.foregroundColor(.black)
                    
                    
                    
                    
                    
             
                
                Section(header: Text("금연 도우미")){
                    NavigationLink(destination: TipPage()){
                        Label("금연 꿀팁",systemImage: "lightbulb")
                        
                    }
                    NavigationLink(destination: ReasonView(timerManager: timerManager)){
                        Label("금연 중 내 몸 변화",systemImage: "heart")
                    }
                    
                    NavigationLink(destination: galleryView(isActive1: self.$isActive, collectedImages: $collectedImages), isActive: self.$isActive
                    ){
                        Label("갤러리",systemImage: "magazine")
                    }
                    .isDetailLink(false)
                    
                    
                    NavigationLink(destination: OnboardingTabView(isFirstLaunching: $showAppDescription, isLaunchingPage: false)){
                        Label("앱 설명", systemImage: "doc.plaintext")
                    }
                    .onDisappear {
                        showAppDescription.toggle()
                    }
                    
                }.foregroundColor(.black)
            }
            .navigationBarHidden(true)
            
            
         
                           
        }
        .navigationViewStyle(.stack)
           
        

            
          
        
        
        
    }
    
    
}
