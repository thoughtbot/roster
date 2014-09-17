extension NSURLSession {
    class func fetchDataFromURL(url: NSURL, completionHandler: (NSData) -> ()) -> NSURLSessionDataTask {
        return self.sharedSession().dataTaskWithURL(url) { data, _, _ in
            if let actualData = data {
                completionHandler(actualData)
            }
        }
    }
}
