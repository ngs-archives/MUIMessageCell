//
//  MUIMessageCell.h
//  MessagesUIDemo
//
//  Created by Atsushi Nagase on 7/3/12.
//  Copyright (c) 2012 LittleApps Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
  MUIMessageCellDirectionLeft,
  MUIMessageCellDirectionRight
} MUIMessageCellDirection;

@interface MUIMessageCell : UITableViewCell

@property (nonatomic) MUIMessageCellDirection direction;

@end
