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
        ScrollView {
            VStack(alignment: .center) {
                Text(exercise.title)
                    .font(.title)
                
                Divider()
                Text("\(Helper.formatDate(input: exercise.exerciselabsession_set[0].start_at)) - \(Helper.formatDate(input: exercise.exerciselabsession_set.last!.end_at))")
                    .font(.title2)
                    .foregroundColor(.gray)
                Spacer().frame(height: 60)
                Text(exercise.description)
                    .font(.title2)
                    .padding(.horizontal, 7.0)
                Spacer().frame(height: 60)
                Text("Staffs: ")
                HStack {
                    ForEach(exercise.exerciselabsession_set[0].staff, id: \.self) { staffLink in
                        CircleImage(image: Image( staffLink.components(separatedBy: "/")[5])
                        )
                            .padding(10)
                    }
                }
            }
        }
    }
}

//struct ExerciseDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseDetail()
//    }
//}
