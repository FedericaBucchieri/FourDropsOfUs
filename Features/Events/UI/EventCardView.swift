//
//  EventCardView.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 26/06/24.
//

import SwiftUI

struct EventCardView: View {
  let eventModel: EventModel

  var body: some View {
    HStack(spacing: 0) {
      ZStack(alignment: .top) {
        Image(self.eventModel.image)
          .resizable()
          .scaledToFill()
          .frame(width: 100, height: 150)
          .cornerRadius(10.0)

        CalendarDateView(day: self.eventModel.day, month: self.eventModel.month)
          .padding(.top, 10.0)
      }

      FixedWidthSpacer(16.0)

      VStack(alignment: .leading, spacing: 0) {
        Text(self.eventModel.title)
          .font(CustomFont.seasonBold(size: 24))
          .foregroundColor(.black)

        FixedHeightSpacer(8.0)

        Text(self.eventModel.shortDescription)
          .font(.system(size: 11))
          .foregroundColor(.black)
          .multilineTextAlignment(.leading)
          .padding(.trailing, 8.0)

        Spacer()

        HStack {
          Spacer()

          Button(action: {  }) {
            Text("Discover more")
              .font(.system(size: 13, weight: .semibold))
              .padding(.vertical, 10)
              .padding(.horizontal, 14)
              .foregroundColor(CustomColor.beige200)
              .background(CustomColor.red500)
              .cornerRadius(40.0)
          }
        }

        FixedHeightSpacer(8.0)
      }

    }
    .padding(.all, 4.0)
    .background(CustomColor.beige200)
    .cornerRadius(14.0)
  }
}
