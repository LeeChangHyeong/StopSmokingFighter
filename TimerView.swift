//
//  Timer.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/05.
//
import Foundation
import SwiftUI
import UIKit

extension Color {
    static let buttonColor = Color("buttonColor")
    static let infoBackColor = Color("infoBackColor")
    static let intColor = Color("intColor")
    static let tillColor = Color("tillColor")
    static let circleColor = Color("circleColor")
}


struct TimerView: View {
    // 변경값을 관찰하기 위해 ObservaleObject 추가
    
    
    
    @ObservedObject var timerManager: TimerManager
    var days: Int { timerManager.secondsElapsed / (3600 * 24)}
    var hours: Int { timerManager.secondsElapsed / 3600 % 24 }
    var minutes: Int { timerManager.secondsElapsed / 60 % 60 }
    var seconds: Int { timerManager.secondsElapsed % 60 }
    var totalPrice: Double { (((cigPrice ?? 0) / 20) * (cigCount ?? 0))/86400 * Double((timerManager.secondsElapsed))}
    var numCig: Double {(cigCount ?? 0)/86400 * Double((timerManager.secondsElapsed))}
    @Binding var cigCount: Double?
    @Binding var cigPrice: Double?
    @Binding var lose: Int
    
    @AppStorage("savedDate") var date: Date = Date()
    //    var coinHours: Double
    //    var coinMinutes: Double
    //    var coinSeconds: Double
    @Binding var touch: Bool
    @State var showingAlert2 = false
    @Binding var collectedImages: [String]
//    var pictureName = TimerView.imageName.getImage()
//    var pictureName2 = TimerView.imageName2.getImage()
    @AppStorage("pictureName3") var pictureName3 = "mainPicture"
    
//    static var imageName = ImagePick()
//    static var imageName2 = ImagePick2()
    var coin: Int { timerManager.secondsElapsed / 36000 }
    // 18000
    @Binding var coinUse:Int
    
    @State var coinTimeRemainder: Double = 0
    @AppStorage("coinTime") var coinTime: Double = 0
    @State var coinTotal: Double = 36000
    
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false

    
    let durationAndDelay : CGFloat = 0.3
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
    
    
    //    coinTimeRemainder = coinTime.truncatingRemainder(dividingBy: 10)
    var body: some View {
        GeometryReader { geometry in
//            let width : CGFloat = geometry.size.width - 50
//            let height : CGFloat = geometry.size.height - 380
            VStack {
                Text(String(format:"금연한지 %02i일", days))
                    .frame(maxWidth:.infinity)
                    .scaledFontBold(size: 20)
                    .foregroundColor(.buttonColor)
                    .opacity(0.4)
                
                if coin - coinUse > 0{
                Text(String(format:"%02i시간 %02i분 %02i초", hours, minutes, seconds))
                    .scaledFontBold(size: 22)
                    .foregroundColor(Color.buttonColor)
                    .padding(.top, 0.1)
                    .padding(.bottom, 15)
                } else {
                    Text(String(format:"%02i시간 %02i분 %02i초", hours, minutes, seconds))
                        .scaledFontBold(size: 22)
                        .foregroundColor(Color.buttonColor)
                        .padding(.top, 0.1)
                        .padding(.bottom, 30)
                }
                
             
                
                if touch == false{
                    ZStack{
                    Image("mainPicture")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width - 50, height: geometry.size.height - 380)
                        .blur(radius: 8)
                        Button {
                            self.showingAlert2.toggle()
                        } label: {
                            Text("금연 시작하기 !")
                                .foregroundColor(.white)
                                .padding(.vertical, 20)
                                .padding(.horizontal, 60)
                                .background(Color.buttonColor)
                                .cornerRadius(10)
                                .scaledFontBold(size: 18)
                                .lineLimit(1)
                        }
                        .alert("금연을 시작하시겠습니까?", isPresented: $showingAlert2){
                            // 주요행동
                            Button(role: .destructive) {
                                
                            } label: {
                                Text("취소")
                                
                            }
                            
                            Button(role: .cancel){
                                self.timerManager.start()
                                touch = true
                                date = Date()
                                addImage()
                                //                        addImage2()
                            } label: {
                                Text("시작하기")
                            }
                        }
                    }
                        
                    
                } else {
//                    ZStack{
//                        CardFront(imageName: pictureName3, width: width, height: height, degree: $frontDegree)
//                        CardBack(width: width, height: height, degree: $backDegree)
//                    }
//                    .onTapGesture {
//                        flipCard ()
//                    }
                    //                if timerManager.secondsElapsed < 90{
                    Image(pictureName3)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width - 50, height: geometry.size.height - 380)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                        
                        
                        
                        
                       
                    //                } else{
                    //                    Image(pictureName2)
                    //                        .resizable()
                    //                        .scaledToFit()
                    //                        .frame(width: 300, height: 300)
                    //                        .background(.gray)
                    //
                    //                }
                    
                }
                ProgressView(value: coinTimeRemainder, total: coinTotal)
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .padding(.horizontal,22)
                    .padding(.top, 20)
                    .onAppear{
                        
                        coinTime = Double(timerManager.secondsElapsed)
                        coinTime = coinTime.truncatingRemainder(dividingBy: 36000)
                        coinTimeRemainder = coinTime
                    }
                    .onChange(of: timerManager.secondsElapsed) { _ in
                        coinTimeRemainder = coinTimeRemainder + 1
                        if coinTimeRemainder >= coinTotal {
                            coinTime = Double(timerManager.secondsElapsed)
                            coinTime = coinTime.truncatingRemainder(dividingBy: 36000)
                            coinTimeRemainder = coinTime
                            
                        }
                    }
                
                HStack{
                    Text("\(String(format:"%.02lf",((coinTimeRemainder/coinTotal)*100))) / 100%(10시간 = 1코인)")
                        .scaledFont(size: 15)
                        .frame(maxWidth:.infinity, alignment:.leading)
                        .padding(.horizontal, 22)
                        .foregroundColor(.gray)
                    Spacer()
                    if 0 >= (coin - coinUse) {
                    Text("코인 갯수: 0")
                        .padding(.horizontal, 22)
                        .scaledFont(size: 15)
                        .foregroundColor(.gray)
                    }else{
                        Text("코인 갯수: \(coin - coinUse)")
                            .padding(.horizontal, 22)
                            .scaledFont(size: 15)
                            .foregroundColor(.gray)
                    }
                }
                
                if touch && (coin > coinUse){
                    
                    
                        // 갱신 버튼
                        Button{
                            let pictureName4 = Int.random(in:1...20)
                            pictureName3 = "p" + String(pictureName4)
                            addImage()
                            coinUse = coinUse + 1
                            
                            
                        } label: {
                            Text("코인 사용")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.buttonColor)
                                .cornerRadius(16)
                                .scaledFontBold(size: 15)
                        }
                    
                }
                
                
                
