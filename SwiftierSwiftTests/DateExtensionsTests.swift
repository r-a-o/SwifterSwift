//
//  DateExtensionsTests.swift
//  SwiftierSwift
//
//  Created by Omar Albeik on 8/8/16.
//  Copyright © 2016 Omar Albeik. All rights reserved.
//

import XCTest
@testable import SwiftierSwift

class DateExtensionsTests: XCTestCase {
    
    let date = Date()
    
    override func setUp() {
        super.setUp()
        tearDown()
    }
    
    func testCalendar() {
        XCTAssert(date.calendar == Calendar.current, "Couldn't get correct value for \(#function)")
    }
    
    func testTimeZone() {
        XCTAssert(date.timeZone == TimeZone.current, "Couldn't get correct value for \(#function)")
    }
    
    func testNanosecond() {
        XCTAssert(date.nanosecond == Calendar.current.component(.nanosecond, from: date), "Couldn't get correct value for \(#function)")
    }
    
    func testSecond() {
        XCTAssert(date.second == Calendar.current.component(.second, from: date), "Couldn't get correct value for \(#function)")
        
        var date1 = date
        date1.second = 12
        XCTAssert(date1.second == Calendar.current.component(.second, from: date1) && date1.second == 12, "Couldn't get correct value for \(#function)")
    }
    
    func testMinute() {
        XCTAssert(date.minute == Calendar.current.component(.minute, from: date), "Couldn't get correct value for \(#function)")
        
        var date1 = date
        date1.minute = 13
        XCTAssert(date1.minute == Calendar.current.component(.minute, from: date1) && date1.minute == 13, "Couldn't get correct value for \(#function)")
    }
    
    func testHour() {
        XCTAssert(date.hour == Calendar.current.component(.hour, from: date), "Couldn't get correct value for \(#function)")
        
        var date1 = date
        date1.hour = 4
        XCTAssert(date1.hour == Calendar.current.component(.hour, from: date1), "Couldn't get correct value for \(#function)")
    }
    
    func testDay() {
        XCTAssert(date.day == Calendar.current.component(.day, from: date), "Couldn't get correct value for \(#function)")
        
        var date1 = date
        date1.day = 4
        XCTAssert(date1.day == Calendar.current.component(.day, from: date1), "Couldn't get correct value for \(#function)")
    }
    
    func testWeekday() {
        XCTAssert(date.weekday == Calendar.current.component(.weekday, from: date), "Couldn't get correct value for \(#function)")
    }
    
    func testWeekOfMonth() {
        XCTAssert(date.weekOfMonth == Calendar.current.component(.weekOfMonth, from: date), "Couldn't get correct value for \(#function)")
    }
    
    func testWeekOfYear() {
        XCTAssert(date.weekOfYear == Calendar.current.component(.weekOfYear, from: date), "Couldn't get correct value for \(#function)")
    }
    
    func testMonth() {
        XCTAssert(date.month == Calendar.current.component(.month, from: date), "Couldn't get correct value for \(#function)")
        
        var date1 = date
        date1.month = 3
        XCTAssert(date1.month == Calendar.current.component(.month, from: date1) && date1.month == 3, "Couldn't get correct value for \(#function)")
    }
    
    func testYear() {
        XCTAssert(date.year == Calendar.current.component(.year, from: date), "Couldn't get correct value for \(#function)")
        
        var date1 = date
        date1.year = 2000
        XCTAssert(date1.year == Calendar.current.component(.year, from: date1) && date1.year == 2000, "Couldn't get correct value for \(#function)")
    }
    
    func testEra() {
        XCTAssert(date.era == Calendar.current.component(.era, from: date), "Couldn't get correct value for \(#function)")
    }
    
    func testQuarter() {
        XCTAssert(date.quarter == Calendar.current.component(.quarter, from: date), "Couldn't get correct value for \(#function)")
    }
    
    func testInToday() {
        XCTAssert(date.isInToday == true, "Couldn't get correct value for \(#function)")
        var date1 = Date()
        date1.day -= 1
        XCTAssert(date1.isInToday == false, "Couldn't get correct value for \(#function)")
    }
    
