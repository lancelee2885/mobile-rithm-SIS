//
//  LectureInstanceData.swift
//  mobile-Rithm-SIS
//
//  Created by Alex  Rutan on 9/22/21.
//

import SwiftUI

struct Lecture: Codable, Identifiable {

    let id = UUID()
    var title: String
    var description: String
    var staff: [String]
    var start_at: String
    var end_at: String
    var asset_set: [String]

}

class UpcomingLecturesApi {
    func getLecture(lectureURL: String, completion: @escaping (Lecture) -> ()) {

        
        let url = URL(string: "https" + lectureURL.dropFirst(4))!
        
        var request = URLRequest(url: url)

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Token 5fb3d95a5a1980f112918e03be474e70da961175"
                         , forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            let lecture = try! JSONDecoder().decode(Lecture.self, from: data!)

            DispatchQueue.main.async {
                completion(lecture)
            }
        }
        .resume()
    }
}