                if coin - coinUse == 0 {
                VStack{
                    HStack{
                        Spacer()
                        VStack{
                            Image(systemName: "dollarsign.circle.fill")
                                .font(.system(size: 30))
                                .padding(.bottom, 5)
                            
                            Text("\(String(format:"%.01lf",((totalPrice/10000))))만원")
                                .foregroundColor(Color.buttonColor)
                                .scaledFont(size: 16)
                                .padding(.bottom, 0.1)
                                
                            
                            Text("절약한 돈")
                                .foregroundColor(.infoBackColor)
                                .opacity(0.5)
                                
                               
                            //                            .background(.black)
                                .scaledFontBold(size: 15)
                            
                        }
                        
                        Spacer()
                        VStack{
                            Image(systemName: "lungs.fill")
                                .font(.system(size: 25))
                                .padding(.bottom, 5)
                            
                            Text("\(String(format:"%.01lf",((numCig))))개")
                                .foregroundColor(Color.buttonColor)
                                .scaledFont(size: 16)
                                .padding(.bottom, 0.1)
                            
                            
                            Text("아낀 담배")
                                .foregroundColor(.infoBackColor)
                            //                            .background(.black)
                                .scaledFontBold(size: 15)
                                .opacity(0.5)
                        }
                        
                        Spacer()
                        
                        VStack{
                            Image(systemName: "heart.fill")
                                .font(.system(size: 28))
                                .padding(.bottom, 5)
                            
                            Text("\(String(format:"%.01lf",((numCig*720/60/60))))시간")
                                .foregroundColor(Color.buttonColor)
                                .scaledFont(size: 16)
                                .padding(.bottom, 0.1)
                            
                            
                            Text("수명 연장")
                                .foregroundColor(.infoBackColor)
                            //                            .background(.black)
                                .scaledFontBold(size: 15)
                                .opacity(0.5)
                        }
                        
                        Spacer()
                        
                        
                    }
                    .padding(.top, 10)
                    
                    // 1개에 12분
                    //720초
                }.padding(.top, 23)
                } else {
                    VStack{
                        HStack{
                            Spacer()
                            VStack{
                                Image(systemName: "dollarsign.circle.fill")
                                    .font(.system(size: 30))
                                    .padding(.bottom, 5)
                                
                                Text("\(String(format:"%.01lf",((totalPrice/10000))))만원")
                                    .foregroundColor(Color.buttonColor)
                                    .scaledFont(size: 16)
                                    .padding(.bottom, 0.1)
                                    
                                
                                Text("절약한 돈")
                                    .foregroundColor(.infoBackColor)
                                    .opacity(0.5)
                                    
                                   
                                //                            .background(.black)
                                    .scaledFontBold(size: 15)
                                
                            }
                            
                            Spacer()
                            VStack{
                                Image(systemName: "lungs.fill")
                                    .font(.system(size: 25))
                                    .padding(.bottom, 5)
                                
                                Text("\(String(format:"%.01lf",((numCig))))개")
                                    .foregroundColor(Color.buttonColor)
                                    .scaledFont(size: 16)
                                    .padding(.bottom, 0.1)
                                
                                
                                Text("아낀 담배")
                                    .foregroundColor(.infoBackColor)
                                //                            .background(.black)
                                    .scaledFontBold(size: 15)
                                    .opacity(0.5)
                            }
                            
                            Spacer()
                            
                            VStack{
                                Image(systemName: "heart.fill")
                                    .font(.system(size: 28))
                                    .padding(.bottom, 5)
                                
                                Text("\(String(format:"%.01lf",((numCig*720/60/60))))시간")
                                    .foregroundColor(Color.buttonColor)
                                    .scaledFont(size: 16)
                                    .padding(.bottom, 0.1)
                                
                                
                                Text("수명 연장")
                                    .foregroundColor(.infoBackColor)
                                //                            .background(.black)
                                    .scaledFontBold(size: 15)
                                    .opacity(0.5)
                            }
                            
                            Spacer()
                            
                            
                        }
                        .padding(.top, 10)
                        
                        // 1개에 12분
                        //720초
                    }.padding(.top, 10)
                }
                
