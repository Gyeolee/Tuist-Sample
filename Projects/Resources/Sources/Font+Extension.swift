//
//  Font+Extension.swift
//  Resources
//
//  Created by Hangyeol on 2023/07/14.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI

public extension Font {
    init(uiFont: UIFont) {
        self = Font(uiFont as CTFont)
    }
    
    // MARK: SwiftUI Font

    static func pretendardBlack(size: CGFloat) -> Font {
        return Font(ResourcesFontFamily.Pretendard.black.font(size: size))
    }

    static func pretendardBold(size: CGFloat) -> Font {
        return Font(ResourcesFontFamily.Pretendard.bold.font(size: size))
    }

    static func pretendardExtraBold(size: CGFloat) -> Font {
        return Font(ResourcesFontFamily.Pretendard.extraBold.font(size: size))
    }

    static func pretendardExtraLight(size: CGFloat) -> Font {
        return Font(ResourcesFontFamily.Pretendard.extraLight.font(size: size))
    }

    static func pretendardLight(size: CGFloat) -> Font {
        return Font(ResourcesFontFamily.Pretendard.light.font(size: size))
    }

    static func pretendardMedium(size: CGFloat) -> Font {
        return Font(ResourcesFontFamily.Pretendard.medium.font(size: size))
    }

    static func pretendardRegular(size: CGFloat) -> Font {
        return Font(ResourcesFontFamily.Pretendard.regular.font(size: size))
    }

    static func pretendardSemiBold(size: CGFloat) -> Font {
        return Font(ResourcesFontFamily.Pretendard.semiBold.font(size: size))
    }

    static func pretendardThin(size: CGFloat) -> Font {
        return Font(ResourcesFontFamily.Pretendard.thin.font(size: size))
    }

    // MARK: UIFont

    static func pretendardBlack(size: CGFloat) -> UIFont {
        return ResourcesFontFamily.Pretendard.black.font(size: size)
    }

    static func pretendardBold(size: CGFloat) -> UIFont {
        return ResourcesFontFamily.Pretendard.bold.font(size: size)
    }

    static func pretendardExtraBold(size: CGFloat) -> UIFont {
        return ResourcesFontFamily.Pretendard.extraBold.font(size: size)
    }

    static func pretendardExtraLight(size: CGFloat) -> UIFont {
        return ResourcesFontFamily.Pretendard.extraLight.font(size: size)
    }

    static func pretendardLight(size: CGFloat) -> UIFont {
        return ResourcesFontFamily.Pretendard.light.font(size: size)
    }

    static func pretendardMedium(size: CGFloat) -> UIFont {
        return ResourcesFontFamily.Pretendard.medium.font(size: size)
    }

    static func pretendardRegular(size: CGFloat) -> UIFont {
        return ResourcesFontFamily.Pretendard.regular.font(size: size)
    }

    static func pretendardSemiBold(size: CGFloat) -> UIFont {
        return ResourcesFontFamily.Pretendard.semiBold.font(size: size)
    }

    static func pretendardThin(size: CGFloat) -> UIFont {
        return ResourcesFontFamily.Pretendard.thin.font(size: size)
    }
}
