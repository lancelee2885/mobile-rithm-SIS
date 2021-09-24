//
//  LectureExample.swift
//  mobile-Rithm-SIS
//
//  Created by Lance on 9/23/21.
//

import Foundation

let lectureExample: Lecture = load("LectureExample.json")
let eventExample: Event = load("EventExample.json")
let exerciseExample: Exercise = load("ExerciseExample.json")



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
