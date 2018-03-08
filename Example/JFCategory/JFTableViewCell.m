//
//  JFTableViewCell.m
//  JFCategory_Example
//
//  Created by junfeng.li on 2018/3/8.
//  Copyright © 2018年 git. All rights reserved.
//

#import "JFTableViewCell.h"
#import "UIImageView+JFAdd.h"

@interface JFTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *oneImageView;
@property (weak, nonatomic) IBOutlet UIImageView *twoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *threeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *fourImageView;

@end

@implementation JFTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSArray *imageViewArray = @[self.oneImageView, self.twoImageView, self.threeImageView, self.fourImageView];
    for (UIImageView *imageView in imageViewArray) {
        imageView.layer.cornerRadius = 20.0;
        imageView.layer.masksToBounds = YES;
//        imageView.jf_cornerRadius = 20.0;
    }
}

- (void)updateCell {
    self.oneImageView.image = [UIImage imageNamed:@"1"];
    self.twoImageView.image = [UIImage imageNamed:@"2"];
    self.threeImageView.image = [UIImage imageNamed:@"1"];
    self.fourImageView.image = [UIImage imageNamed:@"2"];
}

@end
