//
//  LectureDetail.swift
//  mobile-Rithm-SIS
//
//  Created by Alex  Rutan on 9/22/21.
//

import SwiftUI

struct LectureDetail: View {
    var lecture: Lecture
    
    var body: some View {
        VStack {
            Text(lecture.title)
            Text(lecture.description)
//            Text(lecture.staff[0])
        }
    }
}
//
//struct LectureDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        LectureDetail(self.lecture = lectures[0])
//    }
//}
