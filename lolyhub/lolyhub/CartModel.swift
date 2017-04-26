//
//  CartModel.swift
//  lolyhub
//
//  Created by Apple on 26/04/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import Foundation

class Cart {
    
    private static var cartInstance : Cart!
    var productList : [Product] = []
    static let CART_PRODUCT_LIST = "productList"
    static let CART_STORE_DETAIL = "store"
    
    class func getCartInstance() -> Cart{
        if Cart.cartInstance == nil{
            Cart.cartInstance = Cart()
            Cart.cartInstance.pullCartData()
        }
        return Cart.cartInstance
    }
    
    func updateProductQuantity(product : Product, operation : Int){
        let count = product.cartCount
        let existProduct = productList.isInCartExists(product: product)
        if  existProduct.0{
            switch operation{
            case 0:
                existProduct.1.cartCount = count + 1
                product.cartCount = count + 1
                
            case 1:
                existProduct.1.cartCount = count - 1
                product.cartCount = count - 1
                if existProduct.1.cartCount == 0{
                    productList.removeObject(object: existProduct.1)
                }
                
            default :
                print("")
            }
        }
        else{
            productList.append(existProduct.1)
            existProduct.1.cartCount = count + 1
        }
    }

    func getTotalPrice()-> Double{
        var totalPrice : Double = 0.0
        for product in productList{
            totalPrice = totalPrice + (product.storePrice * Double(product.cartCount))
        }
        return totalPrice
    }
    
    func getTotalProductList()-> Int{
        var quantity : Int = 0
        for product in productList{
            quantity = quantity + product.cartCount
        }
        return quantity
    }
    
    func pullCartData(){
        let storeData = UserDefaults.standard.object(forKey: Cart.CART_STORE_DETAIL) as? NSData
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
    
    func getCartJSON() -> String{
        var jsonObject: [AnyObject] = []
        var products = [String : AnyObject]()
        for cartProduct in retrieveProductList(){
            products["product_id"] = cartProduct.productId as AnyObject?
            products["product_qty"] = cartProduct.cartCount as AnyObject?
            jsonObject.append(products as AnyObject)
        }
        let jsonString = LHUtils.JSONStringify(value: jsonObject as AnyObject)
        print(jsonString)
        return jsonString
    }
    
    func saveCartProductList(){
        let productData = NSKeyedArchiver.archivedData(withRootObject: self.productList)
        UserDefaults.standard.set(productData, forKey: Cart.CART_PRODUCT_LIST)
    }
    
    func retrieveProductList() -> [Product]{
        let productData = UserDefaults.standard.object(forKey: Cart.CART_PRODUCT_LIST) as? NSData
        
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
        for cartProduct in self.productList{
            products[cartProduct.productId] = cartProduct.cartCount
        }
        return products
    }
    
    func clearCart(){
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            if key == Cart.CART_PRODUCT_LIST || key == Cart.CART_STORE_DETAIL {
                UserDefaults.standard.removeObject(forKey: key)
            }
        }
        clearCartInstance()
    }
    
    func clearCartInstance(){
        Cart.cartInstance = nil
    }
    
    
    
    
    
    
    
}
