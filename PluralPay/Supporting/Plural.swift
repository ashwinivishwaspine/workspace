//
//  Plural.swift
//  PluralCheckout
//
//  Created by Ashwini Vishwas on 09/12/21.
//
///If for your use case you are not using saved cards feature and will be sending showSavedCardsFeature value as false then the login page from Plural will be skipped. Please make sure the mobileNumber and emailId values are sent, given these are required by downstream acquirer gateways.

import Foundation

public class Plural {
    
    private var theme:String // "default" or "black"
    private var orderToken:String
    private var channelId:String // "APP" or "WEB"
    private var paymentMode : String // comma separated - Example - 'CREDIT_DEBIT,NETBANKING,UPI,WALLET,EMI,DEBIT_EMI
    private var countryCode : String // type = string, default "91"
    private var mobileNumber : String // type = string, default = null
    private var emailId : String  //default null
    private var showSavedCardsFeature: Bool // type = boolean, default = true
    public init()
    {
        theme = "default"
        orderToken = ""
        channelId = "APP"
        paymentMode = "";
        countryCode = "91"
        mobileNumber = ""
        emailId = ""
        showSavedCardsFeature=true
        
    }
    public  func setTheme(theme:String)->Plural {
        self.theme = theme
        return self
    }
    
    public func setOrderToken( orderToken:String)->Plural {
        self.orderToken = orderToken
        return self
    }
    
    public func setChannelId( channelId:String)->Plural {
        self.channelId = channelId
        return self
    }
    
    public func setPaymentMode( paymentMode:String)->Plural {
        self.paymentMode = paymentMode
        return self
    }
    
    public func setCountryCode( countryCode:String)->Plural {
        self.countryCode = countryCode
        return self
    }
    
    public func setMobileNum( mobileNumber:String)->Plural {
        self.mobileNumber = mobileNumber
        return self
    }
    
    public func setEmailId(emailId:String)->Plural {
        self.emailId = emailId
        return self
    }
    
    public func setshowSavedCardsFeature(showSavedCardsFeature:Bool)->Plural {
        self.showSavedCardsFeature = showSavedCardsFeature;
        return self
    }
    
    public func getTheme()->String {
        return theme
    }
    
    public func  getOrderToken()->String {
        return orderToken
    }
    
    public func getChannelId()->String {
        return channelId
    }
    
    public func getPaymentMode()->String {
        return paymentMode
    }
    
    public func getCountryCode()->String {
        return countryCode
    }
    
    public func getMobileNum()->String {
        return mobileNumber
    }
    
    public func getEmailId()->String {
        return emailId
    }
    
    public func getshowSavedCardsFeature()->Bool {
        return showSavedCardsFeature;
    }
   
}



