//
//  TranscriptManager.swift
//  TranscriptSearchInterview
//
//  Created by Lawrence Liu on 8/5/25.
//

import Foundation
import SwiftUI

enum TranscriptViewStates {
    case loading
    case empty
    case error(Error)
    case complete([Transcript])
}

@Observable
class TranscriptViewModel {
    var transcripts = [Transcript]()
    var loadingState: TranscriptViewStates = .loading
    
    func loadData () {

        do {
            
            self.loadingState = .loading
            
            guard let url = Bundle.main.url(forResource: "Transcripts", withExtension: "json")
            else {
                throw RuntimeError("No file found")
            }
            
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let transcripts = try decoder.decode([Transcript].self, from: data)
            
            self.transcripts = transcripts
            
            self.loadingState = transcripts.isEmpty ? .empty :  .complete(transcripts)

        }
        
        catch {
            
            self.loadingState = .error(error)
            
        }
        

    }
}


