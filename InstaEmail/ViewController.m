//
//  ViewController.m
//  InstaEmail
//
//  Created by Administrator on 8/11/14.
//  Copyright (c) 2014 Administrator. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize emailPicker = emailPicker_, notesField = notesFiled_;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    activities_ = [[NSArray alloc] initWithObjects:@"sleeping", @"eating", @"working", @"thinking", @"crying", @"begging", @"leaving", @"shopping", @"hello worlding", nil];
    feelings_ = [[NSArray alloc] initWithObjects:@"awesome", @"sad", @"happy", @"ambivalent", @"nauseous", @"psyched", @"confused", @"hopeful", @"anxious", nil];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Picker Datasource Protocol

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return [activities_ count];
    }
    else
    {
        return [feelings_ count];
    }
}

#pragma mark -
#pragma mark Picker Delegate Protocol

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        return activities_ [row];
    }
    else
    {
        return [feelings_ objectAtIndex:row];
    }
    return nil;
}

#pragma mark -
#pragma mark Actions

-(IBAction)sendButtonTapped:(id)sender
{
    NSString *theMessage = [NSString stringWithFormat:@"%@ I'm %@ and feeling %@ about it.",
                            notesFiled_.text ? notesFiled_.text : @"",
                            [activities_ objectAtIndex:[emailPicker_ selectedRowInComponent:0]],
                            [feelings_ objectAtIndex:[emailPicker_ selectedRowInComponent:1]]];
    NSLog(@"%@",theMessage);
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailController = [MFMailComposeViewController new];
        mailController.mailComposeDelegate = self;
        [mailController setSubject:@"Hello, Renee!"];
        [mailController setMessageBody:theMessage isHTML:NO];
        [self presentModalViewController:mailController animated:YES];
    }
    else
    {
        NSLog(@"%@", @"Sorry, you need to setup mail first!");
    }
}

#pragma mark -
#pragma mark Mail composer delegate metod

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}
     
@end
