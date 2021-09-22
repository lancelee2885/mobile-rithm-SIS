//
//  Upcoming.swift
//  mobile-Rithm-SIS
//
//  Created by Alex  Rutan on 9/22/21.
//

import SwiftUI

struct Upcoming: View {
    @State var lectureSessions: [LectureInstance] = []
    @State var exerciseSessions: [ExerciseInstance] = []
    @State var lectures: [Lecture] = []
    @State var lectureLinks: [String] = []
    
    var body: some View {
        
        VStack {
            NavigationView {
                List(lectures) { lecture in
                    NavigationLink(destination: LectureDetail(lecture: lecture)) {
                        Text(lecture.title)
                    }
                }
                
                .onAppear {
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
                }
                .navigationTitle("Lecture Links")
            }
            
    
//            NavigationView {
//                List(lectures) { lecture in
//                    Text(lecture.title)
//                }
//                .onAppear {
//                    for lectureLink in Array(lectureLinks.prefix(3)) {
//                        UpcomingLecturesApi().getLecture(lectureURL: lectureLink) { l in
//                            self.lectures.append(l)
//                        }
//                    }
//
//                }.navigationTitle("Lectures")
                
//            }
        }
    }
    
    struct Upcoming_Previews: PreviewProvider {
        static var previews: some View {
            Upcoming()
                .previewDevice("iPhone 13 Pro")
        }
    }
}
