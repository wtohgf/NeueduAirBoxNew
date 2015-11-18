//
//  NEUABThermometerSummaryView.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/18.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABThermometerSummaryView.h"
//#import "NEUABCounterView.h"
#import "NEUABThermometerView.h"
#import "NEUABThermometerTubeView.h"
@implementation NEUABThermometerSummaryView
//托空间初始化
//托空间初始化
-(void)awakeFromNib{
    [self layoutSubviewsofThermomete];
}

//代码创建初始化
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    [self layoutSubviewsofThermomete];
    return  self;
}

-(void)layoutSubviewsofThermomete{
    _kd = 20;
    _sc = [[NEUABThermometerTubeView alloc]init];
    _sc.backgroundColor = [UIColor clearColor];
    _zj = [[NEUABThermometerView alloc]init];
    _zj.backgroundColor = [UIColor clearColor];
    _ledcount = [[NEUABCounterView alloc]init];
    ;
    
    _ledcount.backgroundColor = [UIColor clearColor];
    [self insertSubview:_zj atIndex:1];
    [self insertSubview:_sc atIndex:2];
}


//重绘方法
-(void)drawRect:(CGRect)rect{
    
    [self drawscdcdt:rect];
    [self drawcount:rect];
    
}

//添加计数器
-(void)drawcount:(CGRect)rect{
    if(rect.size.width>rect.size.height){
        _ledcount.frame = CGRectMake(0, 0, 2*rect.size.height/3, rect.size.height/3);
    }else {
        _ledcount.frame = CGRectMake(0, 0, 2*rect.size.width/3, rect.size.width/3);
    }
    
    _ledcount.layer.position = CGPointMake(rect.size.width/2, rect.size.height/2);
    _ledcount.z = _z*50;
    [self insertSubview:_ledcount atIndex:0];
    
}

//添加上层,中间层，底层
-(void)drawscdcdt:(CGRect)rect{
    _sc.frame = rect;
    _zj.frame = rect;
    //宽度，值，宽度
    _sc.sc_kd = _kd+5;
    _zj.z = _z;
    _zj.zj_kd = _kd;
}



-(void)setKd:(float)kd{
    _kd = kd>20?20:kd;
    [self setNeedsDisplay];
}
-(void)setZ:(float)z{
    _z = z;
    [self setNeedsDisplay];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
