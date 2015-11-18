//
//  NEUABThermometerTubeView.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/18.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABThermometerTubeView.h"

@implementation NEUABThermometerTubeView
-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    [self layoutSubviewstoTube];
    return  self;
}
-(void)layoutSubviewstoTube{
    
    _shapelayer = [CAShapeLayer layer];
    _shapelayer.fillColor = [[UIColor clearColor]CGColor];
    _shapelayer.strokeColor = [[UIColor redColor] CGColor];
    _shapelayer.backgroundColor = [[UIColor clearColor] CGColor];
    _shapelayer.lineJoin = kCALineJoinRound;
    _shapelayer.lineCap = kCALineCapRound;
    _shapelayer.frame = CGRectMake(0, 0, 0, 0);
    
}
//参数
-(void)setcount:(CGRect)rect{
    _bj = (rect.size.height>rect.size.width?rect.size.width/2:rect.size.height/2)-_sc_kd/2;
    _point = CGPointMake(rect.size.width/2, rect.size.height/2);
    if(_shapelayer.frame.origin.x==0||
       _shapelayer.frame.origin.y==0||
       _shapelayer.frame.size.width==0||
       _shapelayer.frame.size.height==0){
        
        _shapelayer.frame = rect;
        _shapelayer.lineWidth = _sc_kd;
        UIBezierPath * apath = [UIBezierPath bezierPath];
        [apath addArcWithCenter:_point radius:_bj startAngle:M_PI/2 endAngle:2*M_PI clockwise:YES];
        _shapelayer.path = apath.CGPath;
        _shapelayer.strokeEnd = 1;
        
        //为了旋转角度
        _shapelayer.transform = CATransform3DMakeRotation(M_PI/4, 0, 0, 1);
        
    }
}
-(void)drawRect:(CGRect)rect{
    
    [self setcount:rect];
    [self draw_jby];
    [self draw_mb];
    //    [self draw_yy];
    
    
}


-(void)draw_mb{
    [self.layer setMask:_shapelayer];
}
-(void)draw_jby{
    CGFloat components[12]={
        0.0, 0.0, 0.0, 0.1,     //start color(r,g,b,alpha)
        1.0, 1.0, 1.0, 0.5,
        0.0, 0.0, 0.0, 0.1 //end color
    };
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(space, components, NULL,6);
    
    
    CGPoint start = _point;  //开始的点
    CGPoint end = _point; //结束的点
    CGFloat startRadius = _bj+_sc_kd/2;      //半径
    CGFloat endRadius = _bj-_sc_kd/1;          //空心半径
    CGContextRef graCtx = UIGraphicsGetCurrentContext();
    CGContextDrawRadialGradient(graCtx, gradient, start, startRadius, end, endRadius, 0);
}
-(void)setSc_kd:(float)sc_kd{
    _sc_kd = sc_kd;
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
