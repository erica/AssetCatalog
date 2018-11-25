import Foundation

extension AppIconSet {
    
    /// Returns an icon extent as a `CGFloat` for a fixed icon size.
    public static func iconExtent(for size: AppIconSet.Image.IconSize) -> CGFloat {
        switch size {
        case .size16x16: return 16
        case .size20x20: return 20
        case .size24x24: return 24
        case .size275x275: return 27.5
        case .size29x29: return 29
        case .size32x32: return 32
        case .size40x40: return 40
        case .size44x44: return 44
        case .size50x50: return 50
        case .size60x60: return 60
        case .size76x76: return 76
        case .size835x835: return 83.5
        case .size86x86: return 86
        case .size98x98: return 98
        case .size108x108: return 108
        case .size128x128: return 128
        case .size256x256: return 256
        case .size512x512: return 512
        case .size1024x1024: return 1024
        }
    }
    
    /// Returns a `CGFloat` scale multiplier for an icon scale.
    public static func iconMultiplier(for scale: AppIconSet.Image.Scale) -> CGFloat {
        switch scale {
        case .unscaled: return 1
        case .retina: return 2
        case .retinaPlus: return 3
        }
    }
    
    /// Returns the pixel size for `size` points configured at `scale`.
    public static func pixelSize(for scale: AppIconSet.Image.Scale, size: AppIconSet.Image.IconSize) -> CGSize {
        let extent = iconExtent(for: size) * iconMultiplier(for: scale)
        return CGSize(width: extent, height: extent)
    }
    
    /// Returns name modifier for scale.
    public static func nameModifier(for scale: AppIconSet.Image.Scale) -> String {
        switch scale {
        case .unscaled: return ""
        case .retina: return "@2x"
        case .retinaPlus: return "@3x"
        }
    }
    
    /// Returns name modifier for idiom
    public static func idiomModifier(for idiom: AppIconSet.Image.Idiom) -> String {
        switch idiom {
        case .iphone: return ""
        case .ipad: return "~\(idiom.rawValue)"
        default: return ""
        }
    }
}

