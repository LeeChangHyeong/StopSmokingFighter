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
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("설정"), footer: Text("")){
                    NavigationLink(destination: UserCheckView(cigCount: $cigCount, cigPrice: $cigPrice)){
                        Label("흡연량 설정",systemImage: "lungs.fill")
                        
                    }
                    NavigationLink(destination:
                                    Button{
                        self.showingAlert.toggle()
                    } label: {
                        Text("포기하기")
                            .foregroundColor(.white)
                            .frame(maxWidth:.infinity)
                            .padding(.vertical, 20)
                            .padding(.horizontal, 90)
                            .background(Color.buttonColor)
                            .cornerRadius(10)
                            .padding(.horizontal, 30)
                            .padding(.top, 20)
                            .padding(.bottom, 10)
                            .scaledFontBold(size: 18)
                    }
                        .alert("다시 한 번 생각해보세요", isPresented: $showingAlert) {
                            Button(role: .destructive) {
                                self.timerManager.stop()
                                touch = false
                                lose += 1
                                
                            } label: {
                                Text("금연이 죽이기")
                            }
                            
                            Button(role: .cancel) {
                                
                            } label: {
                                Text("금연이 살리기")
                            }
                        } ){
                            Label("금연 포기하기",systemImage: "xmark.circle.fill")
                            
                        }
                    
                    Label("알림 설정",systemImage: "bell")
                }.foregroundColor(.black)
                
                
                Section(header: Text("금연 도우미"), footer: Text("")){
                    NavigationLink(destination: TipPage()){
                        Label("금연 꿀팁",systemImage: "lightbulb")
                        
                    }
                    NavigationLink(destination: ReasonView(timerManager: timerManager)){
                        Label("금연 중 내 몸 변화",systemImage: "heart")
                    }
                    
                    Label("갤러리",systemImage: "magazine")
                }.foregroundColor(.black)
            }
        }
        
        
    }
   

}
