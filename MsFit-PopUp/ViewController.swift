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

        let imageAssets = UIImage(named: "popUpBlur-bg")
        let imageView = UIImageView(image: imageAssets)
        imageView.contentMode = .scaleAspectFill

        view.add(imageView, layoutBlock: {
            $0.leading(0).trailing(0).bottom(0).top(0)
        })

        let blurView = PopUpView(frame: .zero)
        blurView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        view.addSubview(blurView)

        let constraints = blurView.autoLayoutToSuperview()
        NSLayoutConstraint.activate(constraints)

    }
}
