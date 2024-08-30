//
//  HomepageSectionHeader.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 06/07/24.
//

import SwiftUI

struct HomepageSectionHeader: View {
  let tagLabel: String
  
  var body: some View {
    HStack(spacing: 10) {
      TagView(tagLabel: self.tagLabel)
      
      Rectangle()
        .frame(height: 1.0)
        .foregroundColor(.beige200.opacity(0.5))
    }
    .padding(.horizontal, 16.0)
  }
}
