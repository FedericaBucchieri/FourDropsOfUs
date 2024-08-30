//
//  EventListFeature+Reducer.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 26/06/24.
//

import Foundation
import ComposableArchitecture

@Reducer
public struct EventListFeature {
  public init() {}
  
  // MARK: - State
  
  @ObservableState
  public struct State: Equatable {
    @Presents var destination: Destination.State?
    var events: [EventModel]
    
    init(events: [EventModel]) {
      self.events = [EventModel.mock]
      self.destination = nil
    }
  }

  // MARK: - Destination
  
  @Reducer(state: .equatable, action: .equatable)
  public enum Destination {
    case eventPage(EventPageFeature)
  }
  
  // MARK: - Actions
  
  public enum Action: Equatable {
    case destination(PresentationAction<Destination.Action>)
    case didTapOnEvent(EventModel)
  }
  
  // MARK: - Reducer Composition
  
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .didTapOnEvent(let eventModel):
        state.destination = .eventPage(EventPageFeature.State(eventModel: eventModel))
        return .none
        
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
