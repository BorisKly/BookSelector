//
//  PicsumView.swift
//  BookSelector
//
//  Created by Boris Klykavka on 27.09.2022.
//

import UIKit

class PicsumView: UIView {
    weak public var delegate: PicsumViewControllerDelegate?

    public var picsumImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = Colors.backgroundPicSum2
        image.sizeToFit()
        return image
    }()

    private let picsumButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = Colors.backgroundPicSum2
        btn.setTitleColor(Colors.background4, for: .normal)
        btn.setTitle("Press to show image", for: .normal)
        btn.setTitle("Pressed...", for: .highlighted)
        btn.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        btn.addTarget(self, action: #selector(loadImage), for: .touchDown)
        btn.clipsToBounds = true
        btn.isHighlighted = false
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(picsumImageView)
        self.addSubview(picsumButton)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    public func setupUI() {
        setConstraints()
    }

    @objc func loadImage() {
        delegate?.ddd()
    }

    private func setConstraints() {

        picsumImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        picsumImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        picsumImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 60).isActive = true
        picsumImageView.heightAnchor.constraint(equalToConstant: 600).isActive = true

        picsumButton.trailingAnchor.constraint(equalTo: picsumImageView.trailingAnchor).isActive = true
        picsumButton.leadingAnchor.constraint(equalTo: picsumImageView.leadingAnchor).isActive = true
        picsumButton.topAnchor.constraint(equalTo: picsumImageView.bottomAnchor, constant: 20).isActive = true
        picsumButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

    }
}
