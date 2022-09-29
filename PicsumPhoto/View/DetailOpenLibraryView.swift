//
//  PicsumView.swift
//  BookSelector
//
//  Created by Boris Klykavka on 27.09.2022.
//

import UIKit

class DetailOpenLibraryView: UIView {

    public var detailImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = Colors.backgroundPicSum2
        image.sizeToFit()
        return image
    }()

    private let detailViewTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = Colors.backgroundPicSum2
        lbl.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        return lbl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(detailImageView)
        self.addSubview(detailViewTitle)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    public func setupUI() {
        setConstraints()
    }

    @objc func loadImage() {

    }

    private func setConstraints() {

        detailImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        detailImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        detailImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 60).isActive = true
        detailImageView.heightAnchor.constraint(equalToConstant: 600).isActive = true

        detailViewTitle.trailingAnchor.constraint(equalTo: detailViewTitle.trailingAnchor).isActive = true
        detailViewTitle.leadingAnchor.constraint(equalTo: detailViewTitle.leadingAnchor).isActive = true
        detailViewTitle.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 20).isActive = true
        detailViewTitle.heightAnchor.constraint(equalToConstant: 60).isActive = true

    }
}
