extension TBEmployee {
    var gravatarURL: NSURL {
        return KHGravatar.URLForGravatarEmailAddress(emailAddress, defaultImageType: .ImageIdenticon, forceDefault: false, rating: .R, size: 100.0)
    }
}
