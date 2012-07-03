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

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"MUIMessageCell";
  MUIMessageCell *cell = (MUIMessageCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if(!cell) {
    cell = [[MUIMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  cell.direction = indexPath.row % 2 == 1 ? MUIMessageCellDirectionLeft : MUIMessageCellDirectionRight;
  switch (indexPath.row) {
    case 0:
      cell.textLabel.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
      break;
    case 1:
      cell.textLabel.text = @"Integer feugiat rutrum mauris, et ultricies erat porttitor et. Suspendisse odio magna, condimentum at egestas vitae, porta a nisi.";
      break;
    case 2:
      cell.textLabel.text = @"Morbi sodales sollicitudin nisl, sed suscipit enim tempor nec. Sed sed lectus quis metus iaculis dignissim quis vitae lorem.";
      break;
    case 3:
      cell.textLabel.text = @"Ut egestas pulvinar nisi ut eleifend.";
      break;
    case 4:
      cell.textLabel.text = @"Ut condimentum laoreet laoreet. Aenean egestas tortor.";
      break;
  }
  return cell;
}


@end
