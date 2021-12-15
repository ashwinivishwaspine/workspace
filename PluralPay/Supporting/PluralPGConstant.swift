//
//  PluralPGConstant.swift
//  PluralCheckout
//
//  Created by Ashwini Vishwas on 09/12/21.
//

import Foundation

public class PluralPGConstant{
    public static let  RM_INTERNET_NOT_CONNECTED :String = "INTERNET NOT CONNECTED";
    //ZOOM-IN DISABLE
    public static let ZOOM_IN_DISABLE:String =  "var meta = document.createElement('meta');" +
        "meta.name = 'viewport';" +
        "meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';" +
        "var head = document.getElementsByTagName('head')[0];" + "head.appendChild(meta);";

}


class Options {
    static let kTheme = "theme"
    static let kOrderToken = "orderToken"
    static let kChannelId = "channelId"
    static let kPaymentMode = "paymentMode"
    static let kCountryCode = "countryCode"
    static let kMobileNum = "mobileNumber"
    static let kEmailID = "emailId"
    static let kShowSavedCardsFeature = "showSavedCardsFeature"
}

