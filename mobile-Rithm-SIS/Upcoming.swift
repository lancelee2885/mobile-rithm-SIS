//
//  Upcoming.swift
//  mobile-Rithm-SIS
//
//  Created by Alex  Rutan on 9/22/21.
//

import SwiftUI
import Foundation


struct Upcoming: View {
    @State var lectureSessions = [LectureInstance]()
    @State var lectures = [Lecture]()
    @State var lectureLinks = [String]()
    @State var exerciseSessions: [ExerciseInstance] = []
    @State var exerciseLinks: [String] = []
    @State var exercises: [Exercise] = []
    @State var eventSessions: [EventInstance] = []
    @State var eventLinks: [String] = []
    @State var events: [Event] = []
    
    
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
                        Section(header: Text("Lectures")
                                    .font(Font.custom("SourceSerifPro-Regular", size: 14))) {
                            ForEach(lectures) { lecture in
                                NavigationLink(destination: LectureDetail(lecture: lecture)) {
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
                            ForEach(exercises) { exercise in
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
                        
                        Section(header: Text("Events")) {
                            ForEach(events) { event in
                                NavigationLink(destination: EventDetail(event: event)) {
                                    VStack(alignment: .leading) {
                                        Text(event.title)

                                        Text("\(Helper.formatDate(input: event.start_at)) - \(Helper.formatDate(input: event.end_at))")
                                            .font(.system(size:12))
                                            .foregroundColor(.gray)
                                    }
                                    
                                }
                            }
                        }
                        
                    }.onAppear {
                        lectureSessions = []
                        lectures = []
                        lectureLinks = []
                        exerciseSessions = []
                        exercises = []
                        exerciseLinks = []
                        eventSessions = []
                        events = []
                        eventLinks = []
                        
                        
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
                        
                        EventApi().getEvents { eventResponse in
                            self.eventSessions = eventResponse.results
                            for result in eventSessions {
                                self.eventLinks.append(result.api_url)
                            }
                            for eventLink in Array(eventLinks.prefix(3)) {
                                UpcomingEventsApi().getEvent(eventURL: eventLink) { e in
                                    self.events.append(e)
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
