//
//  PluralPGActivityViewController.swift
//  PluralCheckout
//
//  Created by Ashwini Vishwas on 10/12/21.
//

import UIKit
import WebKit

class PluralPGActivityVC: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var plural = Plural()
    var environment = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.configuration.preferences.javaScriptEnabled = true
        guard let link = URL(string:environment) else{return}
        let request = URLRequest(url: link)
        //ZOOM-IN DISABLE
        let script: WKUserScript = WKUserScript(source:PluralPGConstant.ZOOM_IN_DISABLE, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        webView.configuration.userContentController.addUserScript(script)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.load(request)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    
}

extension PluralPGActivityVC{
    func openWebViewPaymentUI(){
        
        let theme = plural.getTheme()
        let token = plural.getOrderToken()
        let channelId = plural.getChannelId()
        let paymentMode = plural.getPaymentMode()
        let countryCode = plural.getCountryCode()
        let mobileNumber = plural.getMobileNum()
        let emailId = plural.getEmailId()
        let showSavedCardsFeature = plural.getshowSavedCardsFeature()
    
        let options = [
            Options.kTheme:theme,
            Options.kOrderToken: token,
            Options.kChannelId: channelId,
            Options.kPaymentMode: paymentMode,
            Options.kCountryCode: countryCode,
            Options.kMobileNum: mobileNumber,
            Options.kEmailID:emailId,
            Options.kShowSavedCardsFeature:showSavedCardsFeature
        ] as [String : Any]
        
        var jsonString = ""
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: options, options: [.prettyPrinted])
            if let tempJsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) {
                jsonString = tempJsonString as String
            }
        }catch{
            debugPrint("Error in jsonseralization")
        }
        print(jsonString)
        
        
        let js = """
        (function(){
            window.postMessage({ options: \(jsonString)}, "*");
        })();
        """
    
      
        self.webView.evaluateJavaScript(js, completionHandler: {
            (result, err) in
            if (err != nil) {
                print(err)
            }
        })
    }
}

extension PluralPGActivityVC: WKScriptMessageHandler,UIWebViewDelegate,WKNavigationDelegate,WKUIDelegate{
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        openWebViewPaymentUI()
    }
    
    
    
    
    
    
    
}
