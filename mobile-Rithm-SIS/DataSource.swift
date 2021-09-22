//
//  DataSource.swift
//  mobile-Rithm-SIS
//
//  Created by Lance on 9/22/21.
//

import Foundation
import SwiftUI

//struct xLectureList: Codable, Identifiable {
//    let id = UUID()
//    var results: Array<LectureInstance>
//}
//
//struct xLectureInstance: Codable, Identifiable {
//    var id : Int
//    var title : String
//    var api_url : String
//}
//
//class DataSource: ObservableObject {
//    @Published var lectureSessions = [LectureInstance]()
//    @Published var lectures: [Lecture] = []
//    @Published var lectureLinks = [String]()
//    @Published var exerciseSessions = [ExerciseInstance]()
//    @Published var exerciseLinks = [String]()
//    @Published var exercises = [Exercise]()
//    @Published var eventSessions = [EventInstance]()
//    @Published var eventLinks = [String]()
//    @Published var events = [Event]()
//
//    func getLectures(completion: @escaping (LectureList) -> ()) {
//        guard let url = URL(string: "https://r22.students.rithmschool.com/api/lecturesessions/") else { return }
//
//        var request = URLRequest(url: url)
//
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("Token 5fb3d95a5a1980f112918e03be474e70da961175"
//                         , forHTTPHeaderField: "Authorization")
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            let lectureResponse = try! JSONDecoder().decode(LectureList.self, from: data!)
//
//            DispatchQueue.main.async {
//                completion(lectureResponse)
//            }
//        }
//        .resume()
//    }
//
//}

class LectureSessions: ObservableObject {
    @Published var lectureSessions: [LectureInstance] = []
}

class LectureLinks: ObservableObject {
    @Published var lectureLinks: [String] = []
}

class Lectures: ObservableObject {
    @Published var lectures: [Lecture] = []
}
