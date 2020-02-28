//
//  PopUpView.swift
//  MsFit-PopUp
//
//  Created by Tetiana Hranchenko on 25.02.2020.
//  Copyright © 2020 Tatyana Granchenko. All rights reserved.
//

import UIKit

class PopUpView: UIView {

    private var infoImg: UIImageView = {
        let infoImg = UIImage(named: "popUpInfo_img")
        let infoImgView = UIImageView(image: infoImg)
//        infoImgView.isHidden = true  // for ok popUp screen
        return infoImgView
    }()

    private let infoTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik-Bold", size: 13)
        label.textColor = UIColor(named: "appGray")
        label.backgroundColor = .white
        label.textAlignment = .center

        label.attributedText = NSMutableAttributedString(string: "Warning !", attributes: [NSAttributedString.Key.kern: 2])
        return label
    }()

    private let infoText: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Rubik-Medium", size: 22)
        label.textColor = UIColor(named: "appBlack")
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .white
//        var paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineHeightMultiple = 2
        let attributedString = NSMutableAttributedString(string: "Please check out your\ninternet connection")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle,
                                      range: NSRange(location: 0, length: attributedString.length))
        label.attributedText = attributedString
        label.textAlignment = .center
        return label
    }()

    private var popUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "appPink")
        button.setTitle("Settings", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik-Bold", size: 20)
        return button
    }()

    // addBlurView()
    func addBlurView() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.5
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }

    // addInfoView()
    func addInfoView() {
        let infoView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        infoView.backgroundColor = UIColor.white
        infoView.layer.cornerRadius = 10
        infoView.clipsToBounds = true

//        add(infoView, layoutBlock: {
//            $0.top(Constants.sHeightMore812 ? 205 : 152).leading(16)
//                .bottom(Constants.sHeightMore812 ? 200 : 147).trailing(16) })

        add(infoView, layoutBlock: {
            $0.leading(16).trailing(16).centerY() })

//        infoView.addSubview(infoImg)
//        infoImg.translatesAutoresizingMaskIntoConstraints = false
//        infoImg.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 60).isActive = true
//        infoImg.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
//        infoImg.widthAnchor.constraint(equalToConstant: 115).isActive = true
//        infoImg.heightAnchor.constraint(equalToConstant: 92).isActive = true
//
//        infoView.addSubview(infoTitle)
//        infoTitle.translatesAutoresizingMaskIntoConstraints = false
//        infoTitle.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
//        infoTitle.centerYAnchor.constraint(equalTo: infoView.centerYAnchor).isActive = true
//        infoTitle.heightAnchor.constraint(equalToConstant: 32).isActive = true
//
//        infoView.addSubview(infoText)
//        infoText.translatesAutoresizingMaskIntoConstraints = false
//        infoText.widthAnchor.constraint(equalToConstant: 233).isActive = true
//        infoText.heightAnchor.constraint(equalToConstant: 64).isActive = true
//        infoText.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
//        infoText.topAnchor.constraint(equalTo: infoTitle.bottomAnchor, constant: 0).isActive = true

        // Add popUpButton
        infoView.addSubview(popUpButton)
        popUpButton.translatesAutoresizingMaskIntoConstraints = false
        popUpButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
        popUpButton.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 0).isActive = true
        popUpButton.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: 0).isActive = true
        popUpButton.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 0).isActive = true

        // stackViewText
        let stackViewText = UIStackView()
        stackViewText.axis = NSLayoutConstraint.Axis.vertical
        stackViewText.distribution = UIStackView.Distribution.equalSpacing
        stackViewText.alignment = UIStackView.Alignment.center
        stackViewText.spacing = 10
//        stackViewText.spacing = 27 // for ok popUp screen

        stackViewText.addArrangedSubview(infoTitle)
        stackViewText.addArrangedSubview(infoText)
        stackViewText.translatesAutoresizingMaskIntoConstraints = false

        // Stack View
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 35

        stackView.addArrangedSubview(infoImg)
        stackView.addArrangedSubview(stackViewText)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        infoView.add(stackView, layoutBlock: {
           $0.leading().trailing().bottomTop(-32, to: popUpButton).top(60)
       })
        stackView.add(stackViewText, layoutBlock: {
            $0.leading().trailing()
        })
        stackViewText.add(infoText, layoutBlock: {
            $0.leading().trailing()
        })
    }

    override init(frame: CGRect) {
       super.init(frame: frame)
        addBlurView()
        addInfoView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // autoLayoutToSuperview for blurView
    func autoLayoutToSuperview(_ attributes: [NSLayoutConstraint.Attribute] = [.left, .right, .top, .bottom], inset: CGFloat = 0) -> [NSLayoutConstraint] {

        var constraints: [NSLayoutConstraint] = []
        translatesAutoresizingMaskIntoConstraints = false

        for attribute in attributes {
            var constant = inset
            switch attribute {
            case .right:
                constant = -inset
            case .bottom:
                constant = -inset
            default:
                break
            }

            let constraint = NSLayoutConstraint(
                item: self,
                attribute: attribute,
                relatedBy: .equal,
                toItem: self.superview,
                attribute: attribute,
                multiplier: 1,
                constant: constant
            )
            self.superview?.addConstraint(constraint)
            constraints.append(constraint)
        }
        return constraints
    }

}
