//
//  ViewController.h
//  QuizApp
//
//  Created by 池田享浩 on 2015/12/10.
//  Copyright (c) 2015年 takahiro ikeda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
-(IBAction)mbutton:(id)sender;
-(IBAction)bbutton:(id)sender;
-(IBAction)nextbutton:(id)sender;
@property(nonatomic,weak)IBOutlet UILabel *questionNo;
@property(nonatomic,weak)IBOutlet UILabel *kekka;
@property(nonatomic,weak)IBOutlet UIImageView *backgroundImageView;
@property(nonatomic,weak)IBOutlet UITextView *mondai2;
@property(nonatomic,weak)IBOutlet UITextView *kaisetu3;
@end

