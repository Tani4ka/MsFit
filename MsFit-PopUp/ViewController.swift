//
//  ViewController.swift
//  MsFit-PopUp
//
//  Created by Tetiana Hranchenko on 25.02.2020.
//  Copyright © 2020 Tatyana Granchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     override func viewDidLoad() {
        super.viewDidLoad()

        let imageAssets = UIImage(named: "popUp-bg")
        let imageView = UIImageView(image: imageAssets)
        view.addSubview(imageView)

        let blurView = PopUpView(frame: .zero)
        view.addSubview(blurView)

        let constraints = blurView.autoLayoutToSuperview()
        NSLayoutConstraint.activate(constraints)

            // check list of project fonts
    //        for family in UIFont.familyNames.sorted() {
    //            let names = UIFont.fontNames(forFamilyName: family)
    //            print("Family: \(family) Font names: \(names)")
    //        }

        }

}
