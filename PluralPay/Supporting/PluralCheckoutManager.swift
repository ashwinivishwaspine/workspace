//
//  PluralCheckoutManager.swift
//  PluralCheckout
//
//  Created by Ashwini Vishwas on 09/12/21.
//

import UIKit

public class  PluralPGPaymentManager {
    public init(){}
    static var  merchantCallback:IPluralPGResponseCallback?=nil;
    public static  func open(option:Plural,environmentURL:String,Context ctx:UIViewController, pinePGResponseCallback:IPluralPGResponseCallback) {
        
            if(!(Internet().isInternetAvailable()))
            {
                Toas.default.show(text:PluralPGConstant.RM_INTERNET_NOT_CONNECTED, duration: 4.0)
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    Toas.default.dismiss(animated: true);
                }
            }
            else
            {
//            PinePGSDK.intializePinePGSDK(pinePGPaymentParam:pinePGPaymentParam,Context:ctx,merchantResponseCallback:pinePGResponseCallback);
                let storyboard = UIStoryboard(name: "PluralStoryboard", bundle:Bundle(for: PluralPGActivityVC.self))
                 let vc=storyboard.instantiateViewController(withIdentifier:"PluralPGActivityViewController") as! PluralPGActivityVC
                vc.plural=option
                vc.environment = environmentURL
                let navController = UINavigationController(rootViewController: vc)
                navController.modalPresentationStyle = .overCurrentContext
                navController.modalTransitionStyle = .crossDissolve
                ctx.present(navController, animated: false, completion: nil)
            }
        

        }
    }
   








