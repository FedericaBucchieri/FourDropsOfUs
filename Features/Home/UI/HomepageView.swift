//
//  HomepageView.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 26/06/24.
//

import SwiftUI
import ComposableArchitecture

struct HomepageView: View {
  @Bindable var store: StoreOf<HomepageFeature>
  
  var body: some View {
    ScrollView {
      VStack(spacing: 0) {
        HomepageCarouselView(store: self.store)
          .cornerRadius(15.0)
        
        FixedHeightSpacer(30.0)
        
        VStack(spacing: 0.0) {
          HomepageIntroView()
          
          FixedHeightSpacer(50.0)

          HomepageSectionHeader(tagLabel: "Stories")
          
          FixedHeightSpacer(20.0)

          HomepageCardsCarouselView(
            model: self.store.storiesCardVM,
            selectCard: { print("Selected Card") }
          )
          .frame(height: 200.0)

          FixedHeightSpacer(50.0)

          Text("1.8 bilion people in the world have menstrual cycle")
            .foregroundColor(CustomColor.beige200)
            .font(CustomFont.seasonBold(size: 21))
            .multilineTextAlignment(.center)
            .padding(.horizontal, 24.0)

          FixedHeightSpacer(10.0)

          Text("Ready to share your experience with us?")
            .foregroundColor(.white)
            .font(.system(size: 13))
            .multilineTextAlignment(.center)
            .padding(.horizontal, 24.0)

          FixedHeightSpacer(15.0)

          Button(action: {  }) {
            Text("Explore Events")
              .font(.system(size: 13, weight: .semibold))
              .padding(.vertical, 10)
              .padding(.horizontal, 14)
              .foregroundColor(CustomColor.beige200)
              .background(CustomColor.red500)
              .cornerRadius(40.0)
          }

          FixedHeightSpacer(50.0)

          HomepageSectionHeader(tagLabel: "Faces")

          FixedHeightSpacer(20.0)

          HomepageCardsCarouselView(
            model: self.store.storiesCardVM,
            selectCard: { print("Selected Card") }
          )
          .frame(height: 200)
        }
        
        Spacer()
      }
    }
    .ignoresSafeArea()
    .background(
      Image("background")
        .resizable()
        .ignoresSafeArea(.all)
    )
  }
}


#Preview {
  HomepageView(store: .init(initialState: HomepageFeature.State()) {
    HomepageFeature()
  })
}
