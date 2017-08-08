//
//  ViewController.m
//  列表的占位图
//
//  Created by 波 on 2017/8/8.
//  Copyright © 2017年 波波. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+HD_NoList.h"
#import "UIView+Extension.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tabView;
///<#annotation#>
@property(nonatomic,assign)int datas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabView.dataSource = self;
    self.tabView.delegate = self;
    self.tabView.tableFooterView = [[UIView alloc]init];
    self.datas = 20;
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)hareDatasAction:(id)sender {
    self.datas = 20;
    [self.tabView reloadData];
    
    [self NeedResetNoView];
    
    
}
- (IBAction)noDatasAction:(id)sender {
    self.datas = 0;
    [self.tabView reloadData];
    [self NeedResetNoView];
}

- (void)NeedResetNoView{
    if (self.datas>0) {
        [self.tabView dismissNoView];
    }else{
        [self.tabView showNoView:@"怎么没有数据那???" image:nil certer:CGPointZero];
        
    }
    
}


#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
 
    
    NSLog(@"%ld",indexPath.row);
}

@end
