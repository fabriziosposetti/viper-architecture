//
//  KingFisherHelper.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 18/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import Foundation
import Kingfisher


class KingFisherHelper {
    
    static func setImageFrom(url: String?, in imageView: UIImageView, withPlaceholder placeholder: UIImage) {
        guard let url = URL(string: url ?? "") else {
            imageView.image = placeholder
            return
        }
        let urlResource = url
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: urlResource,
            placeholder: placeholder,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
    
}
