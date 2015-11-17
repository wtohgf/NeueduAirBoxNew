//
//  NEUABHomeViewController.m
//  NeueduAirBox
//
//  Created by hegf on 15/11/16.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABHomeViewController.h"

@interface NEUABHomeViewController ()
@property (strong, nonatomic) EFAnimationViewController* viewController;

@property (strong, nonatomic) NSDictionary *MenuDict;
@end

@implementation NEUABHomeViewController


- (void)dealloc {
    
    [_viewController.view removeFromSuperview];
    [_viewController removeFromParentViewController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubView];
    
    _MenuDict = @{@"1000":@"LogRegNav",
                   @"1001":@"DevMngNav",
                   @"1002":@"DevMoniterNav",
                   @"1003":@"SettingNav",
                   @"1004":@"OtherNav"};
}

-(void)setupSubView{
    self.viewController = ({
        EFAnimationViewController *viewController = [[EFAnimationViewController alloc] init];
        
        [self.view addSubview:viewController.view];
        [self addChildViewController:viewController];
        [viewController didMoveToParentViewController:self];
        viewController;
    });
    
    UIButton* startButton = [[UIButton alloc]init];
    [startButton setTitle:@"GO..." forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    startButton.bounds = CGRectMake(0, 0, 100, 30);
    startButton.center = CGPointMake(self.view.frame.size.width*0.5, self.view.frame.size.height-80.f);
    startButton.backgroundColor = [UIColor blackColor];
    
    [startButton addTarget:self action:@selector(startButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:startButton];
}

-(void)startButtonClicked:(UIButton*)sender{
    NSLog(@"curTag %li", self.viewController.currentTag);
    
    NSMutableString* sbName = [_MenuDict[[NSString stringWithFormat:@"%li", self.viewController.currentTag]]mutableCopy];
                                 
    [sbName replaceOccurrencesOfString:@"Nav" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, sbName.length)];
    
    UIStoryboard* sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    
    UINavigationController* nav = [sb instantiateViewControllerWithIdentifier:_MenuDict[[NSString stringWithFormat:@"%li", self.viewController.currentTag]]];
    
    [self presentViewController:nav animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
