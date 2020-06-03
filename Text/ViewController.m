//
//  ViewController.m
//  Text
//
//  Created by smppw_zwq on 2020/5/28.
//  Copyright © 2020 smppw_zwq. All rights reserved.
//
#define kScreenHeight         [[UIScreen mainScreen] bounds].size.height
// 获取屏幕宽度 即:整屏的宽度
#define kScreenWidth            [[UIScreen mainScreen] bounds].size.width
#define kNavHeight   ([[UIApplication sharedApplication] statusBarFrame].size.height+44)


#define tabbarBottom        34

#import "ViewController.h"
#import "UIView+LBFrame.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)UITableView * rankingFundTableView;
@property(nonatomic,strong)UIView * fundLocationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];;
    [self.view addSubview:self.rankingFundTableView];
    [self creatFundLocationView];

}

- (void)creatFundLocationView{

    self.fundLocationView = [[UIView alloc]initWithFrame:CGRectMake(12, kScreenHeight-45-10-kNavHeight-tabbarBottom, kScreenWidth-12*2, 45)];
    self.fundLocationView.backgroundColor = [UIColor yellowColor];
    self.fundLocationView.layer.cornerRadius=2;
    self.fundLocationView.clipsToBounds = YES;
    [self.view addSubview:self.fundLocationView];
        
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    if(velocity.y>0){

        self.fundLocationView.top = kScreenHeight;
        [self.view endEditing:YES];
    }
    else{

        self.fundLocationView.bottom= kScreenHeight-kNavHeight-10-tabbarBottom;

    }
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;{

    NSLog(@"已经结束了");
    [UIView animateWithDuration:0.2 animations:^{
       
        self.fundLocationView.bottom= kScreenHeight-kNavHeight-10-tabbarBottom;
        [self.view endEditing:YES];

    }];
    

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{
    
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    return 45;;
}



- (UITableView *)rankingFundTableView{
    
    if (!_rankingFundTableView) {
         
        _rankingFundTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,kNavHeight+ 40, kScreenWidth, kScreenHeight-40-kNavHeight) style:UITableViewStylePlain];

        _rankingFundTableView.dataSource = self;
        _rankingFundTableView.delegate = self;
    }

    
    return _rankingFundTableView;
    
    
}


@end
