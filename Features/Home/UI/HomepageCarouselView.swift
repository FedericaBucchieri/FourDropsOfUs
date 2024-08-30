//
//  HomepageCarouselView.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 06/07/24.
//

import SwiftUI
import ComposableArchitecture

struct HomepageCarouselView: View {
  @Bindable var store: StoreOf<HomepageFeature>
  
    var body: some View {
      ZStack {
        TabView {
          ForEach(self.store.carouselPages, id: \.id) { pageModel in
            HomepageCarouselPageView(model: pageModel)
          }
        }
        
        VStack(spacing: 0.0)  {
          FixedHeightSpacer(63.0)
          
          IdentityBannerView()
          
          Spacer()
        }
      }
      .frame(height: 486)
      .tabViewStyle(.page(indexDisplayMode: .always))
    }
}
