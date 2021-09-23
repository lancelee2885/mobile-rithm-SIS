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
        VStack(alignment: .center) {
            Text(lecture.title)
                .font(.title)
            
            Divider()
            Text("\(Helper.formatDate(input: lecture.start_at)) - \(Helper.formatDate(input: lecture.end_at))")
                .font(.title2)
                .foregroundColor(.gray)
            Spacer().frame(maxHeight: 75)
            Text(lecture.description)
                .font(.title2)
//            Text(lecture.staff[0])
        }.offset(y: -250)
    }
}

//struct LectureDetail_Previews: PreviewProvider {
//    @StateObject var lectures = Lectures()
//    static var previews: some View {
//        LectureDetail(lecture: lectures.lectures[0])
//    }
//}
