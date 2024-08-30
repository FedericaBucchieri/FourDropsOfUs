//
//  HomepageCarouselModel.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 06/07/24.
//

import Foundation

enum HomepagePageType: String, Equatable {
  case stories = "Stories"
  case events = "Events"
  case faces = "Faces"
}

struct HomepageCarouselPageModel: Equatable {
  let id: String
  let title: String
  let description: String
  let cover: String
  let tag: HomepagePageType
  
  init(id: String, title: String, description: String, cover: String, tag: HomepagePageType) {
    self.id = id
    self.title = title
    self.description = description
    self.cover = cover
    self.tag = tag
  }
}

struct HomepageCardModel: Equatable {
  let id: String
  let title: String
  let description: String
  let image: String
  
  init(id: String, title: String, description: String, image: String) {
    self.id = id
    self.title = title
    self.description = description
    self.image = image
  }
}

struct HomepageCardCarouselVM: Equatable {
  let cards: [HomepageCardModel]
}


//MARK: - Mocks

extension Array where Element == HomepageCarouselPageModel {
  static var mock: Self {
    [
      .init(
        id: "menstrual_mindfulness",
        title: "Menstrual mindfulness",
        description: "Join us for a very special mindfulness experience tailored towards connecting to the four phases of your menstrual cycle",
        cover: "cover_menstrual_mindfulness",
        tag:.events
      ),
      .init(
        id: "dinner_for_four",
        title: "Dinner for Four",
        description: "For the first @fourdropsofus event, we invite you to Dinner for Four, an intimate dinner through the four phases of the menstrual cycle.",
        cover: "event_cover_dinner_for_four",
        tag: .events
      ),
      .init(
        id: "menstrual_mindfulness_1",
        title: "Menstrual mindfulness",
        description: "Join us for a very special mindfulness experience tailored towards connecting to the four phases of your menstrual cycle",
        cover: "cover_menstrual_mindfulness",
        tag: .events
      ),
    ]
  }
}

extension Array where Element == HomepageCardModel {
  static var mock: Self {
    [
      .init(
        id: "card_1",
        title: "What is the Cervix?",
        description: "The cervix is the lowest part of the uterus, and it connects the vagina to the uterus.",
        image: "card_1"
      ),
      .init(
        id: "card_2",
        title: "Women’s Health Movement",
        description: "The Women’s Health Movement of the 1970s played a pivotal role in transforming the traditional healthcare system.",
        image: "card_2"
      ),
      .init(
        id: "card_3",
        title: "Must Read Books by: \nChris Bobel",
        description: "Curious to learn more about the stigmatization of the menstrual cycle? Here are three must-reads by the brilliant Chris Bobel!",
        image: "card_3"
      )
    ]
  }
}

extension HomepageCardCarouselVM {
  static var mock: Self {
    .init(cards: .mock)
  }
}
