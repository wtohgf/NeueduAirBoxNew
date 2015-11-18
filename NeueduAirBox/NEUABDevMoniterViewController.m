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


//@property(nonatomic)NSTimer*timer;
@property(nonatomic)UITextField*settime;
@property(nonatomic)NSString*timenume;

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
     _timenume=@"1.f";
    // Do any additional setup after loading the view.
    
    //添加设置ChartView
    [self setupChartViews];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backPage:)];
    [self addThermometer];
    
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
    NSLog(@"randomData%f",randomData);
     _Thermometer.z=randomData;
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
#pragma make - 温度计

-(void)addThermometer{

    if (self) {
        _Thermometer = [[NEUABThermometerSummaryView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.height/2)];
        _Thermometer.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_Thermometer];
        
    //已下备注为有用的    
        
        
//        UIButton*button=[[UIButton alloc]initWithFrame:CGRectMake(20, self.view.bounds.size.height-100, 150, 50)];
//        [button addTarget:self action:@selector(Random) forControlEvents:UIControlEventTouchUpInside];
//        [button setTitle:@"点我产生随机数" forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        button.backgroundColor=[UIColor yellowColor];
//        [self.view addSubview:button];
//        
//        
//        UIButton*autobutton=[[UIButton alloc]initWithFrame:CGRectMake(200, self.view.bounds.size.height-100, 150, 50)];
//        [autobutton addTarget:self action:@selector(autotime) forControlEvents:UIControlEventTouchUpInside];
//        [autobutton setTitle:@"点我自动获取温度" forState:UIControlStateNormal];
//        [autobutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        autobutton.backgroundColor=[UIColor redColor];
//        [self.view addSubview:autobutton];
//        
//        UIButton*stoptime=[[UIButton alloc]initWithFrame:CGRectMake(200, self.view.bounds.size.height-50, 50, 50)];
//        [stoptime addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
//        [stoptime setTitle:@"stop" forState:UIControlStateNormal];
//        [stoptime setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        stoptime.backgroundColor=[UIColor blueColor];
//        [self.view addSubview:stoptime];
//        
//        
        
//        UIButton*Settime=[[UIButton alloc]initWithFrame:CGRectMake(200, 80, 50, 50)];
//        [Settime addTarget:self action:@selector(set) forControlEvents:UIControlEventTouchUpInside];
//        [Settime setTitle:@"确认" forState:UIControlStateNormal];
//        [Settime setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        Settime.backgroundColor=[UIColor grayColor];
//        [self.view addSubview:Settime];
//        
//        
//        
//        UITextField*setimetest=[[UITextField alloc]initWithFrame:CGRectMake(50, 20.f, 250, 50)];
//        //        [Settime addTarget:self action:@selector(set) forControlEvents:UIControlEventTouchUpInside];
//        [setimetest setPlaceholder:@"点此输入时间间隔（格式为s）"];
//        setimetest.textColor=[UIColor blackColor];
//        
//        setimetest.backgroundColor=[UIColor grayColor];
//        _settime=setimetest;
//        
//        [self.view addSubview:setimetest];
        
        
        //        UIStepper * stepper = [[UIStepper alloc]initWithFrame:CGRectMake(110, self.view.bounds.size.height-100, 100, 50)];
        //        [stepper addTarget:self action:@selector(kaishi:) forControlEvents:UIControlEventTouchDown];
        //        stepper.minimumValue = 0.0f;
        //        stepper.maximumValue = 52.0f;
        //        stepper.value = 0.0f;
        //        stepper.stepValue = 1.0f;
        //        [self.view addSubview:stepper];
        
        
        
        
    }

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
    
    
}
//已下备注为有用的
//-(void)Random{
//    
////    CGFloat randomData = (CGFloat)(arc4random_uniform(5000)/1.f);
////    randomData=randomData*2;
////    randomData=randomData/10000;
//    
//   
//    
//}
//-(void)autotime{
//    
//    _timer =  [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(function) userInfo:nil repeats:YES];
//}
//
//-(void)function{
//    [self Random];
//    
//    
//    
//}
//-(void)stop{
//    [_timer setFireDate:[NSDate distantFuture]];
//    
//}
//-(void)kaishi:(UIStepper*)stepper{
//    _Thermometer.z =stepper.value/50;
//}
//-(void)set{
//    
//    
//    
//}


@end