                //            Text("금연이 사망 횟수: \(lose)회")
                //                .foregroundColor(.white)
                //                .padding()
                //                .background(.red)
                //                .cornerRadius(20)
                
                
                
                
            }
            .onAppear{
                // current를 쓰면 calander를 아무곳에서 씀
                if touch {
                    if timerManager.secondsElapsed == 0 {
                        self.timerManager.start()
                    }
                    //                getCoin()
                    addImage()
//                    addImage2()
                    let calender = Calendar.current
                    let pastDate = date
                    let nowDate = Date()
                    // 옵셔널이 되는 경우때문에 0을 기본값으로 둔다.
                    let duration = calender.dateComponents([.second], from: pastDate, to: nowDate).second ?? 0
                    
                    timerManager.secondsElapsed = duration
                    
                } else {
                    goToZero()
                }
            }
            .position(x:geometry.size.width/2 , y: geometry.size.height/2 - 10)
        }
    }
    
    
    
    
    func goToZero() {
        coin == 0
        coinUse = 0
    }
    
    private func addImage() {
        if !collectedImages.contains(pictureName3){
            collectedImages.append(pictureName3)
            
        }
    }
//    private func addImage2() {
//        if !collectedImages.contains(pictureName2){
//            collectedImages.append(pictureName2)
//
//        }
//    }
//
}


extension Date: RawRepresentable {
    private static let formatter = ISO8601DateFormatter()
    
    public var rawValue: String {
        Date.formatter.string(from: self)
    }
    
    public init?(rawValue: String) {
        self = Date.formatter.date(from: rawValue) ?? Date()
    }
}


//class ImagePick{
//    //    var imageNames: [String] = ["p6","p1","p2","p3","p4","p5"]
//    var imageNames: [String] = ["p1","p2","p3","p4","p5","p6","p7","p8","p9","p10","p11","p12","p13","p14","p15"]
//    var isEntered : Bool = false
//    static var imageName : String = ""
//
//    func getImage() -> String{
//        if !isEntered{
//            ImagePick.imageName = imageNames.randomElement() ?? ""
//            isEntered.toggle()
//        }
//        return ImagePick.imageName
//    }
//}
//
//
//class ImagePick2{
//    var imageNames: [String] = ["p3","p4","p5"]
//    var isEntered: Bool = false
//    static var imageName : String = ""
//
//    func getImage() -> String{
//        if !isEntered{
//            ImagePick2.imageName = imageNames.randomElement() ?? ""
//            isEntered.toggle()
//        }
//        return ImagePick2.imageName
//    }
//}
