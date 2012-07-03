//
//  MUIExampleTableViewController.m
//  MessagesUIDemo
//
//  Created by Atsushi Nagase on 7/3/12.
//  Copyright (c) 2012 LittleApps Inc. All rights reserved.
//

#import "MUIExampleTableViewController.h"
#import "MUIMessageCell.h"

@implementation MUIExampleTableViewController
@synthesize dummyTexts = _dummyTexts;

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  self.tableView.backgroundColor = [UIColor colorWithRed:0.859 green:0.882 blue:0.929 alpha:1.000];
  self.dummyTexts = [NSArray arrayWithObjects:
                     @"Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                     @"Integer feugiat rutrum mauris, et ultricies erat porttitor et. Suspendisse odio magna, condimentum at egestas vitae, porta a nisi.",
                     @"Morbi sodales sollicitudin nisl, sed suscipit enim tempor nec. Sed sed lectus quis metus iaculis dignissim quis vitae lorem.",
                     @"Ut egestas pulvinar nisi ut eleifend.",
                     @"Ut condimentum laoreet laoreet. Aenean egestas tortor.",
                     @"Ut",
                     @"Ut",
                     nil];
                     
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.dummyTexts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"MUIMessageCell";
  MUIMessageCell *cell = (MUIMessageCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if(!cell) {
    cell = [[MUIMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  cell.direction = indexPath.row % 2 == 1 ? MUIMessageCellDirectionLeft : MUIMessageCellDirectionRight;
  cell.textLabel.text = [self.dummyTexts objectAtIndex:indexPath.row];
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  MUIMessageCellDirection dir = indexPath.row % 2 == 1 ? MUIMessageCellDirectionLeft : MUIMessageCellDirectionRight;
  return [MUIMessageCell cellHeightForMessageText:[self.dummyTexts objectAtIndex:indexPath.row]
                                        direction:dir];
}


@end
