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
    
    
    @Binding var touch: Bool
    
    @State var showingAlert2 = false
    
    
    @Binding var collectedImages: [String]
    var pictureName = TimerView.imageName.getImage()
    var pictureName2 = TimerView.imageName2.getImage()
    @AppStorage("pictureName3") var pictureName3 = "mainPicture"
    
    static var imageName = ImagePick()
    static var imageName2 = ImagePick2()
    var coin: Int {timerManager.secondsElapsed / 10}
    @Binding var coinUse:Int
    
    var body: some View {
        VStack {
            if touch && (coin > coinUse){
                HStack{
                    Text("내 코인 갯수: \(coin - coinUse)")
                    // 갱신 버튼
                    Button{
                        let pictureName4 = Int.random(in:1...15)
                        pictureName3 = "p" + String(pictureName4)
                        addImage()
                        coinUse = coinUse + 1
                        
                        
                    } label: {
                        Text("버튼")
                    }
                }
            }else if touch && coin == coinUse{
                Text("코인이 없어요")
            }
            else {
                Text("금연을 시작하여 코인을 모으세요 !!")
            }
            Text("Till now..")
                .scaledFont(size: 18)
                .padding(.bottom, 3)
                .foregroundColor(Color.tillColor)
            
            Text(String(format:"%02i시간 %02i분 %02i초", hours, minutes, seconds))
                .padding(.bottom, 6)
                .scaledFontBold(size: 26)
                .foregroundColor(Color.buttonColor)
            
            if touch == false{
                Image("mainPicture")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .background(.gray)
            } else {
                //                if timerManager.secondsElapsed < 90{
                Image(pictureName3)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .background(.gray)
                //                } else{
                //                    Image(pictureName2)
                //                        .resizable()
                //                        .scaledToFit()
                //                        .frame(width: 300, height: 300)
                //                        .background(.gray)
                //
                //                }
                
            }
            
            
            
            if touch == false {
                Button {
                    self.showingAlert2.toggle()
                } label: {
                    Text("금연 시작하기 !")
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
                        .lineLimit(1)
                    
                    //                        .foregroundColor(.black)
                    //                        .padding(.vertical, 20)
                    //                        .padding(.horizontal, 90)
                    //                        .background(.yellow)
                    //                        .cornerRadius(20)
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
                
            } else {
                
                Text(String(format:"D - %02i", days))
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
            
            
            
            VStack(alignment: .leading){
                HStack{
                    VStack{
                        Image(systemName: "dollarsign.circle.fill")
                            .padding(.bottom, 8)
                            .font(.system(size: 20))
                        
                        Text("\(String(format:"%.02lf",((totalPrice/10000))))만원")
                            .foregroundColor(Color.intColor)
                            .padding(.bottom, 5)
                            .scaledFont(size: 16)
                        
                        Text("절약한 돈")
                            .foregroundColor(.white)
                            .padding(.horizontal, 27)
                        //                            .background(.black)
                            .scaledFontBold(size: 15)
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .background(Color.infoBackColor)
                    .cornerRadius(20)
                    
                    
                    VStack{
                        Image(systemName: "lungs.fill")
                            .padding(.bottom, 8)
                            .font(.title3)
                        
                        Text("\(String(format:"%.01lf",((numCig))))개")
                            .foregroundColor(Color.intColor)
                            .padding(.bottom, 5)
                            .scaledFont(size: 16)
                        
                        
                        Text("아낀 담배")
                            .foregroundColor(.white)
                            .padding(.horizontal, 27)
                        //                            .background(.black)
                            .scaledFontBold(size: 15)
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .background(Color.infoBackColor)
                    .cornerRadius(20)
                    
                    
                    VStack{
                        Image(systemName: "heart.fill")
                        
                            .padding(.bottom, 8)
                            .font(.title2)
                        
                        Text("\(String(format:"%.01lf",((numCig*720/60/60))))시간")
                            .foregroundColor(Color.intColor)
                            .padding(.bottom, 5)
                            .scaledFont(size: 16)
                        
                        
                        Text("수명 연장")
                            .foregroundColor(.white)
                            .padding(.horizontal, 27)
                        //                            .background(.black)
                            .scaledFontBold(size: 15)
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .background(Color.infoBackColor)
                    .cornerRadius(20)
                    
                    
                    
                }
                .padding(.horizontal, 15)
                // 1개에 12분
                //720초
            }
            
            //            Text("금연이 사망 횟수: \(lose)회")
            //                .foregroundColor(.white)
            //                .padding()
            //                .background(.red)
            //                .cornerRadius(20)
            
            
            
            
        }.onAppear{
            
            // current를 쓰면 calander를 아무곳에서 씀
            if touch {
                if timerManager.secondsElapsed == 0 {
                    self.timerManager.start()
                }
//                getCoin()
                addImage()
                addImage2()
                
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
    }
    
//    func getCoin() {
//        coin = timerManager.secondsElapsed / 10
//    }
    func goToZero() {
        coin == 0
        coinUse = 0
    }
    
    private func addImage() {
        if !collectedImages.contains(pictureName3){
            collectedImages.append(pictureName3)
            
        }
    }
    private func addImage2() {
        if !collectedImages.contains(pictureName2){
            collectedImages.append(pictureName2)
            
        }
    }
    
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


class ImagePick{
    //    var imageNames: [String] = ["p6","p1","p2","p3","p4","p5"]
    var imageNames: [String] = ["p1","p2","p3","p4","p5","p6","p7","p8","p9","p10","p11","p12","p13","p14","p15"]
    var isEntered : Bool = false
    static var imageName : String = ""
    
    func getImage() -> String{
        if !isEntered{
            ImagePick.imageName = imageNames.randomElement() ?? ""
            isEntered.toggle()
        }
        return ImagePick.imageName
    }
}


class ImagePick2{
    var imageNames: [String] = ["p3","p4","p5"]
    var isEntered: Bool = false
    static var imageName : String = ""
    
    func getImage() -> String{
        if !isEntered{
            ImagePick2.imageName = imageNames.randomElement() ?? ""
            isEntered.toggle()
        }
        return ImagePick2.imageName
    }
}
