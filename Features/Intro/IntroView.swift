//
//  IntroView.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 28/06/24.
//

import SwiftUI
import ComposableArchitecture

struct IntroView: View {
  @Bindable var store: StoreOf<IntroFeature>
  
    var body: some View {
      ZStack {
        CustomColor.red800.ignoresSafeArea()
        
        VStack {
          Spacer()
          
          Image("logo")
            .resizable()
            .frame(width: 100, height: 100)
          
          Spacer()
          
          Text("Loading...")
            .font(CustomFont.reservationRegular(size: 18))
            .foregroundColor(.white)
        }
        .padding(.bottom, 48.0)
      }
      .onAppear { self.store.send(.onAppear) }
    }
}
