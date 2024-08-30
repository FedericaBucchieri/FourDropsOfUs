//
//  CalendarDateView.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 25/06/24.
//

import SwiftUI

struct CalendarDateView: View {
  let day: String
  let month: String
  
    var body: some View {
      VStack(alignment: .leading, spacing: 5) {
        Text(day)
          .font(CustomFont.reservationBold(size: 28))
          .foregroundColor(.black)
          .frame(width: 50, height: 50)
          .background(CustomColor.beige200)
          .clipShape(.rect(cornerRadius: 12))
        
        Text(month)
          .font(CustomFont.reservationBold(size: 11))
          .foregroundColor(CustomColor.beige200)
          .frame(width: 50, alignment: .center)
      }
    }
}

struct CalendarDateDarkView: View {
  let day: String
  let month: String

  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      Text(day)
        .font(CustomFont.reservationBold(size: 28))
        .foregroundColor(CustomColor.beige200)
        .frame(width: 50, height: 50)
        .background(CustomColor.red800)
        .clipShape(.rect(cornerRadius: 12))

      Text(month)
        .font(CustomFont.reservationBold(size: 11))
        .foregroundColor(CustomColor.red800)
        .frame(width: 50, alignment: .center)
    }
  }
}
