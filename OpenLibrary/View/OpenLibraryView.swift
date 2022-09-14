//
//  OpenLibraryView.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//
import UIKit

class OpenLibraryView: UIView {

    public var myBookCellView: UICollectionView = {
        let bookCell = UICollectionView()
        bookCell.translatesAutoresizingMaskIntoConstraints = false
        bookCell.backgroundColor = Colors.background1
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 250, height: 250)
        bookCell.collectionViewLayout = flowLayout
       // bookCell.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return bookCell
    }()



    private let bookFinderLbl: UILabel = {
        let lblField = UILabel()
        lblField.isUserInteractionEnabled = true
        lblField.translatesAutoresizingMaskIntoConstraints = false
        lblField.backgroundColor = Colors.background1
        lblField.textAlignment = .center
        lblField.numberOfLines = 0
        lblField.sizeToFit()
      //  lblField.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        lblField.text = """
                        Some Label
                        """
        return lblField
    }()

    private let bookFinderTxt: UITextField = {
        let txtField = UITextField()
        txtField.isUserInteractionEnabled = true
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.backgroundColor = Colors.background1
        txtField.textAlignment = .center
        txtField.sizeToFit()
      //  lblField.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        txtField.text = """
                        enter text
                        """
        return txtField
    }()

    private let confirmBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = Colors.background2
        btn.setTitleColor(Colors.background4, for: .normal)
        btn.setTitle("Press to find book", for: .normal)
        btn.setTitle("Pressed...", for: .highlighted)
       // btn.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
       // btn.addTarget(self, action: #selector(showDatePicker), for: .touchDown)
        btn.clipsToBounds = true
        btn.isHighlighted = false
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(bookFinderLbl)
        self.addSubview(bookFinderTxt)
        self.addSubview(confirmBtn)
        self.addSubview(myBookCellView)
        //self.isUserInteractionEnabled = true

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    public func setupUI() {
       // createBookCell()
        setConstraints()
    }

    private func createBookCell() {
        myBookCellView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BookModelCell")
    }

    private func setConstraints() {

        bookFinderLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        bookFinderLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        bookFinderLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 60).isActive = true
        bookFinderLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true

        bookFinderTxt.trailingAnchor.constraint(equalTo: bookFinderLbl.trailingAnchor).isActive = true
        bookFinderTxt.leadingAnchor.constraint(equalTo: bookFinderLbl.leadingAnchor).isActive = true
        bookFinderTxt.topAnchor.constraint(equalTo: bookFinderLbl.bottomAnchor, constant: 20).isActive = true
        bookFinderTxt.heightAnchor.constraint(equalToConstant: 40).isActive = true

        confirmBtn.trailingAnchor.constraint(equalTo: bookFinderLbl.trailingAnchor).isActive = true
        confirmBtn.leadingAnchor.constraint(equalTo: bookFinderLbl.leadingAnchor).isActive = true
        confirmBtn.topAnchor.constraint(equalTo: bookFinderTxt.bottomAnchor, constant: 20).isActive = true
        confirmBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true

        myBookCellView.trailingAnchor.constraint(equalTo: bookFinderLbl.trailingAnchor, constant: -20).isActive = true
        myBookCellView.leadingAnchor.constraint(equalTo: bookFinderLbl.leadingAnchor, constant: 20).isActive = true
        myBookCellView.topAnchor.constraint(equalTo: confirmBtn.bottomAnchor, constant: 20).isActive = true
        myBookCellView.heightAnchor.constraint(equalToConstant: 250).isActive = true


    }

}
