import UIKit

class AsyncLoadingImageView: UIImageView {
    var currentRequest: NSURLSessionDataTask?

    deinit {
        currentRequest?.cancel()
    }

    func setImageWithURL(url: NSURL) {
        currentRequest?.cancel()

        if let cachedImage = ImageCache.cachedImageForURL(url) {
            self.image = cachedImage
            return
        }

        image = .None

        currentRequest = NSURLSession.fetchDataFromURL(url) { data in
            dispatch_main_async {
                let newImage = UIImage(data: data)
                self.image = newImage
                ImageCache.cacheImage(newImage, forURL: url)
            }
        }

        currentRequest?.resume()
    }
}
