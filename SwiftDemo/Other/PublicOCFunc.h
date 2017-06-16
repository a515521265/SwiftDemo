//
//  PublicOCFunc.h
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/14.
//  Copyright © 2017年 梁家文. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PublicOCFunc : NSObject

- (NSArray *)splitArray: (NSArray *)array withSubSize : (int)subSize;

+ (void)burstEffect:(UIView *)view andSuperView:(UIView *)superV callback:(void(^)(void))callback;


+ (void)singleTapAction:(UIView *)view callback:(void(^)(void))callback;

@end
