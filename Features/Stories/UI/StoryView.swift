//
//  StoryView.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 26/06/24.
//

import SwiftUI

struct StoryView: View {
  let storyModel: StoryModel
  
    var body: some View {
      ScrollView {
        VStack(alignment: .leading) {
          FixedHeightSpacer(48.0)
          
          IdentityBannerView()
          
          Spacer()
          
          Text(self.storyModel.title)
            .font(CustomFont.seasonRegular(size: 32))
            .foregroundColor(.white)
            .padding(.horizontal, 16.0)
          
          FixedHeightSpacer(16.0)
        }
        .frame(height: 373.0)
        .background(
          Image(self.storyModel.cover)
            .resizable()
            .aspectRatio(contentMode: .fill)
        )
        
        VStack(spacing: 45.0) {
          ForEach(self.storyModel.storyComponents, id: \.self) { component in
            switch component.type {
            case .text:
              Text(component.content)
                .font(CustomFont.reservationRegular(size: 12))
                .foregroundColor(.black)
              
            case .image:
              Image(component.content)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(14.0)
            }
          }
          Text(EventModel.mock.description)
            .font(CustomFont.reservationRegular(size: 12))
            .foregroundColor(.black)
        }
        .padding(.all, 16.0)
        
        FixedHeightSpacer(48.0)
      }
      .background(CustomColor.beige200)
      .ignoresSafeArea(.all)
    }
}

#Preview {
  StoryView(storyModel: .mock)
}
