//
//  Components.swift
//  TranscriptSearchInterview
//
//  Created by Lawrence Liu on 8/6/25.
//
import SwiftUI

struct VerticalDivider: View {
    
    var body: some View {
        Rectangle()
            .frame(width: 1)
            .foregroundColor(Color("Divider"))
    }
}


struct HorizontalDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(Color("Divider"))
    }
}
