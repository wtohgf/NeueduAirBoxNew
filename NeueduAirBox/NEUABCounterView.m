//
//  NEUABCounterView.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/18.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABCounterView.h"

@implementation NEUABCounterView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self layoutSubviewsofcount] ;
    return  self;
}
-(void)awakeFromNib{
    [self layoutSubviewsofcount];

}
-(void)layoutSubviewsofcount{

    _gradientlayer = [CAGradientLayer layer];
    _arrayColor = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:170 green:168 blue:168 alpha:1]CGColor],(id)[[UIColor whiteColor]CGColor ],nil];
    _gradientlayer.colors = _arrayColor;
    _gradientlayer.startPoint = CGPointMake(0, 0);
    _gradientlayer.endPoint = CGPointMake(0,1.5);
    
    _gradientlayer.cornerRadius = 7.0;
    
    _gradientlayer2 = [CAGradientLayer layer];
    _arrayColor2 = [NSArray arrayWithObjects:(id)[[UIColor clearColor]CGColor],(id)[[UIColor colorWithRed:1 green:1 blue:1 alpha:0.6]CGColor ],[[UIColor clearColor] CGColor],nil];
    _gradientlayer2.colors = _arrayColor2;
    _gradientlayer2.startPoint = CGPointMake(0, 0);
    _gradientlayer2.endPoint = CGPointMake(0.9,1.2);
    
    _gradientlayer2.cornerRadius = 7.0;
    
    _label = [[UILabel alloc]init];
    _label.textAlignment = 1;
    _label.textColor = [UIColor blackColor];
    
    
    _label2 = [[UILabel alloc]init];
    _label2.textAlignment = 1;
    _label2.textColor = [UIColor redColor];
    
    
    
    [self.layer addSublayer:_gradientlayer];
    [self.layer addSublayer:_gradientlayer2];
    [self insertSubview:_label atIndex:1];
    [self insertSubview:_label2 atIndex:1];


}


-(void)drawRect:(CGRect)rect{
    [self setfount:rect];
    



}
-(void)setfount:(CGRect)rect{
    
    _gradientlayer.frame = rect;
    _gradientlayer2.frame = rect;
    
    _label.frame = rect;
    //led字体
    _font1 = [UIFont fontWithName:@"DBLCDTempBlack" size:rect.size.height/2];
    _label.font = _font1;
    _label.text = [NSString stringWithFormat:@"%.2f",_z];
    
    _label2.frame = CGRectMake(4*rect.size.width/5, 0, rect.size.width/5, rect.size.height/3);
    _font2 = [UIFont fontWithName:@"DBLCDTempBlack" size:rect.size.height/4];
    _label2.font = _font2;
    _label2.text = @"℃";
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setZ:(float)z{
    _z = z;
    [self setNeedsDisplay];
}

@end
