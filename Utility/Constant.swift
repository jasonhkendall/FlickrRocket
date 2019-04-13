//
//  Constant.swift
//  FlickrRocket
//
//  Created by Jason Howard Kendall on 4/7/19.
//  Copyright © 2019 Jason Howard Kendall. All rights reserved.
//

import Foundation
import UIKit

struct MapCreds
{
}
struct AppColors
{
    
    static let Blue = UIColor(red: 66/255.0, green: 116/255.0, blue: 186/255.0, alpha: 1)
    static let Green = UIColor(red: 50/255.0, green: 185/255.0, blue: 83/255.0, alpha: 1)
    static let Red = UIColor(red: 242/255.0, green: 42/255.0, blue: 53/255.0, alpha: 1)
    
}

struct UserCode {

}

struct ViewControllerIdentifiers
{
    static let MAINCONTROLLER = "mainVCID"
    static let IMAGECONTROLLER = "imageVCID"

}

struct UserDefaultKeys {
    
    static let savedPlaces = "savedPlaces"
}

struct strings{
    static let Loading = "Loading..."
}

struct APIConstants
{

    static let FETCHPHOTO = "https://api.flickr.com/services/rest/?format=json&sort=random&method=flickr.photos.search&tags=rocket&tag_mode=all&api_key=0e2b6aaf8a6901c264acb91f151a3350&nojsoncallback=1"
}



struct UserDataKeys {
    static let USERIDKEY="userId"
}


// auto connections cases
enum HTTPStatusCodes: Int {
    // 100 Informational
    case Continue = 100
    case SwitchingProtocols
    case Processing
    // 200 Success
    case OK = 200
    case Created
    case Accepted
    case NonAuthoritativeInformation
    case NoContent
    case ResetContent
    case PartialContent
    case MultiStatus
    case AlreadyReported
    case IMUsed = 226
    // 300 Redirection
    case MultipleChoices = 300
    case MovedPermanently
    case Found
    case SeeOther
    case NotModified
    case UseProxy
    case SwitchProxy
    case TemporaryRedirect
    case PermanentRedirect
    // 400 Client Error
    case BadRequest = 400
    case Unauthorized
    case PaymentRequired
    case Forbidden
    case NotFound
    case MethodNotAllowed
    case NotAcceptable
    case ProxyAuthenticationRequired
    case RequestTimeout
    case Conflict
    case Gone
    case LengthRequired
    case PreconditionFailed
    case PayloadTooLarge
    case URITooLong
    case UnsupportedMediaType
    case RangeNotSatisfiable
    case ExpectationFailed
    case ImATeapot
    case MisdirectedRequest = 421
    case UnprocessableEntity
    case Locked
    case FailedDependency
    case UpgradeRequired = 426
    case PreconditionRequired = 428
    case TooManyRequests
    case RequestHeaderFieldsTooLarge = 431
    case UnavailableForLegalReasons = 451
    // 500 Server Error
    case InternalServerError = 500
    case NotImplemented
    case BadGateway
    case ServiceUnavailable
    case GatewayTimeout
    case HTTPVersionNotSupported
    case VariantAlsoNegotiates
    case InsufficientStorage
    case LoopDetected
    case NotExtended = 510
    case NetworkAuthenticationRequired
}
struct StoryboardNames
{
    static let MAIN = "Main"
}

struct CellIdentifiers
{
    static let COLLECTIONMAIN = "collectionCell"

}

struct Map
{
    static let DEFAULTLAT = 50.655
    static let DEFAULTLONG = 7.6513
}
