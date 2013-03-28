//
//  CruinneViewController.m
//  Cruinne
//
//  Created by JerryTaylorKendrick on 3/27/13.
//  Copyright (c) 2013 Jerry Taylor Kendrick. All rights reserved.
//

#import "CruinneViewController.h"
#import <Security/SecRandom.h>

@interface CruinneViewController ()

@end

@implementation CruinneViewController

@synthesize fortuneLabel;

// Variable to track count of button presses
NSInteger fortuneCount;
NSInteger randomValue;
NSString *selectedFortune;
BOOL overFreeLimit;


// Array to hold randon fortunes
NSMutableArray *randomFortunesArray;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
      //  [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Cruinne3.png"]]];
    }
    return self;
}
    
    
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //selectedFortune = @"";
    //fortuneLabel.text = [NSString stringWithFormat:@"%@", selectedFortune];
    //fortuneLabel.text = [NSString stringWithFormat:@"Your Fortune: %@",selectedFortune];
    // Initialize the fortune array
    randomFortunesArray = [[NSMutableArray alloc] init];
    
    [randomFortunesArray addObject:@"You will relocate to a new state."];
    [randomFortunesArray addObject:@"Your career responsibilities will change."];
    [randomFortunesArray addObject:@"Someone in your family is expecting a new baby."];
    [randomFortunesArray addObject:@"Your significant other had a near miss in traffic."];
    [randomFortunesArray addObject:@"You just met a colleague who will greatly impact your work."];
    [randomFortunesArray addObject:@"An old friend from high school will soon telephone you."];
    [randomFortunesArray addObject:@"You are about to come into some unexpected money."];
    [randomFortunesArray addObject:@"You will see your favorite car today."];
    [randomFortunesArray addObject:@"You should expect a change in the weather tomorrow."];
    [randomFortunesArray addObject:@"You will pick winning lottery numbers."];
    
    // Another way to initialize the array:
    // NSArray *randomFortunesArray = [[NSArray alloc]
    //                     initWithObjects:
    //                     @"Maybe",
    //                     @"Doesn't look good",
    //                     @"Probably not",
    //                     @"Better luck next time",
    //                     @"No way",
    //                     @"Heck no",
    //                     @"Hahahahaha",
    //                     nil];
    
    
}


-(IBAction) fortuneButton:(id) sender
{
    CruinneViewController* view;
    view = [CruinneViewController alloc];
    
    
    if (fortuneCount < 3) {
        ++fortuneCount;
        
        // Get a randon number to use in indexeing the randomFortunesArray
        randomValue = [CruinneViewController randomInRangeLo: 1 toHi:10];
        
        // Select a fortune string using this index
        selectedFortune = [randomFortunesArray objectAtIndex:randomValue];
        
        // Update the Label with the fortune string  each time the forturne button is pressed
        fortuneLabel.text = [NSString stringWithFormat:@"Your Fortune: %@",selectedFortune];
        
    } else {
        // Set a boolean variable to allow the fortune button to be hidden over
        // application restarts if the number of free uses has been exceeded:
        overFreeLimit = [[NSUserDefaults standardUserDefaults] boolForKey:@"overage"];
        
        // Code to implement an alert
        NSString *msg = @"Upgrade to the premium version of Cruinne";
        //NSString *msg = [[NSString alloc] initWithFormat:@"The number of presses of the fortune button is: %d",fortuneCount];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WARNING: Free Fortunes exceeded"
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    //[self presentViewController:view
    //                  animated:YES completion:Nil];
}

// Random number generator method
+ (u_int32_t)randomInRangeLo:(u_int32_t)loBound toHi:(u_int32_t)hiBound
{
    u_int32_t range = hiBound - loBound + 1;
    return loBound + arc4random_uniform(range);
}


    
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end



