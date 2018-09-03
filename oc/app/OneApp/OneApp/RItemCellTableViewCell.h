//
//  RItemCellTableViewCell.h
//  OneApp
//
//  Created by lijunjie on 03/09/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RItemCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *serialNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end
