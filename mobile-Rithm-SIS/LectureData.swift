//
//  LectureData.swift
//  mobile-Rithm-SIS
//
//  Created by Alex  Rutan on 9/22/21.
//

import SwiftUI

struct LectureList: Codable, Identifiable {
    let id = UUID()
    var results: Array<LectureInstance>
}

struct LectureInstance: Codable, Identifiable {
    var id : Int
    var title : String
    var api_url : String
}

class LectureApi {
//    @Published var lectureResponse: LectureList?
//    @Published var lectureSessions = [LectureInstance]()

    func getLectures(completion: @escaping (LectureList) -> ()) {
        guard let url = URL(string: "https://r22.students.rithmschool.com/api/lecturesessions/") else { return }
        
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Token 5fb3d95a5a1980f112918e03be474e70da961175"
                         , forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            let lectureResponse = try! JSONDecoder().decode(LectureList.self, from: data!)

            DispatchQueue.main.async {
                completion(lectureResponse)
            }
        }
        .resume()
    }
}
