//
//  BundleExtension.swift
//
//
//  Created by Rolf Warnecke on 12.11.23.
//

import Foundation

extension Bundle {
    /// To show the display name of the app
    /// - Returns: The display name of the app
    public var displayName: String {
        guard let dictionary = Bundle.main.infoDictionary else {
            return ""
        }
        if let bundleName : String = dictionary["CFBundleDisplayName"] as? String {
            return bundleName
        }

        return ""
    }
    /// To show the bundle identifier of the app
    /// - Returns: The bundle identifier of the app
    public var bundleIdentifier: String {
        guard let dictionary = Bundle.main.infoDictionary else {
            return ""
        }
        if let identifier : String = dictionary["CFBundleIdentifier"] as? String {
            return identifier
        }
        
        return ""
    }
    /// To show the version number of the app
    /// - Returns: The version number of the app
    public var buildVersionNumber: String {
        guard let dictionary = Bundle.main.infoDictionary else {
            return ""
        }
        if let version = dictionary["CFBundleShortVersionString"] as? String {
            return version
        }
        
        return ""
    }
    /// To show the release number or DEV as release number of the app
    /// - Returns: The release number of the app or if the release number is zero than DEV
    public var buildReleaseNumber: String {
        guard let dictionary = Bundle.main.infoDictionary else {
            return ""
        }
        if let release = dictionary["CFBundleVersion"] as? String {
            if release == "0" {
                return "DEV"
            }
            return release
        }
        
        return ""
    }
}
