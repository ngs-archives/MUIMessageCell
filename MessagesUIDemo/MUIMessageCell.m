//
//  MUIMessageCell.m
//  MessagesUIDemo
//
//  Created by Atsushi Nagase on 7/3/12.
//  Copyright (c) 2012 LittleApps Inc. All rights reserved.
//

#import "MUIMessageCell.h"

@interface MUIMessageCell ()

@property (readonly) UIImageView *backgroundImageView;

@end

@implementation MUIMessageCell
@synthesize direction = _direction
, backgroundImageView = _backgroundImageView
;

- (void)setDirection:(MUIMessageCellDirection)direction {
  _direction = direction;
  [self setNeedsLayout];
}

- (MUIMessageCellDirection)direction {
  return _direction;
}

- (UIImageView *)backgroundImageView {
  if(nil==_backgroundImageView) {
    _backgroundImageView = [[UIImageView alloc] init];
    self.backgroundView = _backgroundImageView;
  }
  return _backgroundImageView;
}


- (void)layoutSubviews {
  [super layoutSubviews];
  UIImage *bgImage = nil;
  CGFloat left = 0;
  if(self.direction == MUIMessageCellDirectionLeft) {
    bgImage = [[UIImage imageNamed:@"ChatBubbleGray"] resizableImageWithCapInsets:UIEdgeInsetsMake(36, 38, 28, 38)];
    left = 38;
  } else {
    bgImage = [[UIImage imageNamed:@"ChatBubbleBlue"] resizableImageWithCapInsets:UIEdgeInsetsMake(36, 28, 28, 38)];
    left = 28;
  }
  self.textLabel.font = [UIFont systemFontOfSize:14];
  self.textLabel.lineBreakMode = UILineBreakModeCharacterWrap;
  self.textLabel.frame = CGRectMake(left, 38, self.contentView.frame.size.width - 80, 0);
  [self.textLabel sizeToFit];
  self.textLabel.backgroundColor = [UIColor clearColor];
  //
  self.backgroundImageView.frame = self.contentView.frame;
  self.selectionStyle = UITableViewCellSelectionStyleNone;
  self.backgroundImageView.image = bgImage;
}



@end
