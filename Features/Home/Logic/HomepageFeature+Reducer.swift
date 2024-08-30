//
//  HomepageFeature+Reducer.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 06/07/24.
//

import Foundation
import ComposableArchitecture

@Reducer
public struct HomepageFeature {
  public init() {}
  
  // MARK: - State
  
  @ObservableState
  public struct State: Equatable {
    @Presents var destination: Destination.State?
    var carouselPages: [HomepageCarouselPageModel]
    var storiesCardVM: HomepageCardCarouselVM
    
    init() {
      self.carouselPages = .mock
      self.storiesCardVM = .mock
      self.destination = nil
    }
  }
  
  // MARK: - Destination
  
  @Reducer(state: .equatable, action: .equatable)
  public enum Destination {
  }
  
  // MARK: - Actions
  
  public enum Action: Equatable {
    case destination(PresentationAction<Destination.Action>)
  }
  
  // MARK: - Reducer Composition
  
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .destination(.dismiss):
        state.destination = nil
        return .none
        
      case .destination:
        return .none
      }
    }
    .ifLet(\.$destination, action: \.destination)
  }
}
