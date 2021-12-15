//
//  Hashing Algorithm.swift
//  webview
//
//  Created by Abhishek Shakya on 21/06/19.
//  Copyright © 2019 Abhishek Shakya. All rights reserved.
//
import UIKit
import CommonCrypto
public class Hashing_Algorithm {
    static func hmac(algorithm:CryptoAlgorithm, msg: String,strSecretKey:String) -> String {
        var  convertedHashKey = [UInt8](repeating: 0, count:strSecretKey.count/2);
        let  p = Array(strSecretKey)
        for i in 0..<(strSecretKey.count / 2)
        {
            var range : String = "";
            range = range + String(p[i*2]);
            range = range + String(p[i*2 + 1]);
            convertedHashKey[i] = UInt8(Int(range, radix: 16)!)
        }
        let str = msg.cString(using: String.Encoding.utf8)
        let strLen = Int(msg.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = algorithm.digestLength
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CCHmac(algorithm.HMACAlgorithm, convertedHashKey, 16, str!, strLen, result)
        let digest = stringFromResult(result: result, length: digestLen)
        result.deallocate()
        
        return digest
    }
    static func stringFromResult(result: UnsafeMutablePointer<CUnsignedChar>, length: Int) -> String {
        let hash = NSMutableString()
        for i in 0..<length {
            hash.appendFormat("%02x", result[i])
        }
        return String(hash)
    }
    static func   isValidString( str:String)->Bool{
        if(str != nil && !"".isEqual(str.trimmingCharacters(in: .whitespacesAndNewlines).count>0)){
            return true;
        }
        return false;
    }
    
    public static func GenerateHash(base64string:String,  strSecretKey:String,  strHashType:String)->String {
        var strHash:String = "";
        
        if (strHashType.caseInsensitiveCompare("SHA256") == ComparisonResult.orderedSame) {
            strHash = hmac(algorithm:.SHA256, msg: String(base64string), strSecretKey:strSecretKey)
        }
        else if (strHashType.caseInsensitiveCompare("MD5") == ComparisonResult.orderedSame) {
            strHash = hmac(algorithm:.SHA256, msg: String(base64string), strSecretKey:strSecretKey)
            
        }
        return strHash.uppercased();
    }
    
}



