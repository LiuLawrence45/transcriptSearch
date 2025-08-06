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
    
    
    private struct TranscriptRow: View {
        let transcript: Transcript
        var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(transcript.application)
                        .font(.system(size: 12, weight: .medium))
                        .padding(.vertical, 4)
                        .padding(.horizontal, 6)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.gray.opacity(0.2))
                        )
                    
                    Spacer()
                    
                    Text(transcript.formattedDate)
                        .font(.system(size: 12))
                        .foregroundStyle(Color.gray)
                }
                
                Text(transcript.text)
                    .font(.system(size: 14))
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 16)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
        }
    }
}


