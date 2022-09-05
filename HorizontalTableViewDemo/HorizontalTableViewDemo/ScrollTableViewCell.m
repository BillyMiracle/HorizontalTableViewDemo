//
//  ScrollTableViewCell.m
//  HorizontalTableViewDemo
//
//  Created by 张博添 on 2022/9/5.
//

#import "ScrollTableViewCell.h"
#import "HorizontalTableViewCell.h"

@implementation ScrollTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.horizontalTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.horizontalTableView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
//    self.horizontalTableView.tag = self.tag;
    
    
    [self.horizontalTableView registerClass:[HorizontalTableViewCell class] forCellReuseIdentifier:@"horizontalCells"];
//    self.horizontalTableView.delegate = self;
//    self.horizontalTableView.dataSource = self;
    
    [self.contentView addSubview:self.horizontalTableView];
    return self;
}

- (void)setOwnerController:(UIViewController<UITableViewDelegate, UITableViewDataSource> *)ownerController {
    _ownerController = ownerController;
    self.horizontalTableView.delegate = ownerController;
    self.horizontalTableView.dataSource = ownerController;
//    self.horizontalTableView.delegate = self;
//    self.horizontalTableView.dataSource = self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.horizontalTableView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
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

