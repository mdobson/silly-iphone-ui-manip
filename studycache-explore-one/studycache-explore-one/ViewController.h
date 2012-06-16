//
//  ViewController.h
//  studycache-explore-one
//
//  Created by Matthew Dobson on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UITextField * test;
    NSDictionary * ui;
}

@property (nonatomic, retain) IBOutlet UITextField * test;
@property (nonatomic, retain) NSDictionary * ui;

@end
