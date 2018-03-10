//
//  MOSDynamicTableViewCell.m
//  MOS
//
//
//  Copyright © 2016 DJI. All rights reserved.
//

#import "MOSDynamicTableViewCell.h"
#import "MOSAction.h"

@interface MOSDynamicTableViewCell()

@property (strong, nonatomic) MOSAction *actionModel;

@end

@implementation MOSDynamicTableViewCell

- (IBAction)go:(id)sender {
    if (self.goAction) {
        NSNumber *cmdId =  self.actionModel.cmdID;
        NSArray *arguments = @[];
        
        self.goAction(cmdId, arguments);
    }
    
}

- (void)populateWithActionModel:(MOSAction *)actionModel {
    self.actionModel = actionModel;
    
    self.cmdIdLabel.text = [NSString stringWithFormat:@"%@", actionModel.cmdID];
    self.commandLabel.text = actionModel.label;
    self.commandInformation.text = actionModel.information;
    self.commandResultLabel.text = @"";

}

@end
