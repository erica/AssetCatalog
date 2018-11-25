import Foundation

public struct ImageSet: Codable {
    public static let catalogExtension = "imageset"
    public static let permittedContentExtensions = ["avci", "heic", "heif", "png", "jpg", "pdf"]
    
    public struct Image: Codable {
        /// The color space for the image.
        /// If not included, the image uses the standard sRGB color space.
        /// Encode as "color-space"
        public enum ColorSpace: String, Codable {
            /// The image uses the standard sRGB color space.
            case srgb
            
            /// The image uses a wide gamut color space
            case displayP3 = "display-p3"
        }
        
        /// The type of compression used for the item.
        /// If not included, the compression type inherits from the parent.
        /// The type is set to lossless compression if there is no parent.
        /// Encode as "compression-type".
        public enum CompressionType: String, Codable {
            
            /// The compression type inherits from the parent.
            /// The type is set to lossless compression if there is no parent.
            case automatic
            
            /// The image uses a lossy GPU compression format optimized for quality.
            case gpuOptimizedBest = "gpu-optimized-best"
            
            /// The image uses a lossy GPU compression format optimized for memory size.
            case gpuOptimizedSmallest = "gpu-optimized-smallest"
            
            /// The image uses lossless compression.
            /// This is the default if the compresson-type tag is not included.
            case lossless
            
            /// The image uses basic lossy compression.
            case lossy
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
        
        /// The graphics feature set required for the item.
        /// The values correspond to values in the MTLFeatureSet enumerated type.
        /// The keys are based on the iOS types. tvOS uses the GPU and OS revision level equivalent keys.
        /// For example, metal2v3 corresponds to MTLFeatureSet_iOS_GPUFamily2_v3 on iOS and
        /// to MTLFeatureSet_tvOS_GPUFamily1_v2 on tvOS.
        /// If not included, the item works with any device that has at least OpenGL ES 2.0.
        /// Encode as "graphics-feature-set".
        public enum GraphicsFeatureSet: String, Codable {
            /// The item requires features in MTLFeatureSet_iOS_GPUFamily1_v2.
            case metal1v2
            
            /// The item features in MTLFeatureSet_iOS_GPUFamily1_v3.
            case metal1v3
            
            /// The item requires features in MTLFeatureSet_iOS_GPUFamily2_v2 and MTLFeatureSet_tvOS_GPUFamily1_v1.
            case metal2v2
            
            /// The item requires features in MTLFeatureSet_iOS_GPUFamily2_v3 and MTLFeatureSet_tvOS_GPUFamily1_v2.
            case metal2v3
            
            /// The item requires features in MTLFeatureSet_iOS_GPUFamily3_v1.
            case metal3v1
            
            /// The item requires features in MTLFeatureSet_iOS_GPUFamily3_v2.
            case metal3v2
            
            /// The item requires features in iOS_GPUFamily4_v1.
            case metal4v1
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
        
        /// The horizontal display direction of the image for left-to-right and right-to-left languages.
        /// If not included, the image has a fixed horizontal orientation and will display in the same direction.
        /// Encode as "language-direction".
        public enum LanguageDirection: String, Codable {
            /// The image is used for display in left-to-right languages.
            /// The image is mirrored in right-to-left languages unless a right-to-left version of the image is provided.
            case leftToRight = "left-to-right"
            
            /// The image is used for display in right-to-left languages.
            /// The image is mirrored in left-to-right languages unless a left-to-right version of the image is provided.
            case rightToLeft = "right-to-left"
        }
        
        /// The minimum device memory configuration required by the data item.
        /// If not included, the data item works on any device.
        /// Encode as "memory"
        public enum Memory: String, Codable {
            /// The device needs at least a 1GB memory configuration.
            case oneGB = "1GB"
            
            /// The device needs at least a 2GB memory configuration.
            case twoGB = "2GB"
            
            /// The device needs at least a 3GB memory configuration.
            case threeGB = "3GB"
            
            /// The device needs at least a 4GB memory configuration.
            case fourGB = "4GB"
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
        
