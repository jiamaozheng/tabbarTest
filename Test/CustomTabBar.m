//
//  CustomTabBar.m
//  Test
//
//  Created by jiamao zheng on 7/4/15.
//  Copyright (c) 2015 jiamaozheng. All rights reserved.
//

#import "CustomTabBar.h"

@interface CustomTabBar ()

@end

@implementation CustomTabBar

- (void)viewDidLoad {
    [super viewDidLoad];
  [self hideExistingTabBar];
    // Do any additional setup after loading the view.
}

- (void)hideExistingTabBar
{
    for(UIView *view in self.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            view.hidden = YES;
            break;
        }
    }
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self addCustomElements];
    
//    if (UIDeviceOrientationIsLandscape([self.view interfaceOrientation]))
//    {
//        //x,y as you want
//        [ button setFrame:CGRectMake:(x,y,button.width,button.height)];
//        
//    }
//    else
//    {
//        //In potrait
//        //x,y as you want
//        [ button setFrame:CGRectMake:(x,y,button.width,button.height)];
//        
//        
//    }
    
    NSLog(@"Bounds Height:%f %f", self.view.bounds.size.height, self.view.bounds.size.width);
}

- (CGSize)getRotatedViewSize
{
    BOOL isPortrait = UIInterfaceOrientationIsPortrait(self.interfaceOrientation);
    
    float max = MAX(self.view.bounds.size.width, self.view.bounds.size.height);
    float min = MIN(self.view.bounds.size.width, self.view.bounds.size.height);
    
    return (isPortrait ?
            CGSizeMake(min, max) :
            CGSizeMake(max, min));
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
         // do whatever
     } completion:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         
     }];
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

-(void) addCustomElements
{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    CGRect winFrame = self.view.frame;
    CGFloat width = winFrame.size.width;
    CGFloat height = winFrame.size.height;
    winFrame.size.height = (UIInterfaceOrientationIsLandscape(orientation)) ? MIN(width, height): MAX(width, height);
    winFrame.size.width  = (UIInterfaceOrientationIsLandscape(orientation)) ? MAX(width, height): MIN(width, height);
//    self.view.frame = winFrame;
//    CGRect winFrame = self.tabBarController.tabBar.frame;
    NSLog(@"winFrame height %d", winFrame.size.height);
    NSLog(@"tabbar height %d", self.tabBar.frame.size.height);
    
//    CGSize winFrame = [self getRotatedViewSize];
    
    // Initialise our two images
//    UIImage *btnImage = [UIImage imageNamed:@"1.png"];
//    UIImage *btnImageSelected = [UIImage imageNamed:@"1.png"];
    UILabel *scoreLabel = [ [UILabel alloc ] initWithFrame:CGRectMake(0, winFrame.size.height-50, winFrame.size.width/4, 50)];
    scoreLabel.textAlignment =  UITextAlignmentCenter;
    scoreLabel.text = @"b";
    scoreLabel.textColor = [UIColor whiteColor];
    scoreLabel.backgroundColor = [UIColor blueColor];
    scoreLabel.font = [UIFont fontWithName:@"person" size:(24.0)];
    
    UILabel *scoreLabel11 = [ [UILabel alloc ] initWithFrame:CGRectMake(0, winFrame.size.height-10, winFrame.size.width/4, 10)];
    scoreLabel11.textAlignment =  UITextAlignmentCenter;
    scoreLabel11.text = @"impression";
    scoreLabel11.textColor = [UIColor whiteColor];
    scoreLabel11.backgroundColor = [UIColor blueColor];
    scoreLabel11.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(10.0)];
    
//    scoreLabel.text = [NSString stringWithFormat: @"%d", score];
    
    btn1 = [UIButton buttonWithType:UIButtonTypeCustom]; //Setup the button
    btn1.frame = CGRectMake(0,winFrame.size.height-50, winFrame.size.width/4, 50); // Set the frame (size and position) of the button)
//    [btn1 setBackgroundImage:btnImage forState:UIControlStateNormal]; // Set the image for the normal state of the button
//    [btn1 setBackgroundImage:btnImageSelected forState:UIControlStateSelected]; // Set the image for the selected state of the button
    [btn1 setTag:0]; // Assign the button a "tag" so when our "click" event is called we know which button was pressed.
    [btn1 setSelected:true]; // Set this button as selected (we will select the others to false as we only want Tab 1 to be selected initially
    
    // Now we repeat the process for the other buttons
