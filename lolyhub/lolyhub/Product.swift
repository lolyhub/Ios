//
//  Product.swift
//  lolyhub
//
//  Created by Apple on 26/04/17.
//  Copyright © 2017 webwerks. All rights reserved.
//

import Foundation

class Product : NSObject {
    
    var productId : String
    var name : String
    var price : Double
    
    var imageUrl : NSURL
   // var packWeight : Double
   // var manufacturer : String
    var storePrice : Double
    var packUnit : String
    var cartCount : Int = 0
    var previousCount : Int = 0
    
    static let PRODUCT_ID_KEY = "product_id"
    static let PRODUCT_NAME_KEY = "name"
    static let PRODUCT_PRICE_KEY = "price"
//    static let PRODUCT_CODE_KEY = "code"
    static let PRODUCT_IMAGEURL_KEY = "imageUrl"
 //   static let PRODUCT_PACK_WEIGHT_KEY = "packWeight"
 //   static let PRODUCT_MANUFACTURER_KEY = "manufacturer"
    static let PRODUCT_STORE_PRICE_KEY = "storePrice"
    static let PRODUCT_PACK_UINT_KEY = "packUnit"
    static let PRODUCT_CART_COUNT_KEY = "cartCount"
    
    
    init(productId:String, name: String, price : Double, code: String,imageUrl: NSURL, packWeight: Double, manufacturer: String, storePrice: Double, packUnit: String, cartCount: Int) {
        self.productId = productId
        self.price = price
        self.name = name
       // self.code = code
        self.imageUrl = imageUrl
       // self.packWeight = packWeight
       // self.manufacturer = manufacturer
        self.storePrice = storePrice
        self.packUnit = packUnit
        self.cartCount = cartCount
    }
    
    required init(coder aDecoder: NSCoder) {
        self.productId = aDecoder.decodeObject(forKey: Product.PRODUCT_ID_KEY) as! String
        self.name = aDecoder.decodeObject(forKey: Product.PRODUCT_NAME_KEY) as! String
        self.price = aDecoder.decodeDouble(forKey: Product.PRODUCT_PRICE_KEY)
    //    self.code = aDecoder.decodeObjectForKey(Product.PRODUCT_CODE_KEY) as! String
        self.imageUrl = aDecoder.decodeObject(forKey: Product.PRODUCT_IMAGEURL_KEY) as! NSURL
      //  self.packWeight = aDecoder.decodeDoubleForKey(Product.PRODUCT_PACK_WEIGHT_KEY)
      //  self.manufacturer = aDecoder.decodeObjectForKey(Product.PRODUCT_MANUFACTURER_KEY) as! String
        self.storePrice = aDecoder.decodeDouble(forKey: Product.PRODUCT_STORE_PRICE_KEY)
        self.packUnit = aDecoder.decodeObject(forKey: Product.PRODUCT_PACK_UINT_KEY) as! String
        self.cartCount = aDecoder.decodeInteger(forKey: Product.PRODUCT_CART_COUNT_KEY)
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encode(self.productId, forKey: Product.PRODUCT_ID_KEY)
        aCoder.encode(self.name, forKey: Product.PRODUCT_NAME_KEY)
        aCoder.encode(self.price, forKey: Product.PRODUCT_PRICE_KEY)
   //     aCoder.encodeObject(self.code, forKey: Product.PRODUCT_CODE_KEY)
        aCoder.encode(self.imageUrl, forKey: Product.PRODUCT_IMAGEURL_KEY)
  //      aCoder.encodeDouble(self.packWeight, forKey: Product.PRODUCT_PACK_WEIGHT_KEY)
  //      aCoder.encodeObject(self.manufacturer, forKey: Product.PRODUCT_MANUFACTURER_KEY)
        aCoder.encode(self.storePrice, forKey: Product.PRODUCT_STORE_PRICE_KEY)
        aCoder.encode(self.packUnit, forKey: Product.PRODUCT_PACK_UINT_KEY)
        aCoder.encode(self.cartCount, forKey: Product.PRODUCT_CART_COUNT_KEY)
    }
    
    
}
