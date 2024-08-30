//
//  EventListView.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 25/06/24.
//

import SwiftUI
import ComposableArchitecture

struct EventListView: View {
  @Bindable var store: StoreOf<EventListFeature>
  @Environment(\.safeAreaInsets) var safeArea

  var body: some View {
    ScrollView {
      VStack(spacing: 0.0) {
        FixedHeightSpacer(self.safeArea.top + 12.0)

        IdentityBannerView()

        FixedHeightSpacer(10.0)

        Text("Events")
          .foregroundColor(CustomColor.beige200)
          .font(CustomFont.seasonRegular(size: 32))

        FixedHeightSpacer(15.0)

        Text("Explore with us the shared experience of having a \n menstrual cycle as a source of connection.")
          .foregroundColor(CustomColor.beige200)
          .font(.system(size: 14))
          .multilineTextAlignment(.center)

        FixedHeightSpacer(36.0)

        HStack {
          TagView(tagLabel: "Incoming Events")

          Spacer()
        }
        .padding(.horizontal, 16.0)

        FixedHeightSpacer(12.0)

        ForEach(self.store.events, id: \.title) { eventModel in
          Button(action: { self.store.send(.didTapOnEvent(eventModel))}) {
            EventCardView(eventModel: eventModel)
          }

          FixedHeightSpacer(25.0)
        }
        .padding(.horizontal, 16.0)

        Divider()
          .foregroundColor(CustomColor.beige200)
          .padding(.horizontal, 24.0)

        FixedHeightSpacer(25.0)

        HStack {
          TagView(tagLabel: "Past Events")

          Spacer()
        }
        .padding(.horizontal, 16.0)

        FixedHeightSpacer(12.0)
        
        ForEach(self.store.events, id: \.title) { eventModel in
          Button(action: { self.store.send(.didTapOnEvent(eventModel))}) {
            EventCardSmallView(eventModel: eventModel)
          }

          FixedHeightSpacer(25.0)
        }
        .padding(.horizontal, 16.0)

        Spacer()
      }
    }
    .ignoresSafeArea()
    .background(
      Image("background")
        .resizable()
        .ignoresSafeArea(.all)
    )
    .popover(item: self.$store.scope(state: \.destination?.eventPage, action: \.destination.eventPage)) { store in
      EventPageView(store: store)
    }
  }
}


  #Preview {
    EventListView(store: .init(initialState: EventListFeature.State(events: [])) {
      EventListFeature()
    })
  }
