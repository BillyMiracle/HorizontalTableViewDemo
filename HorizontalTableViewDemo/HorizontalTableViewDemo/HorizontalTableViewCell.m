//
//  HorizontalTableViewCell.m
//  HorizontalTableViewDemo
//
//  Created by 张博添 on 2022/9/5.
//

#import "HorizontalTableViewCell.h"

@implementation HorizontalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.backgroundColor = [UIColor lightGrayColor];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.nameLabel];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, 100, 100);
    self.nameLabel.frame = self.bounds;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
