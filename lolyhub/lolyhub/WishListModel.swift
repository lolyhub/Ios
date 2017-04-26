//
//  WishListModel.swift
//  lolyhub
//
//  Created by Apple on 26/04/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import Foundation

class WishList {
    
    private static var wishListInstance : WishList!
    var productList : [Product] = []
    static let WISHLIST_PRODUCT_LIST = "productList"
    static let WISHLIST_STORE_DETAIL = "store"
    
    class func getWishListInstance() -> WishList{
        if WishList.wishListInstance == nil{
            WishList.wishListInstance = WishList()
            WishList.wishListInstance.pullWishListData()
        }
        return WishList.wishListInstance
    }
    
    
    func updateProductQuantity(product : Product, operation : Int){
        let count = product.wishListCount
        let existProduct = productList.isInWishListExists(product: product)
        if  existProduct.0{
            switch operation{
            case 0:
                existProduct.1.wishListCount = count + 1
                product.wishListCount = count + 1
                
            case 1:
                existProduct.1.wishListCount = count - 1
                product.wishListCount = count - 1
                if existProduct.1.wishListCount == 0{
                    productList.removeObject(object: existProduct.1)
                }
                
            default :
                print("")
            }
        }
        else{
            productList.append(existProduct.1)
            existProduct.1.wishListCount = count + 1
        }
    }
    
    func getTotalPrice()-> Double{
        var totalPrice : Double = 0.0
        for product in productList{
            totalPrice = totalPrice + (product.storePrice * Double(product.wishListCount))
        }
        return totalPrice
    }
    
    func getTotalProductList()-> Int{
        var quantity : Int = 0
        for product in productList{
            quantity = quantity + product.wishListCount
        }
        return quantity
    }
    
    func pullWishListData(){
        let storeData = UserDefaults.standard.object(forKey: WishList.WISHLIST_STORE_DETAIL) as? NSData
        //        if let storeData = storeData {
        //            self.store = NSKeyedUnarchiver.unarchiveObjectWithData(storeData) as? Store
        //        }
        retrieveProductList()
    }
    
    //    func commitCartData(){
    //        let storeData = NSKeyedArchiver.archivedDataWithRootObject(self.store)
    //        NSUserDefaults.standardUserDefaults().setObject(storeData, forKey: Cart.CART_STORE_DETAIL)
    //
    //        saveCartProductList()
    //    }
    
    func getWishListJSON() -> String{
        var jsonObject: [AnyObject] = []
        var products = [String : AnyObject]()
        for wishListProduct in retrieveProductList(){
            products["product_id"] = wishListProduct.productId as AnyObject?
            products["product_qty"] = wishListProduct.wishListCount as AnyObject?
            jsonObject.append(products as AnyObject)
        }
        let jsonString = LHUtils.JSONStringify(value: jsonObject as AnyObject)
        print(jsonString)
        return jsonString
    }
    
    func saveWishListProductList(){
        let productData = NSKeyedArchiver.archivedData(withRootObject: self.productList)
        UserDefaults.standard.set(productData, forKey: WishList.WISHLIST_PRODUCT_LIST)
    }
    
    func retrieveProductList() -> [Product]{
        let productData = UserDefaults.standard.object(forKey: WishList.WISHLIST_PRODUCT_LIST) as? NSData
        
        if let productData = productData {
            let productArray = NSKeyedUnarchiver.unarchiveObject(with: productData as Data) as? [Product]
            
            if let productArray = productArray {
                self.productList = productArray
            }
        }
        return self.productList
    }
    
    func getProductDictionary() -> [String : Int]{
        var products = [String : Int]()
        for wishListProduct in self.productList{
            products[wishListProduct.productId] = wishListProduct.wishListCount
        }
        return products
    }
    
    func clearWishList(){
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            if key == WishList.WISHLIST_PRODUCT_LIST || key == WishList.WISHLIST_STORE_DETAIL {
                UserDefaults.standard.removeObject(forKey: key)
            }
        }
        clearWishListInstance()
    }
    
    func clearWishListInstance(){
        WishList.wishListInstance = nil
    }
    
    
}
