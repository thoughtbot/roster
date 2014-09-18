import UIKit.UIImage

class ImageCache: NSCache {
    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("didRecieveMemoryWarning"), name: UIApplicationDidReceiveMemoryWarningNotification, object: .None)
        name = "RosterImageCache"
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    func didRecieveMemoryWarning() {
        removeAllObjects()
    }

    class func cachedImageForURL(url: NSURL) -> UIImage? {
        if let key = url.absoluteString {
            return sharedCache.objectForKey(key) as? UIImage
        }

        return .None
    }

    class func cacheImage(image: UIImage, forURL url: NSURL) {
        if let key = url.absoluteString {
            sharedCache.setObject(image, forKey: key)
        }
    }
}

private let _sharedInstance = ImageCache()

private extension ImageCache {
    class var sharedCache: ImageCache {
        return _sharedInstance
    }
}