        /// The screen width for the Apple Watch.
        /// If not included, the image is for any Apple Watch screen.
        /// Encode as "screen-width"
        public enum ScreenWidth: String, Codable {
            /// Screen width for the 38mm, 40mm Apple Watch screen.
            case small = "<=145"
            
            /// Screen width for the 42mm, 44mm Apple Watch screen.
            case notSmall = ">145"
        }
        
        /// Indicates if the image is a renderable image or is a template for.
        /// If not included and the name of the image ends in "Template", use the
        /// image as a template, otherwise render it as the original image.
        /// Encode as "template-rendering-intent
        public enum TemplateRenderingIntent: String, Codable {
            /// Render as the original image.
            case original
            
            /// Use the image as a template for visual effects such as replacing colors.
            case template
        }
        
        /// The size class for the image width.
        /// If not included, the image width is for the `any` size class.
        /// Encode as "width-class"
        public enum WidthClass: String, Codable {
            /// The image width is for the `compact` size class.
            case compact
            
            /// The image width is for the `regular` size class.
            case regular
        }
        
        /// The size class for the image height.
        /// If not included, the image height is for the `any` size class.
        /// Encode as "height-class"
        public enum HeightClass: String, Codable {
            /// The image height is for the `compact` size class.
            case compact
            
            /// The image height is for the `regular` size class.
            case regular
        }
        
        /// The insets for alignmentRectInsets in UIImage or for alignmentRect in NSImage.
        /// The inset tag can be omitted.
        /// Encode as "alignment-insets"
        public struct AlignmentInsets: Codable {
            /// The mode for a sliced resizable image.
            /// If not included, the entire image is resized.
            public enum ResizingMode: String, Codable {
                /// The image is divided into three horizontal parts.
                /// The outer portions are fixed-width.
                /// The central portion resizes in the horizontal dimension.
                case threePartHorizontal = "3-part-horizontal"
                
                /// The image is divided into three vertical parts.
                /// The outer portions are fixed-height.
                /// The central portion resizes in the vertical dimension.
                case threePartVertical = "3-part-vertical"
                
                /// The image is divided into nine parts.
                /// There is a central area that resizes in the horizontal and vertical dimensions,
                /// fixed-width vertical caps at the left and right of the central area,
                /// fixed-height caps at the top and bottom of the central area, and
                /// four fixed-size corner parts.
                case ninePart = "9-part"
            }
            
            /// The resizing mode of the central area of a resizing image.
            /// If not included, there is no default behavior specified.
            public enum CenterMode: String, Codable {
                /// The central area is tiled to fill the available size.
                case tile
                
                /// The central area is stretched to fill the available size.
                case stretch
            }
            
            
            /// The inset from the edges of the image to the resizable area.
            /// Encode as "cap-insets"
            public struct CapInsets: Codable {
                /// The height in pixels of the non-resizable slice on the top of the image.
                public let top: Double
                /// The height in pixels of the non-resizable slice on the bottom of the image.
                public let bottom: Double
                /// The width in pixels of the non-resizable slice on the left of the image.
                public let left: Double
                /// The width in pixels of the non-resizable slice on the right of the image.
                public let right: Double
            }
            
            /// Used for resizing the image
            public struct Center: Codable {
                
                /// The center resizing mode for the image
                public let mode: ImageSet.Image.AlignmentInsets.CenterMode
                
                /// The width in pixels of the rectangle for the resizable area of the image.
                /// Only valid for modes of 3-part-horizontal and 9-part.
                public let width: Double? = nil
                
                /// The height in pixels of the rectangle for the resizable area of the image.
                /// Only valid for modes of 3-part-vertical and 9-part.
                public let height: Double? = nil
            }
            
            /// The attributes for a resizable image.
            /// Only included with resizable images.
            public struct Resizing: Codable {

                /// The mode for a sliced resizable image.
                /// If not included, the entire image is resized.
                public let mode: ImageSet.Image.AlignmentInsets.ResizingMode

                /// The center resizing for the image
                public let center: Center
                
                /// The inset from the edges of the image to the resizable area.
                public let capInsets: CapInsets
                
                public enum CodingKeys: String, CodingKey {
                    case mode
                    case center
                    case capInsets = "cap-insets"
                }
            }
            
