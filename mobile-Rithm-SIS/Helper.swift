//
//  Helper.swift
//  mobile-Rithm-SIS
//
//  Created by Lance on 9/22/21.
//

import Foundation

class Helper {
    static func formatDate (input: String) -> String! {

        let dateFormatter = DateFormatter()
//        dateFormatter.formatOptions = [.withTime]
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        if let date = dateFormatter.date(from: input) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateFormat = "MM-dd hh:mm a"
            return displayFormatter.string(from: date)
        }
        else { return "" }
    }
}


