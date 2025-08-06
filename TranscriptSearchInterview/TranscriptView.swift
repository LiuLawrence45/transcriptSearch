//
//  TranscriptView.swift
//  TranscriptSearchInterview
//
//  Created by Lawrence Liu on 8/5/25.
//

import Foundation
import SwiftUI
public struct TranscriptView: View {
    
    @State private var viewModel = TranscriptViewModel()
    @State private var errorMessage: String?
    
    public var body: some View {
        VStack {
            switch viewModel.loadingState {
            case .loading:
                ProgressView().scaleEffect(0.5)
            case .empty:
                Text("No data has been loaded")
            case .error(let error):
                Text("Error loading files: \(error.localizedDescription)")
                    .foregroundColor(.red)
            case .complete(let transcripts):
                SearchBar(searchText: .constant(""))
                  ScrollView {
                      LazyVStack {
                          ForEach(transcripts) { transcript in
                              TranscriptRow(transcript: transcript)
                          }
                      }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .onAppear {
            viewModel.loadData()
        }
    }
}


