//
//  PurchaseManager.swift
//  LoganPaulSoundBoard
//
//  Created by Dmitri Marian on 9/21/17.
//  Copyright © 2017 DmitryRTV. All rights reserved.
//

import Foundation
import StoreKit


class PurchaseManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    static let instance = PurchaseManager()
    
    let IAP_REMOVE_ADS = "DmitryRTV.LoganPaulSoundBoard.remove.ads"
    
    
    var productsRequests: SKProductsRequest!
    var products = [SKProduct]()
    
    func fetchProducts(){
        let productIds = NSSet(object: IAP_REMOVE_ADS) as! Set <String>
        productsRequests = SKProductsRequest(productIdentifiers: productIds)
        productsRequests.delegate = self
        productsRequests.start()
    }
    
    func purchaseRemoveAds(){
        if SKPaymentQueue.canMakePayments() && products.count > 0 {
            let removeAdsProducts = products[0]
            let payment = SKPayment(product: removeAdsProducts)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
        }
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if response.products.count > 0 {
            print(response.products.debugDescription)
            products = response.products
        }
        
    }
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions{
            switch transaction.transactionState {
            case .purchased:
                SKPaymentQueue.default().finishTransaction(transaction)
                if transaction.payment.productIdentifier == IAP_REMOVE_ADS {
                    UserDefaults.standard.set(true, forKey: IAP_REMOVE_ADS)
                }
                break
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            case .restored:
                SKPaymentQueue.default().finishTransaction(transaction)                
            default: break
            }
        }
    }
}
