//
//  dataModel.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/31.
//


struct SmokingImage: Codable,Hashable{
    let imageName:String
    let imageTitle:String
    let imageText:String
    
    enum CodingKeys: String, CodingKey{
        case imageName, imageTitle, imageText
    }
}

