//
//  ExerciseData.swift
//  mobile-Rithm-SIS
//
//  Created by Alex  Rutan on 9/22/21.
//

import SwiftUI
import Alamofire

struct ExerciseResponse: Codable, Identifiable {
    let id = UUID()
    var results: Array<ExerciseInstance>
}

struct ExerciseInstance: Codable, Identifiable {
    let id = UUID()
    var title : String
    var api_url : String
}

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


class ExerciseApi: ObservableObject {
    
    @Published var exerciseSessions = [ExerciseInstance]()
    @Published var exerciseLinks = [String]()
    @Published var exercises = [Exercise]()
    
    init () {
        guard let url = URL(string: "https://r22.students.rithmschool.com/api/exercisesessions/") else { return }
        
        AF.request(url, headers: [
            "Authorization": "Token 5fb3d95a5a1980f112918e03be474e70da961175",
            "Accept": "application/json"
        ]).responseJSON { response in
            guard let data = response.data else {return}
            do {
                let _exerciseList = try JSONDecoder().decode(ExerciseResponse.self, from: data)
                self.exerciseSessions = _exerciseList.results.shuffled()
                
                for n in 1...5 {
                    self.exerciseLinks.append(self.exerciseSessions[n].api_url)
                }
            } catch {
                print("ERROR")
            }
            
            for link in self.exerciseLinks {
                AF.request("https" + link.dropFirst(4), headers: [
                            "Authorization": "Token 5fb3d95a5a1980f112918e03be474e70da961175",
                            "Accept": "application/json"
                        ]).responseJSON { response in
                            guard let data = response.data else {return}
                            do {
                                let _exercise = try JSONDecoder().decode(Exercise.self, from: data)
                                self.exercises.append(_exercise)
                                print(_exercise.title)
                            } catch {
                                print("ERROR")
                            }
                }
            }
        }
        
        
    }
}
