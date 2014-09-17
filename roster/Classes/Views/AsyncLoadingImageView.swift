import UIKit

class AsyncLoadingImageView: UIImageView {
    var currentRequest: NSURLSessionDataTask?

    func setImageWithURL(url: NSURL) {
        currentRequest?.cancel()

        currentRequest = NSURLSession.fetchDataFromURL(url) { data in
            dispatch_main_async { self.image = UIImage(data: data) }
        }

        currentRequest?.resume()
    }
}
