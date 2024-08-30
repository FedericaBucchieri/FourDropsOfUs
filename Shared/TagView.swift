//
//  TagView.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 06/07/24.
//

import SwiftUI

struct TagView: View {
  let tagLabel: String
  
  var body: some View {
    Text(tagLabel)
      .font(CustomFont.reservationRegular(size: 11))
      .foregroundColor(CustomColor.beige200)
      .padding(.horizontal, 15.0)
      .padding(.vertical, 6.0)
      .background(CustomColor.beige200.opacity(0.5))
      .cornerRadius(5.0)
  }
}
