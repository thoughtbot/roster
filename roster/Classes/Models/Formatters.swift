struct Formatters {
    static func hireStringFromDate(date: NSDate?) -> String {
        let dateString = hireDateFormatter.stringFromDate <^> date

        return dateString ?? ""
    }
}

private let _dateFormatter = NSDateFormatter()

private extension Formatters {
    static var hireDateFormatter: NSDateFormatter {
        _dateFormatter.dateFormat = "'Hire Date:' M/d/yy"
        return _dateFormatter
    }
}

