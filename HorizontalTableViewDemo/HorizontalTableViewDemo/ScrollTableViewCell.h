//
//  ScrollTableViewCell.h
//  HorizontalTableViewDemo
//
//  Created by 张博添 on 2022/9/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScrollTableViewCell : UITableViewCell
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *horizontalTableView;
@property (nonatomic, weak) UIViewController<UITableViewDelegate, UITableViewDataSource> *ownerController;

@end

NS_ASSUME_NONNULL_END
