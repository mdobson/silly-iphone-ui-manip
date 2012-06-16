//
//  ViewController.m
//  studycache-explore-one
//
//  Created by Matthew Dobson on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize test;
@synthesize ui;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 170, 100, 30);
    
    [button setTitle:@"Click me!" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 200, 300, 40)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font = [UIFont systemFontOfSize:15];
    textField.placeholder = @"enter text";
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;    
    //[self.view addSubview:textField];
    self.test = textField;
    
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    NSDictionary *qdict = [[NSDictionary alloc] initWithObjectsAndKeys:@"oneone",@"onetwo",@"twoone",@"twotwo", nil];
    
    NSArray *uiArr = [[NSArray alloc] initWithObjects:textField, nil];
    
    NSDictionary *uiDict = [[NSDictionary alloc] initWithObjectsAndKeys:textField, @"one", nil];
    self.ui = uiDict;
    int i = 1;
    for(id key in qdict)
    {
        NSString *value = [qdict objectForKey:key];
        UITextView *tv = [[UITextView alloc] initWithFrame:CGRectMake(300, 300 + (i * 40), 100, 100)];
        tv.text = value;
        [self.view addSubview:tv];
        i++;
    }
    
    for(id key in uiArr)
    {
        UIView *ui = (UIView*)key;
        [self.view addSubview:ui];
    }
}

-(void)buttonPressed{
    NSLog(@"Button Pressed");
    for(id key in self.ui)
    {
        NSObject *uiE = [self.ui objectForKey:key];
        NSLog(NSStringFromClass([uiE class]));
        if([uiE isKindOfClass:[UITextField class]])
        {    
            UITextField *tv = (UITextField*)uiE;
            NSLog(tv.text);
        }
        else
        {
            NSLog(@"Nope!");
        }
    }
}

@end
