//
//  FontSemiBold.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/11.
//
import SwiftUI

struct Fail: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var timerManager: TimerManager
    @Binding var cigCount: Double?
    @Binding var cigPrice: Double?
    @Binding var showingAlert: Bool
    @Binding var touch: Bool
    @Binding var lose: Int
    @AppStorage("lastTime") var lastTime: Int?
    @State private var showPopOver = false
    
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                
                Text("최대 금연 시간")
                    .scaledFontBold(size: 17)
                
                Text("\((lastTime ?? 0) / (3600 * 24))일 \((lastTime ?? 0) / 3600 % 24)시간 \((lastTime ?? 0) / 60 % 60)분 \((lastTime ?? 0) % 60)초")
                    .scaledFont(size: 17)
                    .padding(.top, 1)
                    .padding(.bottom, 14)
                
                
                
                Text("금연 실패 횟수")
                    .padding(.top, 22)
                    .scaledFontBold(size: 17)
                
                Text("\(lose)")
                
                    .scaledFont(size: 17)
                    .padding(.top, 1)
                
                if touch {
                    Button{
                        self.showingAlert.toggle()
                    }
                label: {
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
                .alert("다시 한 번 생각해보세요. 금연을 포기하시겠습니까?", isPresented: $showingAlert) {
                    Button(role: .destructive) {
                        
                        
                    } label: {
                        Text("취소")
                    }
                    
                    Button(role: .cancel) {
                        if (lastTime ?? 0) < timerManager.secondsElapsed{
                            lastTime = timerManager.secondsElapsed
                        }
                        self.timerManager.stop()
                        touch = false
                        lose += 1
                        showPopOver = true
                        
                    } label: {
                        Text("포기하기")
                    }
                }
                    
                }
                
                
                
            }
            .navigationBarTitle(Text("금연 포기하기"), displayMode: .inline)
            .padding(.bottom, 100)
            .onDisappear(perform: {
                dismiss()
            })
            .position(x:geometry.size.width/2 , y: geometry.size.height/2 - 20)
            .popover(isPresented:$showPopOver) {
                VStack{
                    
                Image("p17")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width - 16, height: geometry.size.height - 300)
                    .padding(.top, 100)
              
                  
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
               
                Text("""
                     "여기까지냐 애송이"
                     """)
                    .font(.title)
                    .bold()
                    
                Text("다시 금연을 시작하여 금연이를 도와주세요!!")
                    .font(.body)
                    .padding(.top, 2)
                    Spacer()
                    
                }
                    
                
            }
            

            
        }
    }
}

