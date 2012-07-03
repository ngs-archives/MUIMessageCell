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

+ (CGFloat)cellHeightForMessageText:(NSString *)text direction:(MUIMessageCellDirection)direction {
  CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:14]
                 constrainedToSize:CGSizeMake(280, FLT_MAX)
                     lineBreakMode:UILineBreakModeCharacterWrap]; 
  return size.height + 63;
}

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
  CGFloat contentWidth = self.contentView.frame.size.width;
  self.backgroundImageView.contentMode = UIViewContentModeScaleToFill;
  if(self.direction == MUIMessageCellDirectionLeft)
    bgImage = [[UIImage imageNamed:@"ChatBubbleGray"] resizableImageWithCapInsets:UIEdgeInsetsMake(36, 38, 28, 38)];
  else
    bgImage = [[UIImage imageNamed:@"ChatBubbleBlue"] resizableImageWithCapInsets:UIEdgeInsetsMake(36, 28, 28, 38)];
  self.textLabel.numberOfLines = 0;
  self.textLabel.font = [UIFont systemFontOfSize:14];
  self.textLabel.lineBreakMode = UILineBreakModeCharacterWrap;
  self.textLabel.frame = CGRectMake(0, 27, contentWidth - 40, 0);
  [self.textLabel sizeToFit];
  self.textLabel.backgroundColor = [UIColor clearColor];
  //
  CGRect textFrame = self.textLabel.frame;
  CGSize textSize = textFrame.size;
  CGRect bgFrame = CGRectMake(0, 5, textSize.width + 33, textSize.height + 48);
  if(bgFrame.size.width < 100)
    bgFrame.size.width = 100;
  if(self.direction == MUIMessageCellDirectionLeft) {
    bgFrame.origin.x = 0;
    textFrame.origin.x = bgFrame.origin.x + 23;
  } else {
    bgFrame.origin.x = contentWidth - bgFrame.size.width;
    textFrame.origin.x = bgFrame.origin.x + 13;
  }
  self.textLabel.frame = textFrame;
  self.backgroundImageView.frame = bgFrame;
  self.selectionStyle = UITableViewCellSelectionStyleNone;
  self.backgroundImageView.image = bgImage;
}



@end
