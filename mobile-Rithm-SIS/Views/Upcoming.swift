//
//  Upcoming.swift
//  mobile-Rithm-SIS
//
//  Created by Alex  Rutan on 9/22/21.
//

import SwiftUI
import Foundation


struct Upcoming: View {
    
    @ObservedObject var lecture = LectureApi()
    @ObservedObject var event = EventApi()
    @ObservedObject var exercise = ExerciseApi()
    @State var exerciseLinks: [String] = []
    @State var exercises: [Exercise] = []

    
    
    var body: some View {
        
        VStack {
            ZStack {
                Color(red: 228 / 255, green: 107 / 255, blue: 102 / 255)
                    .ignoresSafeArea()
                    .padding(-10)
                Image("rithm_logo-0bbe0cba0becc168bb1ed46540bd26d6921d9f5194372128512268c203687780-1")
                    .resizable()
                    .frame(width: 130, height: 50)
            }
            .frame(width: 600, height: 50)
                
            VStack {
                
                NavigationView {
                    List {
                        
                        Section(header: Text("Lectures")){
                            ForEach(lecture.lectures) { lecture in
                                NavigationLink(destination: LectureDetail(lecture: lecture)){
                                    VStack(alignment: .leading) {
                                        Text(lecture.title)
                                        Text("\(Helper.formatDate(input: lecture.start_at)) - \(Helper.formatDate(input: lecture.end_at))")
                                            .font(.system(size:12))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                        
                        Section(header: Text("Exercises")) {
                            ForEach(exercise.exercises) { exercise in
                                NavigationLink(destination: ExerciseDetail(exercise: exercise)) {
                                    VStack(alignment: .leading) {
                                        Text(exercise.title)
                                        Text("\(Helper.formatDate(input: exercise.exerciselabsession_set[0].start_at)) - \(Helper.formatDate(input: exercise.exerciselabsession_set.last!.end_at))")
                                            .font(.system(size:12))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                        
                        Section(header: Text("Events")){
                            ForEach(event.events) { event in
                                NavigationLink(destination: EventDetail(event: event)){
                                    VStack(alignment: .leading) {
                                        Text(event.title)
                                        Text("\(Helper.formatDate(input: event.start_at)) - \(Helper.formatDate(input: event.end_at))")
                                            .font(.system(size:12))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                    }
                    .navigationTitle("Upcoming")
                }
            }
        }
    }
    
    struct Upcoming_Previews: PreviewProvider {
        static var previews: some View {
            Upcoming()
                .previewDevice("iPhone 13 Pro Max")
        }
    }
}


