//
//  LectureInstanceData.swift
//  mobile-Rithm-SIS
//
//  Created by Alex  Rutan on 9/22/21.
//

import SwiftUI

struct Exercise: Codable, Identifiable {

    let id = UUID()
    var title: String
    var description: String
    var exerciselabsession_set: [ExerciseLabSession]
    var asset_set: [String]

}

struct ExerciseLabSession: Codable, Identifiable {
    
    let id = UUID()
    var start_at: String
    var end_at: String
    var staff: [String]
    
}

class UpcomingExercisesApi {
    func getExercise(exerciseURL: String, completion: @escaping (Exercise) -> ()) {

        
        let url = URL(string: "https" + exerciseURL.dropFirst(4))!
        
        var request = URLRequest(url: url)

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Token 5fb3d95a5a1980f112918e03be474e70da961175"
                         , forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            let exercise = try! JSONDecoder().decode(Exercise.self, from: data!)

            DispatchQueue.main.async {
                completion(exercise)
            }
        }
        .resume()
    }
}
