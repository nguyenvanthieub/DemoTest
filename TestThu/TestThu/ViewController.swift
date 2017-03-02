//
//  ViewController.swift
//  TestThu
//
//  Created by Nguyen Van Thieu B on 2/23/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let timeInterval = 1514156400.0
        print("timeInterval ", timeInterval)
        let date = Date(timeIntervalSince1970: timeInterval)
        print("date ", date)
        print("date.toDateString ", date.toDateString())
        
        let now = Date();
        let coms = now.components()
        
        print("now.toDateString ", String(format: "%04d/%02d/%02d", coms.2!, coms.1!, coms.0!))
        
        let now2 = NSDate()                         // "Aug 25, 2015, 2:56 PM"
        print("now2", now2.toString(format: "yyyy-MM-dd HH:mm:ss"))
        
        let now3 = Date();
        if #available(iOS 10.0, *) {
            print("now3.toDateString2 ", now.toDateString2())
        } else {
            // Fallback on earlier versions
        }
    }

}

extension Date {
    func toDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"//"yyyy/MM/dd"
        return dateFormatter.string(from: self);
    }
    
    func components() -> (Int?, Int?, Int?, Int?, Int?, Int?) {
        let dateComponents = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: self)
        return (dateComponents.day, dateComponents.month, dateComponents.year, dateComponents.hour, dateComponents.minute, dateComponents.second)
    }
    
    @available(iOS 10.0, *)
    func toDateString2() -> String {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.date(from: "MM-dd-yyyy")
//        dateFormatter.dateFormat = "MM-dd-yyyy"//"yyyy/MM/dd"
        return dateFormatter.string(from: self);
    }
    
}

extension NSDate {
    // Instance Method
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self as Date)
    }
}
