extension TBEmployeeRole: Printable {
    public var description: String {
        switch self {
        case .Apprentice:
            return "Apprentice"
        case .WebDeveloper:
            return "Web Developer"
        case .Designer:
            return "Designer"
        case .MobileDeveloper:
            return "iOS Developer"
        case .OfficeManager:
            return "Office Manager"
        case .Advisor:
            return "Advisor"
        }
    }
}
