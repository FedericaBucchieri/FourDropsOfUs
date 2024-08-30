//
//  EventCardSmallView.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 29/07/24.
//

import SwiftUI

struct EventCardSmallView: View {
  let eventModel: EventModel

  var body: some View {
    HStack(spacing: 0) {
      Image(self.eventModel.image)
        .resizable()
        .scaledToFill()
        .frame(width: 100, height: 80)
        .cornerRadius(10.0)

      FixedWidthSpacer(16.0)

      VStack(alignment: .leading, spacing: 0) {
        Text(self.eventModel.title)
          .font(CustomFont.seasonBold(size: 21))
          .foregroundColor(.black)

        FixedHeightSpacer(4.0)

        Text(self.eventModel.shortDescription)
          .font(.system(size: 11))
          .foregroundColor(.black)
          .multilineTextAlignment(.leading)
          .padding(.trailing, 8.0)

        Spacer()
      }

      Button(action: {  }) {
        Image(systemName: "chevron.right")
          .font(.system(size: 17))
          .foregroundColor(CustomColor.red500)
          .frame(width: 35, height: 35)
      }
    }
    .padding(.all, 4.0)
    .background(CustomColor.beige200)
    .cornerRadius(14.0)
  }
}
