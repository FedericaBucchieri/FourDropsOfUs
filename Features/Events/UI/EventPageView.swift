//
//  EventPageView.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 25/06/24.
//

import SwiftUI
import ComposableArchitecture

struct EventPageView: View {
  @Bindable var store: StoreOf<EventPageFeature>
  
  var body: some View {
    VStack(spacing: 0) {
      ZStack(alignment: .bottomLeading) {
        Image(self.store.eventModel.image)
          .resizable()
          .aspectRatio(contentMode: .fill)

        LinearGradient(
          gradient: Gradient(colors: [.black.opacity(0.7), .clear]),
          startPoint: .bottom,
          endPoint: .top
        )

        VStack(alignment: .leading) {
          TagView(tagLabel: self.store.eventModel.tag)

          FixedHeightSpacer(10)

          Text(self.store.eventModel.title)
            .font(CustomFont.seasonRegular(size: 40))
            .foregroundColor(CustomColor.beige200)

          FixedHeightSpacer(24)
        }
        .padding(.horizontal, 24.0)
      }
      .frame(height: 260)

      VStack(alignment: .leading, spacing: 0.0) {
        HStack(spacing: 0) {
          VStack(alignment: .leading, spacing: 0) {
            Text(self.store.eventModel.location)
              .font(.system(size: 15, weight: .bold))
              .foregroundColor(.black)

            Text("📍 " + self.store.eventModel.address)
              .font(.system(size: 11))
              .foregroundColor(.black)
          }

          Spacer()

          CalendarDateDarkView(
            day: self.store.eventModel.day,
            month: self.store.eventModel.month
          )
          .padding(.vertical, 4)
        }

        Divider()

        FixedHeightSpacer(15.0)

        ScrollView {
          Text(self.store.eventModel.description)
            .font(.system(size: 14))
            .foregroundColor(.black)
        }
        
        FixedHeightSpacer(8.0)
        
        HStack() {
          Spacer()
          
          Button(action: { self.store.send(.didTapReserveYourSpot) }) {
            Text("Reserve your spot")
              .font(.system(size: 17, weight: .semibold))
              .padding(.vertical, 10)
              .padding(.horizontal, 14)
              .foregroundColor(CustomColor.beige200)
              .background(CustomColor.red500)
              .cornerRadius(40.0)
          }
          
          Spacer()
        }
        
      }
      .padding(.horizontal, 16.0)
      
      Spacer()
    }
    .edgesIgnoringSafeArea(.top)
    .background(CustomColor.beige200)    
  }
}

#Preview {
  EventPageView(store: .init(initialState: EventPageFeature.State(eventModel: .mock)) {
    EventPageFeature()
  })
}
