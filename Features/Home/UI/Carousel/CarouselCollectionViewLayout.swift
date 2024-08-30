//
//  CarouselCollectionViewLayout.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 06/07/24.
//
import UIKit

class CarouselCollectionViewLayout: UICollectionViewFlowLayout {
  private let numberOfItemsPerPage: Int
  private let totalNumberOfItems: Int
  private var currentPage: Int
  private let velocityThreshold: CGFloat
  private let sectionSpacing: CGFloat
  private let cellSpacing: CGFloat
  
  init(
    numberOfItemsPerPage: Int = 1,
    totalNumberOfItems: Int = 1,
    currentPage: Int = 0,
    velocityThreshold: CGFloat = 2.0,
    sectionSpacing: CGFloat = 0.0,
    cellSpacing: CGFloat = 0.0
  ) {
    self.numberOfItemsPerPage = numberOfItemsPerPage
    self.totalNumberOfItems = totalNumberOfItems
    self.currentPage = currentPage
    self.velocityThreshold = velocityThreshold
    self.sectionSpacing = sectionSpacing
    self.cellSpacing = cellSpacing
    super.init()
    
    scrollDirection = .horizontal
    minimumLineSpacing = 0
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepare() {
    super.prepare()
    
    guard let collectionView = collectionView else { return }
    let cellWidth: CGFloat = collectionView.frame.width - (self.sectionSpacing * 2)
    let cellHeight: CGFloat = collectionView.frame.height
    
    itemSize = CGSize(width: cellWidth, height: cellHeight)
    sectionInset = UIEdgeInsets(top: 0, left: self.sectionSpacing, bottom: 0, right: self.sectionSpacing)
    minimumLineSpacing = self.cellSpacing
  }
  
  override func targetContentOffset(
    forProposedContentOffset proposedContentOffset: CGPoint,
    withScrollingVelocity velocity: CGPoint
  ) -> CGPoint {
    guard let collectionView = collectionView else { return proposedContentOffset }
    
    let pageLength: CGFloat
    let approximatePage: CGFloat
    let speed: CGFloat
    
    pageLength = (self.itemSize.width + self.minimumLineSpacing) * CGFloat(self.numberOfItemsPerPage)
    approximatePage = collectionView.contentOffset.x / pageLength
    speed = velocity.x
    
    if speed < 0 {
      self.currentPage = Int(ceil(approximatePage))
    } else if speed > 0 {
      self.currentPage = Int(floor(approximatePage))
    } else {
      self.currentPage = Int(round(approximatePage))
    }
    
    self.currentPage = self.currentPage.clamped(to: 0 ... (self.totalNumberOfItems - 1))
    
    guard speed != 0 else {
      return CGPoint(x: CGFloat(self.currentPage) * pageLength, y: 0)
    }
    
    var nextPage = self.currentPage + (speed > 0 ? 1 : -1)
    
    let increment = speed / self.velocityThreshold
    nextPage += (speed < 0) ? Int(ceil(increment)) : Int(floor(increment))
    
    nextPage = nextPage.clamped(to: 0 ... (self.totalNumberOfItems - 1))
    return CGPoint(x: CGFloat(nextPage) * pageLength, y: 0)
  }
}
