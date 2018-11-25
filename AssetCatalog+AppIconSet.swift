import Foundation

public struct AppIconSet: Codable {
    public static let catalogExtension = "appiconset"
    public static let permittedContentExtensions = ["png"]
    
    public struct Image: Codable {
        
        /// The size of the app icon in points.
        public enum IconSize: String, Codable {
            /// An OS X icon.
            case size16x16 = "16x16"

            /// An iPhone or iPad notification icon.
            case size20x20 = "20x20"
            
            /// A 38mm/40mm Apple Watch notification center icon.
            case size24x24 = "24x24"
            
            /// A 42mm/44mm Apple Watch notification center icon.
            case size275x275 = "27.5x27.5"
            
            /// An iPhone or iPad settings icon for iOS 7 or later.
            /// An Apple Watch companion settings icon.
            case size29x29 = "29x29"
            
            /// An OS X icon.
            case size32x32 = "32x32"
            
            /// An iPhone or iPad Spotlight search results icon on iOS 7 or later.
            /// The main Apple Watch app icon.
            case size40x40 = "40x40"
            
            /// An Apple Watch long-look notification icon.
            case size44x44 = "44x44"
            
            /// An Apple Watch long-look notification icon.
            case size50x50 = "50x50"

            /// The main iPhone app icon for iOS 7 or later.
            case size60x60 = "60x60"
            
            /// The main iPad app icon for iOS 7 or later.
            case size76x76 = "76x76"
            
            /// The main iPad Pro app icon.
            case size835x835 = "83.5x83.5"
            
            /// A 38mm Apple Watch short-look notification icon.
            case size86x86 = "86x86"
            
            /// A 40mm/42mm Apple Watch short-look notification icon.
            case size98x98 = "98x98"
            
            /// A 44mm Apple Watch short-look notification icon.
            case size108x108 = "108x108"

            /// An OS X icon.
            case size128x128 = "128x128"
            
            /// An OS X icon.
            case size256x256 = "256x256"

            /// An OS X icon.
            case size512x512 = "512x512"

            /// The App Store icon.
            case size1024x1024 = "1024x1024"
        }
        
        /// The targeted display scale for the image
        /// If not included, the image is for any display scale and should point to a .pdf file.
        /// Encode as "scale"
        public enum Scale: String, Codable { // "screen-width, kebab case
            
            /// Targeted for unscaled displays.
            case unscaled = "1x"
            
            /// Targeted for Retina displays.
            case retina = "2x"
            
            /// Targeted for Retina displays with higher density such as those on the iPhone 6 Plus.
            case retinaPlus = "3x"
        }
        
        /// The device family.
        /// Encode as "idiom"
        public enum Idiom: String, Codable {
            /// The image works on any device and platform.
            case universal
            
            /// The image is for iPhone devices.
            case iphone
            
            /// The image is for iPad devices.
            case ipad
            
            /// The image is for Mac computers.
            case mac
            
            /// The image is for Apple TV.
            case tv
            
            /// The image is for the Apple Watch devices.
            case watch
            
            /// An image shown app launcher on watchOS
            case appLauncher
            
            /// An image for the Apple Watch Settings app
            case companionSettings
            
            /// An image for the notification center on watchOS.
            case notificationCenter
            
            /// An image used for a long look on watchOS.
            case quickLook
            
            /// An image for the App Store icon
            case iosMarketing = "ios-marketing"
            
            /// An image for the App Store icon.
            case watchMarketing = "watch-marketing"
        }

        /// The color gamut for the device display.
        /// If not included, the image uses the standard sRGB color space.
        /// Encode as "display-gamut".
        public enum DisplayGamut: String, Codable {
            /// The image uses the standard sRGB color space.
            case srgb
            
            /// The image uses a wide gamut color space
            case displayP3 = "display-p3"
        }
        
        /// The role for an Apple Watch icon.
        /// If not included, the icon is not for Apple Watch.
        public enum Role: String, Codable {
            /// The icon is used in the notification center.
            case notificationCenter
            
            /// The icon is used in settings.
            case companionSettings

            /// The icon is used in the app launcher.
            case appLauncher

            /// The icon is used for a long-look notification.
            case longLook
            
            /// The icon is used for a short-look notification.
            case quickLook
            
            /// For internal use only, to allow creation of iTunes marketing icon
            case itunes
        }
        
        /// The type of matching for the system to use to find the referenced file.
        /// The only valid value is fully-qualified-name.
        public enum MatchingStyle: String, Codable {
            /// The type of matching for the system to use to find the referenced file.
            /// The only valid value is fully-qualified-name.
            case fullyQualifiedName = "fully-qualified-name"
        }
        
        // Subtype used for watch-model specific assets
        public enum Subtype: String, Codable {
            /// A 38mm watch
            case watch38 = "38mm"
            
            /// A 40mm watch
            case watch40 = "40mm"
            
            /// A 42mm watch
            case watch42 = "42mm"
            
            /// A 44mm watch
            case watch44 = "44mm"
            
            /// For internal use only, to allow creation of iTunes marketing icon
            case itunes = ""
        }
        
        /// Name of the file in the app icon set
        public let filename: String
        
        /// The icon's optional display gamut
        public var displayGamut: AppIconSet.Image.DisplayGamut? = nil
        
        /// The icon's optional idiom, typically iphone, ipad, or watch
        public var idiom: AppIconSet.Image.Idiom = .universal
        
        /// The icon's size
        public var size: AppIconSet.Image.IconSize? = nil
        
        /// The icon's scale (unscaled, retina, retina plus)
        public var scale: AppIconSet.Image.Scale? = nil
        
        /// The icon's subtype (for watch)
        public var subtype: AppIconSet.Image.Subtype? = nil
        
        /// The icon's role (for watch)
        public var role: AppIconSet.Image.Role? = nil
        
        /// The icon's matching style (only for fully qualified names)
        public var matchingStyle: AppIconSet.Image.MatchingStyle? = nil
        
        public enum CodingKeys: String, CodingKey {
            case filename
            case idiom
            case size
            case scale
            case subtype
            case role
            case displayGamut = "display-gamut"
            case matchingStyle = "matching-style"
        }
        
        public init(filename: String) {
            self.filename = filename
        }
    }   
    
    /// Properties associated with the app icon.
    public struct Properties: Codable {
        /// Backward compatibility for iOS 6.0 indicating if the icon includes the mask and shine effect.
        public var preRendered = false
        
        public enum CodingKeys: String, CodingKey {
            case preRendered = "pre-rendered"
        }
    }

    /// The contents of an app icon set
    public struct Contents: Codable {
        
        /// Authorship information, normally Xcode, here AssetCatalog
        public let info = Info()
        
        /// The list of images and image qualities to be included in these contents
        public let images: [AppIconSet.Image]
        
        /// Optional properties. Specifically iOS 6 backward compatibility for pre-rendered icons.
        public var properties: Properties? = nil
        
        public init(images: [Image]) {
            self.images = images
        }
    }
}

