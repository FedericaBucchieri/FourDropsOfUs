//
//  HomepageCardCarouselView.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 06/07/24.
//

import ComposableArchitecture
import SwiftUI
import UIKit

struct HomepageCardsCarouselView: UIViewRepresentable {
  let model: HomepageCardCarouselVM
  let selectCard: () -> Void
  
  func makeUIView(context: Context) -> UICollectionView {
    let collectionViewLayout = CarouselCollectionViewLayout(
      numberOfItemsPerPage: 1,
      totalNumberOfItems: self.model.cards.count,
      sectionSpacing: 16.0,
      cellSpacing: 8.0
    )
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    collectionView.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: CarouselCollectionViewCell.reusableId)
    collectionView.backgroundColor = .clear
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.decelerationRate = .fast
    collectionView.delegate = context.coordinator
    collectionView.dataSource = context.coordinator
    
    return collectionView
  }
  
  func updateUIView(_ uiView: UICollectionView, context: Context) {
    uiView.reloadData()
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(
      model: self.model,
      selectCard: self.selectCard
    )
  }
}

class Coordinator: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
  var model: HomepageCardCarouselVM
  let selectCard: () -> Void
  
  init(
    model: HomepageCardCarouselVM,
    selectCard: @escaping () -> Void
  ) {
    self.model = model
    self.selectCard = selectCard
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.model.cards.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: CarouselCollectionViewCell.reusableId,
      for: indexPath
    ) as? CarouselCollectionViewCell else {
      assertionFailure("Unable to dequeue ShowcaseCollectionViewCell")
      return UICollectionViewCell()
    }
    
    let model = self.model.cards[indexPath.row]
    cell.configure(with: model)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    self.selectCard()
  }
}
