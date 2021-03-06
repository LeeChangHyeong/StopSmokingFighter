//
//  imageView.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/23.
//







import SwiftUI



struct CardFront : View {
    let imageName: String
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack : View {
    let imageName: String
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            
            Image("180")
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            
            
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
        
    }
}

struct imageView: View {
    @State var backDegree = 90.0
    @State var frontDegree = 0.0
    @State var isFlipped = false
    
    let durationAndDelay : CGFloat = 0.3
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                //                backDegree = 90
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                //                frontDegree = 0
                backDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                //                frontDegree = -90
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                //                backDegree = 0
                frontDegree = 0
            }
        }
    }
    @Binding var isActive2:Bool
    var smoke: SmokingImage
    var body: some View {
        GeometryReader{ geometry in
            let width : CGFloat = geometry.size.width - 50
            let height : CGFloat = geometry.size.height - 300
            VStack{
                ZStack{
                    CardBack(imageName: smoke.imageName, width: width, height: height, degree: $backDegree)
                    CardFront(imageName: smoke.imageName, width: width, height: height, degree: $frontDegree)
                }
                Text("\(smoke.imageTitle)")
                    .font(.title)
                    .bold()
                    .padding(.vertical)
                Text("\(smoke.imageText)")
                    .font(.body)
            }
            .onTapGesture {
                flipCard ()
            }
            .position(x:geometry.size.width/2 , y: geometry.size.height/2 - 30)
        }
        
        
    }
}

//struct imageView_Previews: PreviewProvider {
//    static var previews: some View {
//        imageView()
//    }
//}
