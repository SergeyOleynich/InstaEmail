//
//  ViewController.h
//  InstaEmail
//
//  Created by Administrator on 8/11/14.
//  Copyright (c) 2014 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, MFMailComposeViewControllerDelegate>
{
    UIPickerView *emailPicker_;
    NSArray *activities_;
    NSArray *feelings_;
}

@property (strong, nonatomic) IBOutlet UIPickerView *emailPicker;

-(IBAction)sendButtonTapped:(id)sender;

@end
