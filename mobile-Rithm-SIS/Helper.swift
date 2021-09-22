//
//  Helper.swift
//  mobile-Rithm-SIS
//
//  Created by Lance on 9/22/21.
//

import Foundation

class Helper {
    static func formatDate (date: String) -> Date! {

        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime]
        
        return dateFormatter.date(from: date)

    }
}