            /// The top inset in pixels.
            public let top: Double
            
            /// The bottom inset in pixels.
            public let bottom: Double
            
            /// The left inset in pixels.
            public let left: Double
            
            /// The right inset in pixels.
            public let right: Double
            
            /// The attributes for a resizable image.
            /// Only included with resizable images.
            public let resizing: ImageSet.Image.AlignmentInsets.Resizing?
        }

        /// The HEIF, .png, .jpg, or .pdf file for the image.
        public let filename: String
        
        /// The device type for the image.
        public var idiom: ImageSet.Image.Idiom = .universal
        
        /// The color space for the item
        public var colorSpace: ImageSet.Image.ColorSpace? = nil
        
        /// The compression used on the item.
        public var compressionType: ImageSet.Image.CompressionType? = nil
        
        /// The color gamut of the device display.
        public var displayGamut: ImageSet.Image.DisplayGamut? = nil
        
        /// The graphics features required for the image.
        public var graphicsFeatureSet: ImageSet.Image.GraphicsFeatureSet? = nil
        
        /// The horizontal display direction for the image.
        public var languageDirection: ImageSet.Image.LanguageDirection? = nil
        
        /// The memory required by the data item.
        public var memory: ImageSet.Image.Memory? = nil
        
        /// The scale of the image.
        public var scale: ImageSet.Image.Scale? = nil
        
        /// The Apple Watch screen width for the image.
        public var screenWidth: ImageSet.Image.ScreenWidth? = nil
        
        /// Specifies if the image is a template for use with visual effects such as replacing colors.
        public var templateRenderingIntent: ImageSet.Image.TemplateRenderingIntent? = nil
        
        /// The size class for the width of the image.
        public var widthClass: ImageSet.Image.WidthClass? = nil

        /// The size class for the height of the image.
        public var heightClass: ImageSet.Image.HeightClass? = nil
        
        /// The insets for alignmentRectInsets in UIImage or for alignmentRect in NSImage.
        public var alignmentInsets: ImageSet.Image.AlignmentInsets? = nil
        
        public enum CodingKeys: String, CodingKey {
            
            /// The file name of the image within the image set
            case filename
            
            /// The idiom of the destination device
            case idiom
            
            /// The image's color space
            case colorSpace = "color-space"
            
            /// The image's compression scheme
            case compressionType = "compression-type"
            
            /// The image's display gamut
            case displayGamut = "display-gamut"
            
            /// The image's required feature set
            case graphicsFeatureSet = "graphics-feature-set"
            
            /// Should the image be flipped for RTL languages
            case languageDirection = "language-direction"
            
            /// The image's memory requirements
            case memory
            
            /// The image's scale
            case scale
            
            /// The image's target screen width (for watch)
            case screenWidth = "screen-width"
            
            /// The image's width class (compact or regular)
            case widthClass = "width-class"
            
            /// The image's height class (compact or regular)
            case heightClass = "height-class"
            
            /// The image's alignment insets
            case alignmentInsets = "alignment-insets"
        }
        
        public init(filename: String) {
            self.filename = filename
        }
    }
    
    /// Properties for the image set.
    public struct Properties: Codable {
        /// The on-demand resource tags for the image set.
        public var onDemandResourceTags: [String] = []
        
        /// Set to true to preserve the vector information for a PDF file.
        public var preservesVectorRepresentation = true
        
        public enum CodingKeys: String, CodingKey {
            case onDemandResourceTags = "on-demand-resource-tags"
            case preservesVectorRepresentation = "preserves-vector-representation"
        }
    }

    /// The contents file for an image set
    public struct Contents: Codable {
        
        /// The standard authorship information
        public let info = Info()
        
        /// A set of images to declare in the contents along with
        /// the image features
        public let images: [ImageSet.Image]
        
        /// Optional properties associated with the image set, including
        /// vector representation preservation and on-demand resources.
        public var properties: Properties? = nil
        
        public init(singleUniversal name: String) {
            let image = ImageSet.Image(filename: "\(name).png")
            images = [image]
        }
    }
}