////    btnImage = [UIImage imageNamed:@"2.png"];
////    btnImageSelected = [UIImage imageNamed:@"2.png"];
//    UILabel *scoreLabel2 = [ [UILabel alloc ] initWithFrame:CGRectMake(winFrame.origin.x + winFrame.size.width/4, winFrame.size.height-50, winFrame.size.width/4, 50)];
//    scoreLabel2.textAlignment =  UITextAlignmentCenter;
//    scoreLabel2.text = @"Two";
//    scoreLabel2.textColor = [UIColor blueColor];
//    scoreLabel2.backgroundColor = [UIColor greenColor];
//    scoreLabel2.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(24.0)];
//    
//    UILabel *scoreLabel22 = [ [UILabel alloc ] initWithFrame:CGRectMake(winFrame.origin.x + winFrame.size.width/4, winFrame.size.height-10, winFrame.size.width/4, 10)];
//    scoreLabel22.textAlignment =  UITextAlignmentCenter;
//    scoreLabel22.text = @"Two";
//    scoreLabel22.textColor = [UIColor redColor];
//    scoreLabel22.backgroundColor = [UIColor greenColor];
//    scoreLabel22.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(10.0)];
//    btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn2.frame = CGRectMake(winFrame.origin.x + winFrame.size.width/4, winFrame.size.height-50, winFrame.size.width/4, 50);
////    [btn2 setBackgroundImage:btnImage forState:UIControlStateNormal];
////    [btn2 setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
//    [btn2 setTag:1];
//    
////    btnImage = [UIImage imageNamed:@"3.png"];
////    btnImageSelected = [UIImage imageNamed:@"3.png"];
//    UILabel *scoreLabel3 = [ [UILabel alloc ] initWithFrame:CGRectMake(winFrame.origin.x + winFrame.size.width/2, winFrame.size.height-50, winFrame.size.width/4, 50)];
//    scoreLabel3.textAlignment =  UITextAlignmentCenter;
//    scoreLabel3.text = @"Three";
//    scoreLabel3.textColor = [UIColor blueColor];
//    scoreLabel3.backgroundColor = [UIColor greenColor];
//    scoreLabel3.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(24.0)];
//    btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn3.frame = CGRectMake(winFrame.origin.x + winFrame.size.width/2, winFrame.size.height-50, winFrame.size.width/4, 50);
//    
//    UILabel *scoreLabel33 = [ [UILabel alloc ] initWithFrame:CGRectMake(winFrame.origin.x + winFrame.size.width/2, winFrame.size.height-10, winFrame.size.width/4, 10)];
//    scoreLabel33.textAlignment =  UITextAlignmentCenter;
//    scoreLabel33.text = @"Three";
//    scoreLabel33.textColor = [UIColor redColor];
//    scoreLabel33.backgroundColor = [UIColor greenColor];
//    scoreLabel33.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(10.0)];
//   
////    [btn3 setBackgroundImage:btnImage forState:UIControlStateNormal];
////    [btn3 setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
//    [btn3 setTag:2];
//    
////    btnImage = [UIImage imageNamed:@"4.png"];
////    btnImageSelected = [UIImage imageNamed:@"4.png"];
//    UILabel *scoreLabel4 = [ [UILabel alloc ] initWithFrame:CGRectMake(winFrame.origin.x + winFrame.size.width *3/4, winFrame.size.height-50, winFrame.size.width/4, 50)];
//    scoreLabel4.textAlignment =  UITextAlignmentCenter;
//    scoreLabel4.text = @"Four";
//    scoreLabel4.textColor = [UIColor blueColor];
//    scoreLabel4.backgroundColor = [UIColor greenColor];
//    scoreLabel4.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(24.0)];
//    
//    UILabel *scoreLabel44 = [ [UILabel alloc ] initWithFrame:CGRectMake(winFrame.origin.x + winFrame.size.width *3/4, winFrame.size.height-10, winFrame.size.width/4, 10)];
//    scoreLabel44.textAlignment =  UITextAlignmentCenter;
//    scoreLabel44.text = @"Four";
//    scoreLabel44.textColor = [UIColor redColor];
//    scoreLabel44.backgroundColor = [UIColor greenColor];
//    scoreLabel44.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(10.0)];
//    btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn4.frame = CGRectMake(winFrame.origin.x + winFrame.size.width *3/4, winFrame.size.height-50, winFrame.size.width/4, 50);
////    [btn4 setBackgroundImage:btnImage forState:UIControlStateNormal];
////    [btn4 setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
//    [btn4 setTag:3];
    
    // Add my new buttons to the view
    [self.view addSubview:btn1];
//    [self.view addSubview:btn2];
//    [self.view addSubview:btn3];
//    [self.view addSubview:btn4];
    
    [self.view addSubview:scoreLabel];
        [self.view addSubview:scoreLabel11];
//     [self.view addSubview:scoreLabel2];
//     [self.view addSubview:scoreLabel3];
//     [self.view addSubview:scoreLabel4];
//    [self.view addSubview:scoreLabel22];
//    [self.view addSubview:scoreLabel33];
//    [self.view addSubview:scoreLabel44];
    
    // Setup event handlers so that the buttonClicked method will respond to the touch up inside event.
    [btn1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [btn2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [btn3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [btn4 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)selectTab:(int)tabID
{
    switch(tabID)
    {
        case 0:
            [btn1 setSelected:true];
            [btn2 setSelected:false];
            [btn3 setSelected:false];
            [btn4 setSelected:false];
            break;
        case 1:
            [btn1 setSelected:false];
            [btn2 setSelected:true];
            [btn3 setSelected:false];
            [btn4 setSelected:false];
            break;
        case 2:
            [btn1 setSelected:false];
            [btn2 setSelected:false];
            [btn3 setSelected:true];
            [btn4 setSelected:false];
            break;
        case 3:
            [btn1 setSelected:false];
            [btn2 setSelected:false];
            [btn3 setSelected:false];
            [btn4 setSelected:true];
            break;
    }
    
    self.selectedIndex = tabID;
}

- (void)buttonClicked:(id)sender
{
    int tagNum = (int)[sender tag];
    [self selectTab:tagNum];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
