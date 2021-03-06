//
//  UserCheckView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/05.
//

import SwiftUI


#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct UserCheckView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var cigCount: Double?
    @Binding var cigPrice: Double?
    @State private var touch = false
    
    
    
    var body: some View {
        VStack{
            Text("하루 흡연 개비")
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.horizontal)
               
            
            TextField("하루에 피는 담배 갯수를 입력하세요.", value: $cigCount, format:.number)
                .keyboardType(.numberPad)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.buttonColor, lineWidth: 1))
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            
            
            Text("피우는 담배 가격(원)")
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 10)
            
            TextField("피우는 담배 한 갑의 가격을 입력하세요.", value: $cigPrice, format:.number)
                .keyboardType(.numberPad)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.buttonColor, lineWidth: 1))
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.horizontal)
            
            
            
            Button("확인"){
                
                self.presentationMode.wrappedValue.dismiss()
            }
            .foregroundColor(.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(Color("buttonColor"))
            .cornerRadius(20)
            .padding(.top, 30)
            
        }
        .onDisappear(perform: {
            dismiss()
        })
        .onTapGesture {
            hideKeyboard()
        }.navigationBarTitle(Text("흡연량 설정"), displayMode: .inline)
        
        
        
    }
    
}

