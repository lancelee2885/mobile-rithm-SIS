//
//  ExerciseData.swift
//  mobile-Rithm-SIS
//
//  Created by Alex  Rutan on 9/22/21.
//

import SwiftUI

struct ExerciseList: Codable, Identifiable {
    let id = UUID()
    var results: Array<ExerciseInstance>
}

struct ExerciseInstance: Codable, Identifiable {
    let id = UUID()
    var title : String
    var api_url : String
}

class ExerciseApi {
    func getExercises(completion: @escaping (ExerciseList) -> ()) {
        guard let url = URL(string: "https://r22.students.rithmschool.com/api/exercisesessions/") else { return }
        
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Token 5fb3d95a5a1980f112918e03be474e70da961175"
                         , forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            let exercises = try! JSONDecoder().decode(ExerciseList.self, from: data!)

            DispatchQueue.main.async {
                completion(exercises)
            }
        }
        .resume()
    }
}
