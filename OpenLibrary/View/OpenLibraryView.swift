//
//  OpenLibraryView.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//
import UIKit
import PinLayout

class OpenLibraryView: UIView {

    weak public var delegate: OpenLibraryViewControllerDelegate?

    public var myBookItemView: UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let bookCollectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        bookCollectionView.translatesAutoresizingMaskIntoConstraints = false
        bookCollectionView.backgroundColor = Colors.background1
        bookCollectionView.sizeToFit()
        layout.itemSize = CGSize(width: 100, height: 200)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        bookCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return bookCollectionView
    }()

    private let bookFinderLbl: UILabel = {
        let lblField = UILabel()
        lblField.isUserInteractionEnabled = true
        lblField.translatesAutoresizingMaskIntoConstraints = false
        return lblField
    }()

    public let bookFinderSearchBar: UISearchBar = {
        let txtField = UISearchBar()
        txtField.isUserInteractionEnabled = true
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.backgroundColor = Colors.background2
        txtField.sizeToFit()
        txtField.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        return txtField
    }()

    private let confirmBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = Colors.background2
        btn.setTitleColor(Colors.background4, for: .normal)
        btn.setTitle("Press to show result", for: .normal)
        btn.setTitle("Pressed...", for: .highlighted)
        btn.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        btn.addTarget(self, action: #selector(findBooks), for: .touchDown)
        btn.clipsToBounds = true
        btn.isHighlighted = false
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(bookFinderLbl)
        self.addSubview(bookFinderSearchBar)
        self.addSubview(confirmBtn)
        self.addSubview(myBookItemView)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    public func setupUI() {
        createBookItem()
        setConstraints()
        setTopLabelForSearchScreen(label: bookFinderLbl)
    }

    private func createBookItem() {
        myBookItemView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BookModelCell")
    }

    @objc func findBooks() {
        delegate?.ttttt()
    }

    private func setTopLabelForSearchScreen(label: UILabel) {
        label.backgroundColor = Colors.background3
        label.textAlignment = .center
        label.textColor = Colors.textColor2
        label.shadowColor = Colors.textShadowColor1
        label.shadowOffset = CGSize(width: 2, height: 2)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        label.font = Fonts.font2
        label.sizeToFit()
        label.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        label.text = """
                     Search of Book Title
                     """
    }

    private func setConstraints() {

        bookFinderLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        bookFinderLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        bookFinderLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 60).isActive = true
        bookFinderLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true

        bookFinderSearchBar.trailingAnchor.constraint(equalTo: bookFinderLbl.trailingAnchor).isActive = true
        bookFinderSearchBar.leadingAnchor.constraint(equalTo: bookFinderLbl.leadingAnchor).isActive = true
        bookFinderSearchBar.topAnchor.constraint(equalTo: bookFinderLbl.bottomAnchor, constant: 20).isActive = true
        bookFinderSearchBar.heightAnchor.constraint(equalToConstant: 40).isActive = true

        confirmBtn.trailingAnchor.constraint(equalTo: bookFinderLbl.trailingAnchor).isActive = true
        confirmBtn.leadingAnchor.constraint(equalTo: bookFinderLbl.leadingAnchor).isActive = true
        confirmBtn.topAnchor.constraint(equalTo: bookFinderSearchBar.bottomAnchor, constant: 20).isActive = true
        confirmBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true

        myBookItemView.trailingAnchor.constraint(equalTo: bookFinderLbl.trailingAnchor, constant: -20).isActive = true
        myBookItemView.leadingAnchor.constraint(equalTo: bookFinderLbl.leadingAnchor, constant: 20).isActive = true
        myBookItemView.topAnchor.constraint(equalTo: confirmBtn.bottomAnchor, constant: 20).isActive = true
        myBookItemView.heightAnchor.constraint(equalToConstant: 500).isActive = true

    }
}
