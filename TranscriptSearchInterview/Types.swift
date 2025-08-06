//
//  types.swift
//  TranscriptSearchInterview
//
//  Created by Lawrence Liu on 8/5/25.
//
import Foundation

struct Transcript: Identifiable, Decodable {
    let id: String
    let text: String
    let date: Date
    let application: String
    let windowName: String
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}


struct RuntimeError: LocalizedError {
    let description: String

    init(_ description: String) {
        self.description = description
    }

    var errorDescription: String? {
        description
    }
}
