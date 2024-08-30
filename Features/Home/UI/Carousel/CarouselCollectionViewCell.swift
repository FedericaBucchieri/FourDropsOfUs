//
//  CarouselCollectionViewCell.swift
//  FourDrops
//
//  Created by Federica Bucchieri on 06/07/24.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
  static let reusableId: String = "CarouselCell"
  let imageView = UIImageView()
  let titleLabel = UILabel()
  let descriptionLabel = UILabel()
  let gradientLayer = CAGradientLayer()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
    self.prepareLayout()
    self.style()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    contentView.addSubview(self.imageView)
    self.imageView.layer.insertSublayer(self.gradientLayer, at: 0)
    contentView.addSubview(self.titleLabel)
    contentView.addSubview(self.descriptionLabel)
    
    self.imageView.translatesAutoresizingMaskIntoConstraints = false
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
    self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func prepareLayout() {
    NSLayoutConstraint.activate([
      self.imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      self.imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      self.imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      self.imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      
      self.descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
      self.descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      self.descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      
      self.titleLabel.bottomAnchor.constraint(equalTo: self.descriptionLabel.topAnchor, constant: -16),
      self.titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      self.titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
    ])
  }
  
  private func style() {
    self.imageView.contentMode = .scaleAspectFill
    self.imageView.clipsToBounds = true
    self.imageView.layer.cornerRadius = 24.0
    
    self.gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.8).cgColor]
    self.gradientLayer.locations = [0, 1]
    
    self.titleLabel.font = UIFont.seasonBold(size: 24)
    self.titleLabel.textColor = .white
    self.titleLabel.numberOfLines = 0
    self.titleLabel.lineBreakMode = .byWordWrapping
    
    self.descriptionLabel.font = UIFont.systemFont(ofSize: 13)
    self.descriptionLabel.textColor = UIColor.customBeige200
    self.descriptionLabel.numberOfLines = 0
    self.descriptionLabel.lineBreakMode = .byWordWrapping
  }
  
  func configure(with model: HomepageCardModel) {
    self.imageView.image = UIImage(named: model.image)
    self.titleLabel.text = model.title
    self.descriptionLabel.text = model.description
    // We want to update the view layout only in the main thread
    DispatchQueue.main.async {
      self.configureGradientFrame()
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.gradientLayer.frame = self.imageView.frame
  }
  
  /// This method needs to be called after the imageView has its dimensions set
  /// `CATransaction` used to disable the gradientLayer animations
  private func configureGradientFrame() {
    CATransaction.begin()
    CATransaction.setDisableActions(true)
    self.gradientLayer.frame = self.imageView.bounds
    CATransaction.commit()
    self.setNeedsLayout()
    self.layoutIfNeeded()
  }
}
