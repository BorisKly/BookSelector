//
//  PicsumView.swift
//  BookSelector
//
//  Created by Boris Klykavka on 27.09.2022.
//

import UIKit
import PinLayout

class DetailOpenLibraryView: UIView {

    // MARK: -
    // MARK: Properties

    public var detailImageView: UIImageView = {
        let image = UIImageView()
       // image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = Colors.backgroundPicSum2
        image.sizeToFit()
        return image
    }()

    public let detailViewTitle: UILabel = {
        let lbl = UILabel()
       // lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.backgroundColor = Colors.backgroundPicSum2
        lbl.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        return lbl
    }()

    // MARK: -
    // MARK: Init and Deinit

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(detailImageView)
        self.addSubview(detailViewTitle)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: -
    // MARK: Override Methods

    override func layoutSubviews() {
        super.layoutSubviews()
        let padding: CGFloat = 20
        setConstraints(pad: padding)
    }

    // MARK: -
    // MARK: Public Methods

    public func setupUI() {
    }

    // MARK: -
    // MARK: Private Methods

    private func setConstraints(pad: CGFloat) {

        detailImageView.pin.top(pin.safeArea)
            .left(pin.safeArea)
            .right(pin.safeArea)
            .height(600)
            .margin(pad)

        detailViewTitle.pin
            .below(of: detailImageView, aligned: .left)
            .width(of: detailImageView)
            .marginTop(pad)
            .sizeToFit(.width)

    }
}
