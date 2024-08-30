//
//  HomepageIntroView.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 06/07/24.
//

import SwiftUI

struct HomepageIntroView: View {
  var body: some View {
    VStack(spacing: 15.0) {
      Text("Four Drops of Us")
        .font(CustomFont.seasonRegular(size: 24))
        .foregroundColor(CustomColor.beige200)
      
      Text("Exploring the shared experience of having \na menstrual cycle as a source of connection")
        .font(.system(size: 14))
        .foregroundColor(CustomColor.beige200)
        .multilineTextAlignment(.center)
    }
    .padding(.horizontal, 16.0)
  }
}
