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
        return infoImgView
    }()

    private let infoTitle: UILabel = {
        let label = UILabel()
        label.text = "Warning !"
        label.font = UIFont(name: "Rubik-Bold", size: 13)
        label.textColor = UIColor(named: "appGray")
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()

    private let infoText: UILabel = {
        let label = UILabel()
        label.text = "Please check out your\ninternet connection"
        label.font = UIFont(name: "Rubik-Medium", size: 22)
        label.textColor = UIColor(named: "appBlack")
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = .white
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.23
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

//        self.addSubview(infoView)
//        infoView.translatesAutoresizingMaskIntoConstraints = false
//        infoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 152).isActive = true
//        infoView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
//        infoView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -163).isActive = true
//        infoView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true

        add(infoView, layoutBlock: {$0.top(152).leading(16).bottom(163).trailing(16) })

        infoView.addSubview(infoImg)
        infoImg.translatesAutoresizingMaskIntoConstraints = false
        infoImg.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 60).isActive = true
        infoImg.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
//        infoImg.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width > 312 ? 115 : UIScreen.main.bounds.width > 250 ? 130 : 120 ).isActive = true
        infoImg.widthAnchor.constraint(equalToConstant: 115).isActive = true
        infoImg.heightAnchor.constraint(equalToConstant: 92).isActive = true

        infoView.addSubview(infoTitle)
        infoTitle.translatesAutoresizingMaskIntoConstraints = false
        infoTitle.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        infoTitle.centerYAnchor.constraint(equalTo: infoView.centerYAnchor).isActive = true
        infoTitle.widthAnchor.constraint(equalToConstant: 76).isActive = true
        infoTitle.heightAnchor.constraint(equalToConstant: 22).isActive = true

        infoView.addSubview(infoText)
        infoText.translatesAutoresizingMaskIntoConstraints = false
        infoText.widthAnchor.constraint(equalToConstant: 233).isActive = true
//        infoText.heightAnchor.constraint(equalToConstant: 64).isActive = true
        infoText.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        infoText.topAnchor.constraint(equalTo: infoTitle.bottomAnchor, constant: 0).isActive = true

        infoView.addSubview(popUpButton)
        popUpButton.translatesAutoresizingMaskIntoConstraints = false
        popUpButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
        popUpButton.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 0).isActive = true
        popUpButton.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: 0).isActive = true
        popUpButton.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 0).isActive = true
    }

    override init(frame: CGRect) {
       super.init(frame: frame)
        addBlurView()
        addInfoView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

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

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