    func testAdd() {
        var date1 = Date()
        
        date1.second = 10
        date1.add(component: .second, value: -1)
        XCTAssert(date1.second == 9, "Could not substract seconds in \(#function)")
        
        date1.add(component: .second, value: 1)
        XCTAssert(date1.second == 10, "Could not add seconds in \(#function)")
        
        date1.minute = 10
        date1.add(component: .minute, value: -1)
        XCTAssert(date1.minute == 9, "Could not substract minutes in \(#function)")
        
        date1.add(component: .minute, value: 1)
        XCTAssert(date1.minute == 10, "Could not add minutes in \(#function)")
        
        date1.hour = 10
        date1.add(component: .hour, value: -1)
        XCTAssert(date1.hour == 9, "Could not substract hours in \(#function)")
        
        date1.add(component: .hour, value: 1)
        XCTAssert(date1.hour == 10, "Could not add hours in \(#function)")
        
        date1.day = 10
        date1.add(component: .day, value: -1)
        XCTAssert(date1.day == 9, "Could not substract days in \(#function)")
        
        date1.add(component: .day, value: 1)
        XCTAssert(date1.day == 10, "Could not add days in \(#function)")
        
        date1.month = 10
        date1.add(component: .month, value: -1)
        XCTAssert(date1.month == 9, "Could not substract months in \(#function)")
        
        date1.add(component: .month, value: 1)
        XCTAssert(date1.month == 10, "Could not add months in \(#function)")
        
        date1.year = 2016
        date1.add(component: .year, value: -1)
        XCTAssert(date1.year == 2015, "Could not substract years in \(#function)")
        
        date1.add(component: .year, value: 1)
        XCTAssert(date1.year == 2016, "Could not add years in \(#function)")
    }
    
    func testBeginning() {
        
        XCTAssert(Date().beginning(of: .second).nanosecond == 0, "Could not get correct value for beginning of second in \(#function)")
        
        XCTAssert(Date().beginning(of: .minute).second == 0, "Could not get correct value for beginning of minute in \(#function)")
        
        XCTAssert(Date().beginning(of: .hour).minute == 0, "Could not get correct value for beginning of hour in \(#function)")
        
        XCTAssert(Date().beginning(of: .day).hour == 0 && Date().beginning(of: .day).isInToday, "Could not get correct value for beginning of day in \(#function)")
        
        let date = Date(calendar: nil, timeZone: nil, era: nil, year: 2016, month: 8, day: 9, hour: nil, minute: nil, second: nil, nanosecond: nil)
        
        let beginningOfWeek = Date(calendar: nil, timeZone: nil, era: nil, year: 2016, month: 8, day: 7, hour: nil, minute: nil, second: nil, nanosecond: nil)
        
        XCTAssert(date.beginning(of: .weekOfMonth).day == beginningOfWeek.day, "Could not get correct value for beginning of week in \(#function)")
        
        let beginningOfMonth = Date(calendar: nil, timeZone: nil, era: nil, year: 2016, month: 8, day: 1, hour: nil, minute: nil, second: nil, nanosecond: nil)
        
        XCTAssert(date.beginning(of: .month).day == beginningOfMonth.day, "Could not get correct value for beginning of month in \(#function)")
        
        let beginningOfYear = Date(calendar: nil, timeZone: nil, era: nil, year: 2016, month: 1, day: 1, hour: nil, minute: nil, second: nil, nanosecond: nil)
        
        XCTAssert(date.beginning(of: .year).day == beginningOfYear.day, "Could not get correct value for beginning of year in \(#function)")
    }
    
    func testNewDate() {
        let date = Date(calendar: Date().calendar, timeZone: Date().timeZone, era: Date().era, year: Date().year, month: Date().month, day: Date().day, hour: Date().hour, minute: Date().minute, second: Date().second, nanosecond: Date().nanosecond)
        let date1 = Date(timeIntervalSince1970: date.timeIntervalSince1970)
        
        XCTAssert(date.timeIntervalSince1970 == date1.timeIntervalSince1970, "Could not get correct value for \(#function)")
    }
    
    override func tearDown() {
        super.tearDown()
    }
}