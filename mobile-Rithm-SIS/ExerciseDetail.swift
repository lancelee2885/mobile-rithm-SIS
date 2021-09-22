//
//  ExerciseDetail.swift
//  mobile-Rithm-SIS
//
//  Created by Alex  Rutan on 9/22/21.
//

import SwiftUI

struct ExerciseDetail: View {
    var exercise: Exercise
    
    var body: some View {
        VStack {
            Text(exercise.title)
            Text(exercise.description)
//            Text(lecture.staff[0])
        }
    }
}

//struct ExerciseDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseDetail()
//    }
//}
