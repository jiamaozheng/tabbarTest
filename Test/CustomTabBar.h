//
//  CustomTabBar.h
//  Test
//
//  Created by jiamao zheng on 7/4/15.
//  Copyright (c) 2015 jiamaozheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

@interface CustomTabBar : UITabBarController{
   UIButton *btn1;
   UIButton *btn2;
    UIButton *btn3;
    UIButton *btn4;
    BOOL rotated;
}


-(void) hideExistingTabBar;
-(void) addCustomElements;
-(void) selectTab:(int)tabID;

@end
