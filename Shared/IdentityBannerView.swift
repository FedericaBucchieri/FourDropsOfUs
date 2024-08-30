//
//  IdentityBannerView.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 25/06/24.
//

import SwiftUI

struct IdentityBannerView: View {
    var body: some View {
      HStack(spacing: 0) {
        FixedWidthSpacer(16.0)
        
        Rectangle()
          .frame(height: 1.0)
          .foregroundColor(.white)
        
        FixedWidthSpacer(10.0)
        
        Image("logo")
          .resizable()
          .frame(width: 35.0, height: 35.0)
        
        FixedWidthSpacer(16.0)
      }
    }
}
