//
//  realDataModel.swift
//  StopSmokingStandard
//
//  Created by 이창형 on 2022/05/31.
//

import Foundation

class realDataModel: ObservableObject {
    @Published var pictures = [SmokingImage]()
    
    init(){
        pictures = loadJsonFile()
    }
    
    private func loadJsonFile() -> [SmokingImage]{
            var dbData = [SmokingImage]()
            
            do {
                if let filePath  = Bundle.main.url(forResource: "dBdata", withExtension: "json") {
                    
                    let jsonData = try Data(contentsOf: filePath)
                    let decodedData = try JSONDecoder().decode([SmokingImage].self, from: jsonData)
                    dbData = decodedData
                } else {
                    return [SmokingImage]()
                }
            } catch let error {
                print("[System] Error while fetching: \(error)")
            }
            return dbData
        }
    
}
