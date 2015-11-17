//
//  NEUABDevMoniterViewController.m
//  NeueduAirBox
//
//  Created by hegf on 15/11/17.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABDevMoniterViewController.h"

#define HMargin 20.f
#define VMargin 80.f

typedef NS_ENUM(NSInteger, JBLineChartLine){
    JBLineChartLineSolid,
    JBLineChartLineDashed,
    JBLineChartLineCount
};


CGFloat const kJBLineChartViewControllerChartSolidLineWidth = 6.0f;
CGFloat const kJBLineChartViewControllerChartSolidLineDotRadius = 5.0f;
CGFloat const kJBLineChartViewControllerChartDashedLineWidth = 2.0f;

#define kJBColorLineChartControllerBackground [UIColor colorWithRed:0xb7/0xff green:0xe3/0xff blue:0xe4/0xff alpha:1.0]

#define kJBColorLineChartDefaultSolidLineColor [UIColor colorWithWhite:1.0 alpha:0.5]
#define kJBColorLineChartDefaultSolidSelectedLineColor [UIColor colorWithWhite:1.0 alpha:1.0]
#define kJBColorLineChartDefaultDashedLineColor [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0]
#define kJBColorLineChartDefaultDashedSelectedLineColor [UIColor colorWithWhite:1.0 alpha:1.0]

@interface NEUABDevMoniterViewController ()

@property (weak, nonatomic) JBLineChartView* lineCharView;

@property (strong, nonatomic) NSMutableArray* lineData;

@property (strong, nonatomic) NSTimer* timer;
@end


@implementation NEUABDevMoniterViewController

-(NSArray *)lineData{
    if (_lineData == nil) {
        _lineData = [NSMutableArray arrayWithArray:@[@0.3, @0.2, @0.1, @0.45, @0.7]];
    }
    return _lineData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //添加设置ChartView
    [self setupChartViews];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backPage:)];
}

-(void)backPage:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSTimer* timer = [NSTimer timerWithTimeInterval:3.0f target:self selector:@selector(updateChartData) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
    _timer = timer;
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_timer invalidate];
    _timer = nil;
}

-(void)updateChartData{
    //从服务器获取实时数据更新，此处进行模拟
    for (int i=0; i<_lineData.count-1; i++) {
        [_lineData replaceObjectAtIndex:i withObject:_lineData[i+1]];
    }
    
    CGFloat randomData = (CGFloat)(arc4random_uniform(1000)/1000.f);
    
    [_lineData replaceObjectAtIndex:_lineData.count-1 withObject:[NSNumber numberWithFloat:randomData]];
    
    [_lineCharView reloadData];
    
}

-(void)setupChartViews{
    
    //设置LineChartView
    CGFloat lineChartX = HMargin;
    CGFloat lineChartY = VMargin;
    CGFloat lineChartW = self.view.frame.size.width-2*HMargin;
    CGFloat lineCHartH = lineChartW*0.6;
    
    JBLineChartView* lineChartView = [[JBLineChartView alloc]initWithFrame:CGRectMake(lineChartX, lineChartY, lineChartW, lineCHartH)];
    _lineCharView = lineChartView;
    [self.view addSubview:lineChartView];
    lineChartView.dataSource = self;
    lineChartView.delegate = self;
    lineChartView.backgroundColor = kJBColorLineChartControllerBackground;
    
    [lineChartView reloadData];
    
}

-(NSUInteger)numberOfLinesInLineChartView:(JBLineChartView *)lineChartView{
    return 1;
}

-(NSUInteger)lineChartView:(JBLineChartView *)lineChartView numberOfVerticalValuesAtLineIndex:(NSUInteger)lineIndex{
    return 5;
}

- (BOOL)lineChartView:(JBLineChartView *)lineChartView showsDotsForLineAtLineIndex:(NSUInteger)lineIndex
{
    return lineIndex == JBLineChartViewLineStyleDashed;
}

- (BOOL)lineChartView:(JBLineChartView *)lineChartView smoothLineAtLineIndex:(NSUInteger)lineIndex
{
    return lineIndex == JBLineChartViewLineStyleSolid;
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView colorForLineAtLineIndex:(NSUInteger)lineIndex
{
    return (lineIndex == JBLineChartLineSolid) ? kJBColorLineChartDefaultSolidLineColor: kJBColorLineChartDefaultDashedLineColor;
}

- (UIColor *)lineChartView:(JBLineChartView *)lineChartView colorForDotAtHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
    return (lineIndex == JBLineChartLineSolid) ? kJBColorLineChartDefaultSolidLineColor: kJBColorLineChartDefaultDashedLineColor;
}

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView widthForLineAtLineIndex:(NSUInteger)lineIndex
{
    return kJBLineChartViewControllerChartSolidLineWidth;
}

- (CGFloat)lineChartView:(JBLineChartView *)lineChartView dotRadiusForDotAtHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex
{
    return kJBLineChartViewControllerChartSolidLineDotRadius;
}


-(CGFloat)lineChartView:(JBLineChartView *)lineChartView verticalValueForHorizontalIndex:(NSUInteger)horizontalIndex atLineIndex:(NSUInteger)lineIndex{
    return [self.lineData[horizontalIndex] floatValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
