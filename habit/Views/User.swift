//
//  File.swift
//  habit
//
//  Created by Maggie Yu on 4/17/21.
//  Copyright © 2021 PCL. All rights reserved.
//

import Foundation

class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case uid, firstName, lastName, company, scores, reflections, calendarEvents, notifications
    }
    
    @Published var uid: String = "0"
    @Published var firstName: String = "First"
    @Published var lastName: String = "Last"
    @Published var company: String = "Company"
    @Published var scores: [String: [Int]] = [String: [Int]]()
    @Published var reflections: [String] = []
    @Published var calendarEvents: [String: [String: [String]]] = [String: [String: [String]]]()
    @Published var notifications: Bool = false
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        uid = try container.decode(String.self, forKey: .uid)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        company = try container.decode(String.self, forKey: .company)
        scores = try container.decode([String: [Int]].self, forKey: .scores)
        reflections = try container.decode([String].self, forKey: .reflections)
        calendarEvents = try container.decode([String: [String: [String]]].self, forKey: .calendarEvents)
        notifications = try container.decode(Bool.self, forKey: .notifications)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(uid, forKey: .uid)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(company, forKey: .company)
        try container.encode(scores, forKey: .scores)
        try container.encode(reflections, forKey: .reflections)
        try container.encode(calendarEvents, forKey: .calendarEvents)
        try container.encode(notifications, forKey: .notifications)
    }
}
