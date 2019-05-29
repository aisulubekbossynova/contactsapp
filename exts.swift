//
//  exts.swift
//  contacts
//
//  Created by Macbook on 09.02.18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import Foundation
class CGRect{
    convenience init(_ x:Float,_ y:Float,_ width:Float,_ height:Float) {
        self.init(x,y,width,height)
    }
    
}
class CGSize{
    convenience init(_ width:Float,_ height:Float) {
        self.init(width,height)
    }
}
class CGPoint{
    convenience init(_ x:Float,_ y:Float) {
        self.init(x,y)
    }
}
