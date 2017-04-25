//
//  CartWishList.swift
//  lolyhub
//
//  Created by Apple on 25/04/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import Foundation

class CartWishListAPI {

    enum CartWishListEndPoints : String {
        
        case
        addToCart = "AddToCart",
        deleteFromCart = "DeleteFromCart",
        getCart = "getItemCart",
        addToWishList = "AddToWish",
        deleteFromWishList = "DeleteFromWishlist",
        getWishList = "getItemWishlist"
        
    }
    
    enum CartWishListRequestKeys : String {
        
        case
        productId = "product_id",
        userId = "userID",
        quantity = "quantity"
        
    }
    
    enum CartWishListResponseKeys : String {
        
        case
        productId = "ID",
        productTitleEnglish = "titleEn",
        productTitleArabic = "titleAr",
        productPrice = "price",
        earnedLP = "earnedLP",
        productImage = "image",
        productQuantity = "quantity",
        productMarketValue = "marketValue",
        resultMessage = "ResultMsg"
        
    }

    
    class func addToCart(productId:String,userId:String, onSuccess: @escaping (_ respObject:AnyObject) -> Void, onError: @escaping (_ errorObject:AnyObject) -> Void) {
        
        let parameters : [String : Any] = [CartWishListAPI.CartWishListRequestKeys.userId.rawValue : userId, CartWishListAPI.CartWishListRequestKeys.productId.rawValue : productId]
        
        RestClient.post(url: CartWishListAPI.CartWishListEndPoints.addToCart.rawValue, parameters: parameters as [String : AnyObject], onSuccess: {
            (resultMessage) in
            
            onSuccess(resultMessage)
            
            
        }) { (errorMessage) in
            onError(errorMessage)
        }
    }
    

    class func deleteFromCart(productId:String,userId:String, onSuccess: @escaping (_ respObject:AnyObject) -> Void, onError: @escaping (_ errorObject:AnyObject) -> Void) {
        
        let parameters : [String : Any] = [CartWishListAPI.CartWishListRequestKeys.userId.rawValue : userId, CartWishListAPI.CartWishListRequestKeys.productId.rawValue : productId]
        
        RestClient.post(url: CartWishListAPI.CartWishListEndPoints.deleteFromCart.rawValue, parameters: parameters as [String : AnyObject], onSuccess: {
            (resultMessage) in
            
            onSuccess(resultMessage)
            
            
        }) { (errorMessage) in
            onError(errorMessage)
        }
    }
    
    class func getItemsInCart(userId:String, onSuccess: @escaping (_ respObject:AnyObject) -> Void, onError: @escaping (_ errorObject:AnyObject) -> Void) {
        
        let parameters : [String:Any] = [CartWishListAPI.CartWishListRequestKeys.userId.rawValue : userId]
        
        RestClient.post(url: CartWishListAPI.CartWishListEndPoints.getCart.rawValue, parameters: parameters as [String : AnyObject], onSuccess: {
            (cartObject) in
            onSuccess(cartObject)
        }) {
            (errorObject) in
            onError(errorObject)
        }
        
    }
    

    class func addToWishList(productId:String,userId:String, onSuccess: @escaping (_ respObject:AnyObject) -> Void, onError: @escaping (_ errorObject:AnyObject) -> Void) {
        
        let parameters : [String : Any] = [CartWishListAPI.CartWishListRequestKeys.userId.rawValue : userId, CartWishListAPI.CartWishListRequestKeys.productId.rawValue : productId]
        
        RestClient.post(url: CartWishListAPI.CartWishListEndPoints.addToWishList.rawValue, parameters: parameters as [String : AnyObject], onSuccess: {
            (resultMessage) in
            
            onSuccess(resultMessage)
            
            
        }) { (errorMessage) in
            onError(errorMessage)
        }
    }
    
    
    class func deleteFromWishList(productId:String,userId:String, onSuccess: @escaping (_ respObject:AnyObject) -> Void, onError: @escaping (_ errorObject:AnyObject) -> Void) {
        
        let parameters : [String : Any] = [CartWishListAPI.CartWishListRequestKeys.userId.rawValue : userId, CartWishListAPI.CartWishListRequestKeys.productId.rawValue : productId]
        
        RestClient.post(url: CartWishListAPI.CartWishListEndPoints.deleteFromWishList.rawValue, parameters: parameters as [String : AnyObject], onSuccess: {
            (resultMessage) in
            
            onSuccess(resultMessage)
            
            
        }) { (errorMessage) in
            onError(errorMessage)
        }
    }

    class func getItemsInWishList(userId:String, onSuccess: @escaping (_ respObject:AnyObject) -> Void, onError: @escaping (_ errorObject:AnyObject) -> Void) {
        
        let parameters : [String:Any] = [CartWishListAPI.CartWishListRequestKeys.userId.rawValue : userId]
        
        RestClient.post(url: CartWishListAPI.CartWishListEndPoints.getWishList.rawValue, parameters: parameters as [String : AnyObject], onSuccess: {
            (wishListObject) in
            onSuccess(wishListObject)
        }) {
            (errorObject) in
            onError(errorObject)
        }
        
    }
    
    class func updateCart(productId:String,userId:String,quantity:String, onSuccess: @escaping (_ respObject:AnyObject) -> Void, onError: @escaping (_ errorObject:AnyObject) -> Void) {
        
        let parameters : [String:Any] = [CartWishListAPI.CartWishListRequestKeys.userId.rawValue : userId, CartWishListAPI.CartWishListRequestKeys.productId.rawValue : productId, CartWishListAPI.CartWishListRequestKeys.quantity.rawValue : quantity]
        
        RestClient.post(url: CartWishListAPI.CartWishListEndPoints.getWishList.rawValue, parameters: parameters as [String : AnyObject], onSuccess: {
            (resultMessage) in
            onSuccess(resultMessage)
        }) {
            (errorMessage) in
            onError(errorMessage)
        }
        
        
    }
    
    

}
