//
//  HomepageCarouselPageView.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 06/07/24.
//

import SwiftUI

struct HomepageCarouselPageView: View {
  let model: HomepageCarouselPageModel
  
  var body: some View {
    ZStack {
      GeometryReader { geometry in
        Image(self.model.cover)
          .resizable()
          .scaledToFill()
          .frame(width: geometry.size.width, height: geometry.size.height)
        
        LinearGradient(
          gradient: Gradient(colors: [.black.opacity(0.7), .clear]),
          startPoint: .bottom,
          endPoint: .top
        )
        
        VStack(alignment: .leading, spacing: 0.0) {
          Spacer()
          
          VStack(alignment: .leading, spacing: 10.0) {
            TagView(tagLabel: self.model.tag.rawValue)
            
            Text(self.model.title)
              .font(CustomFont.seasonRegular(size: 40))
              .foregroundColor(CustomColor.beige200)
            
            Text(self.model.description)
              .font(.system(size: 14))
              .foregroundColor(CustomColor.beige200)
          }
          .padding(.horizontal, 24.0)
          
          FixedHeightSpacer(60.0)
        }
      }
    }
    .ignoresSafeArea()
  }
}
