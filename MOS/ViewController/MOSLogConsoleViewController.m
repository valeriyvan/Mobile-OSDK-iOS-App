//
//  MOSLogConsoleViewController.m
//  MOS
//
//
//  Copyright © 2016 DJI. All rights reserved.
//

#import "MOSLogConsoleViewController.h"
#import "MOSModel.h"

@interface MOSLogConsoleViewController ()

@end

@implementation MOSLogConsoleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    self.appDelegate.model.logChangedBlock = ^{
        [self updateLogView];
    };
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self updateLogView];
}

- (void)updateLogView {
    NSString *fullLog = @"";
    
    NSInteger index = 0;
    NSArray *logs = self.appDelegate.model.logs;
    for (index = logs.count -1; index+1; index--) {
        NSDictionary *logEntry = logs[index];
        NSDate *timestamp = logEntry[@"timestamp"];
        NSString *log = logEntry[@"log"];
        
        fullLog = [fullLog stringByAppendingFormat:@"%@ - %@\n", timestamp, log];
    }

    self.logView.text = fullLog;
}

@end
