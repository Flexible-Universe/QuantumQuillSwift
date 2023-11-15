//
//  BundleExtension.swift
//
//
//  Created by Rolf Warnecke on 12.11.23.
//

import Foundation

/// The Bundle extensions provide convenient properties to access information from the main bundle.
public extension Bundle {
    /// The display name of the main bundle.
    ///
    /// This property retrieves the value of the `CFBundleDisplayName` key from the main bundle's info dictionary.
    ///
    /// Example:
    /// ```
    /// let name = Bundle.main.displayName
    /// print("App Name: \(name)")
    /// ```
    ///
    /// - Returns: A string representing the display name of the main bundle. If the key is not present or the value is not a string, an empty string is returned.
    var displayName: String {
        guard let dictionary = Bundle.main.infoDictionary else {
            return ""
        }
        if let bundleName : String = dictionary["CFBundleDisplayName"] as? String {
            return bundleName
        }

        return ""
    }
    /// The bundle identifier of the main bundle.
    ///
    /// This property retrieves the value of the `CFBundleIdentifier` key from the main bundle's info dictionary.
    ///
    /// Example:
    /// ```
    /// let identifier = Bundle.main.bundleIdentifier
    /// print("Bundle Identifier: \(identifier)")
    /// ```
    ///
    /// - Returns: A string representing the bundle identifier of the main bundle. If the key is not present or the value is not a string, an empty string is returned.
    var bundleIdentifier: String {
        guard let dictionary = Bundle.main.infoDictionary else {
            return ""
        }
        if let identifier : String = dictionary["CFBundleIdentifier"] as? String {
            return identifier
        }
        
        return ""
    }
    /// The build version number of the main bundle.
    ///
    /// This property retrieves the value of the `CFBundleVersion` key from the main bundle's info dictionary.
    ///
    /// Example:
    /// ```
    /// let buildVersion = Bundle.main.buildVersionNumber
    /// print("Build Version: \(buildVersion)")
    /// ```
    ///
    /// - Returns: A string representing the build version number of the main bundle. If the key is not present or the value is not a string, an empty string is returned.
    var buildVersionNumber: String {
        guard let dictionary = Bundle.main.infoDictionary else {
            return ""
        }
        if let version = dictionary["CFBundleShortVersionString"] as? String {
            return version
        }
        
        return ""
    }
    /// The build release number of the main bundle.
    ///
    /// This property retrieves the value of the `CFBundleShortVersionString` key from the main bundle's info dictionary.
    ///
    /// Example:
    /// ```
    /// let releaseVersion = Bundle.main.buildReleaseNumber
    /// print("Release Version: \(releaseVersion)")
    /// ```
    ///
    /// - Returns: A string representing the build release number of the main bundle. If the key is not present or the value is not a string, an empty string is returned.
    var buildReleaseNumber: String {
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
