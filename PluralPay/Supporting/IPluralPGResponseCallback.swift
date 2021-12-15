//
//  IPluralPGResponseCallback.swift
//  PluralCheckout
//
//  Created by Ashwini Vishwas on 09/12/21.
//

import Foundation

public protocol IPluralPGResponseCallback
{
    func internetNotAvailable( code:Int,  message:String)
    func onErrorOccured( code:Int, message:String)
    func onTransactionResponse()
    func onCancelTxn(code:Int,message:String)
    func onPressedBackButton(code:Int,message:String)
}
