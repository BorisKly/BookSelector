//
//  Sample1View.swift
//  BookSelector
//
//  Created by Boris Klykavka on 02.10.2022.
//

import UIKit
import PinLayout

class SampleOneView: UIView {

    weak public var delegate: SampleOneViewControllerDelegate?

    public var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = Colors.backgroundPicSum2
        image.image = UIImage(named: "noImage")
        return image
    }()

    public let segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["1","2","3"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.backgroundColor = Colors.backgroundPicSum2
        return segment
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(image)
        self.addSubview(segmentedControl)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let padding: CGFloat = 30
        setConstraints(pad: padding)
    }

    // MARK: - Public Methods

    public func setupUI() {
        setSegmentedControl()
    }

    private func setSegmentedControl() {
        segmentedControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
    }

    @objc private func selectedValue(target: UISegmentedControl) {
        if  target == self.segmentedControl {
            let segmentIndex = target.selectedSegmentIndex
            print(segmentIndex)
            delegate?.selectImage(index: segmentIndex)
        }
        }

    private func setConstraints(pad: CGFloat) {

        image.pin
            .top(pin.safeArea)
            .left(pin.safeArea)
            .right(pin.safeArea)
            .height(400)
            .margin(pad)

        segmentedControl.pin.below(of: image, aligned: .center)
            .marginTop(10)
            .width(of: image)
            .height(50)

    }
}
