//
//  PublicOCFunc.m
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/14.
//  Copyright © 2017年 梁家文. All rights reserved.
//

#import "PublicOCFunc.h"

@implementation PublicOCFunc

/**
 *  拆分数组
 *  @param array   需要拆分的数组
 *  @param subSize 指定长度
 *  @return 包含子数组的数组
 */
- (NSArray *)splitArray: (NSArray *)array withSubSize : (int)subSize{
    //  数组将被拆分成指定长度数组的个数
    unsigned long count = array.count % subSize == 0 ? (array.count / subSize) : (array.count / subSize + 1);
    //  用来保存指定长度数组的可变数组对象
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    //利用总个数进行循环，将指定长度的元素加入数组
    for (int i = 0; i < count; i ++) {
        //数组下标
        int index = i * subSize;
        //保存拆分的固定长度的数组元素的可变数组
        NSMutableArray *arr1 = [[NSMutableArray alloc] init];
        //移除子数组的所有元素
        [arr1 removeAllObjects];
        int j = index;
        //将数组下标乘以1、2、3，得到拆分时数组的最大下标值，但最大不能超过数组的总大小
        while (j < subSize*(i + 1) && j < array.count) {
            [arr1 addObject:[array objectAtIndex:j]];
            j += 1;
        }
        //将子数组添加到保存子数组的数组中
        [arr addObject:[arr1 copy]];
    }
    return [arr copy];
}

+(void)burstEffect:(UIView *)view andSuperView:(UIView *)superV callback:(void(^)(void))callback{

    
    // 先截图
    UIView *snapView = [view snapshotViewAfterScreenUpdates:YES];
    
    // 隐藏容器中的子控件
    for (UIView *views in view.subviews) {
        views.hidden = YES;
    }
    
    if ([view isKindOfClass:[UIImageView class]]) {

        ((UIImageView *)view).image = nil;
        
    }
    view.backgroundColor = [[UIColor purpleColor]colorWithAlphaComponent:0];
    // 保存x坐标的数组
    NSMutableArray *xArray = [[NSMutableArray alloc] init];
    // 保存y坐标
    NSMutableArray *yArray = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < view.bounds.size.width; i = i + 5) {
        [xArray addObject:@(i)];
    }
    for (NSInteger i = 0; i < view.bounds.size.height; i = i + 5) {
        [yArray addObject:@(i)];
    }
    
    
    //这个保存所有的碎片
    NSMutableArray *snapshots = [[NSMutableArray alloc] init];
    for (NSNumber *x in xArray) {
        
        for (NSNumber *y in yArray) {
            CGRect snapshotRegion = CGRectMake([x doubleValue], [y doubleValue], 5, 5);
            
            // resizableSnapshotViewFromRect 这个方法就是根据frame 去截图
            UIView *snapshot      = [snapView resizableSnapshotViewFromRect:snapshotRegion afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
            snapshot.frame        = snapshotRegion;
            [view addSubview:snapshot];
            [snapshots         addObject:snapshot];
        }
    }
    
    
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         superV.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1];
                         for (UIView *view in snapshots) {
                             view.frame = CGRectOffset(view.frame, [self randomRange:200 offset:-100], [self randomRange:200 offset:superV.frame.size.height/2]);
                         }
                     }
                     completion:^(BOOL finished) {
                         for (UIView *view in snapshots) {
                             [view removeFromSuperview];
                         }
                         [view removeFromSuperview];
                         //                         [self removeFromSuperview];
//                         [self dismissViewControllerAnimated:YES completion:nil];
                         callback();
                
                     }];

}


+ (CGFloat)randomRange:(NSInteger)range offset:(NSInteger)offset{
    
    return (CGFloat)(arc4random()%range + offset);
}

@end
