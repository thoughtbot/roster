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
            let newImage: UIImage? = UIImage(data: data)

            if let returnedImage = newImage {
                dispatch_main_async {
                    self.image = returnedImage
                    ImageCache.cacheImage(returnedImage, forURL: url)
                }
            }
        }

        currentRequest?.resume()
    }
}
