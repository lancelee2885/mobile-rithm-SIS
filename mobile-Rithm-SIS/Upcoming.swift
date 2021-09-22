//
//  Upcoming.swift
//  mobile-Rithm-SIS
//
//  Created by Alex  Rutan on 9/22/21.
//

import SwiftUI
import Foundation


struct Upcoming: View {
    @State var lectureSessions: [LectureInstance] = []
    @State var lectures: [Lecture] = []
    @State var lectureLinks: [String] = []
    @State var exerciseSessions: [ExerciseInstance] = []
    @State var exerciseLinks: [String] = []
    @State var exercises: [Exercise] = []
    
    
    var body: some View {
        
        VStack {
            NavigationView {
                
                List {
                    Section(header: Text("Exercise")) {
                        ForEach(exercises) { exercise in
                            NavigationLink(destination: ExerciseDetail(exercise: exercise)) {
                                VStack(alignment: .leading) {
                                    Text(exercise.title)
//                                    .font(.title3)
                                    Text("\(Helper.formatDate(input: exercise.exerciselabsession_set[0].start_at)) - \(Helper.formatDate(input: exercise.exerciselabsession_set.last!.end_at))")
                                        .font(.system(size:12))
                                        .foregroundColor(.gray)
                                }
                                
                            }
                        }
                    }
                    Section(header: Text("Lecture")) {
                        ForEach(lectures) { lecture in
                            NavigationLink(destination: LectureDetail(lecture: lecture)) {
                                VStack(alignment: .leading) {
                                    Text(lecture.title)
//                                    .font(.title3)
                                    Text("\(Helper.formatDate(input: lecture.start_at)) - \(Helper.formatDate(input: lecture.end_at))")
                                        .font(.system(size:12))
                                        .foregroundColor(.gray)
                                }
                                
                            }
                        }
                    }
                    
                    
                   
                }.onAppear {
                    lectureSessions = []
                    exerciseSessions = []
                    lectures = []
                    lectureLinks = []
                    exercises = []
                    exerciseLinks = []
                    
                    
                    LectureApi().getLectures { lectureResponse in
                        self.lectureSessions = lectureResponse.results
                        for result in lectureSessions {
                            self.lectureLinks.append(result.api_url)
                        }
                        for lectureLink in Array(lectureLinks.prefix(3)) {
                            UpcomingLecturesApi().getLecture(lectureURL: lectureLink) { l in
                                self.lectures.append(l)
                            }
                        }
                    }
                    
                    ExerciseApi().getExercises { exerciseResponse in
                        self.exerciseSessions = exerciseResponse.results
                        for result in exerciseSessions {
                            self.exerciseLinks.append(result.api_url)
                        }
                        for exerciseLink in Array(exerciseLinks.prefix(3)) {
                            UpcomingExercisesApi().getExercise(exerciseURL: exerciseLink) { e in
                                self.exercises.append(e)
                            }
                        }
                    }
                }
                .navigationTitle("Upcoming")
            }
        }
    }
    
    struct Upcoming_Previews: PreviewProvider {
        static var previews: some View {
            Upcoming()
                .previewDevice("iPhone 13 Pro")
        }
    }
}
