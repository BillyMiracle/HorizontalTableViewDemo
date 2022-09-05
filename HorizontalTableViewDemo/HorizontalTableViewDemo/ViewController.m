//
//  ViewController.m
//  HorizontalTableViewDemo
//
//  Created by 张博添 on 2022/9/5.
//
#import "ViewController.h"
#import "ScrollTableViewCell.h"
#import "HorizontalTableViewCell.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableViewVertical;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableViewVertical = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height - 100) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableViewVertical];
    _tableViewVertical.delegate = self;
    _tableViewVertical.dataSource = self;
    [_tableViewVertical registerClass:[ScrollTableViewCell class] forCellReuseIdentifier:@"scrollCells"];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == _tableViewVertical) {
        return 1;
    } else {
        return 10;
    }
    return 0;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _tableViewVertical) {
        return 20;
    } else {
        return 1;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _tableViewVertical) {
        return 100;
    } else {
        return 100;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (tableView == _tableViewVertical) {
        return 0;
    } else {
        return 20;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _tableViewVertical) {
        ScrollTableViewCell *cell = [self.tableViewVertical dequeueReusableCellWithIdentifier:@"scrollCells" forIndexPath:indexPath];
    //    NSLog(@"%p", cell);
        cell.tag = indexPath.section * 1000 + indexPath.row;
        cell.horizontalTableView.tag = indexPath.section * 1000 + indexPath.row;
//        [cell setNeedsLayout];
//        NSLog(@"cell.horizontalTableView : %p %ld", cell.horizontalTableView, cell.horizontalTableView.tag);
        cell.ownerController = self;
        [cell.horizontalTableView setContentOffset:CGPointMake(0, 0)];
        [cell.horizontalTableView reloadData];
        return cell;
        
    } else {
        
        HorizontalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"horizontalCells" forIndexPath:indexPath];
        cell.transform = CGAffineTransformMakeRotation(M_PI / 2);
//        NSLog(@"                           %p %ld", tableView, tableView.tag);
//        NSLog(@"%ld", tableView.tag);
        
        cell.nameLabel.text = [NSString stringWithFormat:@"%ld %ld %ld", tableView.tag / 1000, tableView.tag % 1000, indexPath.section];
        cell.nameLabel.tintColor = [UIColor blackColor];
        
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"%ld %ld", tableView.tag % 1000, indexPath.section);
}


@end

