//
//  NSObject+Dispose.swift
//  NxEnabled
//
//  Created by Nikita Ermolenko on 12/01/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import Foundation

final class DisposeBag {
    
    typealias DisposeHandler = () -> Void
    var disposeHandler: DisposeHandler
    
    deinit {
        disposeHandler()
    }
    
    init(disposeHandler: @escaping DisposeHandler) {
        self.disposeHandler = disposeHandler
    }
}


fileprivate var disposeBagTypeAssociationKey: UInt8 = 0

extension NSObject {
    
    var disposeBag: DisposeBag {
        get {
            return objc_getAssociatedObject(self, &disposeBagTypeAssociationKey) as! DisposeBag
        }
        set {
            objc_setAssociatedObject(self, &disposeBagTypeAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
