//
//  MJHumanView.m
//  02-小黄人
//
//  Created by 王金红 on 15/7/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MJHumanView.h"
#define MJRadius 70
#define MJTopY 100
@implementation MJHumanView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //1.显示上下文
    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    drawBody(ctx,rect);
    drawZui(ctx, rect);
    drawEys(ctx, rect);
    drawhair(ctx, rect);
    
    
    
}
/**
 画身体
 */
void drawBody(CGContextRef ctx ,CGRect rect )
{
    //2身体
    //上半圆
    CGFloat topx = rect.size.width*0.5;
    CGFloat topy = MJTopY;
    CGFloat topRadius =MJRadius;
    CGContextAddArc(ctx, topx, topy, topRadius, 0, M_PI, 1);
    //向下延展身体
    CGFloat middleX = topx -topRadius;
    CGFloat middleh = 130;
    CGFloat middley = topy +middleh;
    CGContextAddLineToPoint(ctx, middleX, middley);
    
    //下半圆
    CGFloat bottomx = topx;
    CGFloat bottomy = middley;
    CGFloat bottomRadius = topRadius;
    CGContextAddArc(ctx, bottomx, bottomy, bottomRadius, M_PI, 0, 1);
    //合并路径
    CGContextClosePath(ctx);
    //设置颜色:或者可以用rgb
    [[UIColor yellowColor]set];
    
    //显示绘制的东西
    CGContextFillPath(ctx);


}
/**
 画嘴
 */
void drawZui(CGContextRef ctx ,CGRect rect )

{
    CGFloat controlx = rect.size.width*0.5;
    CGFloat controly = rect.size.height*0.45;
    //当前点
    CGFloat marginx = 30;
    CGFloat marginy = 30;
    CGFloat currentx = controlx -marginx;
    CGFloat currenty = controly - marginy ;
    
    
    CGContextMoveToPoint(ctx, currentx, currenty);

   //结束点
    CGFloat endx = controlx +marginx;
    CGFloat endy =  currenty;
    //贝塞尔曲线
    CGContextAddQuadCurveToPoint(ctx, controlx, controly, endx, endy);
    [[UIColor blackColor]set];
    
    //渲染
    CGContextStrokePath(ctx);
    
}
void drawEys(CGContextRef ctx ,CGRect rect )

{
//1,黑色绑带
    CGFloat startx = rect.size.width*0.5 - MJRadius;
    CGFloat starty = MJTopY;
    
    CGContextMoveToPoint(ctx, startx, starty);
    CGFloat endx = startx +2*MJRadius;
    CGFloat endy =  starty;
    CGContextAddLineToPoint(ctx, endx  ,endy );
    CGContextSetLineWidth(ctx, 15);
    
    [[UIColor blackColor]set];
    //线条
    CGContextStrokePath(ctx);
    //2，最外圈的镜框
    [[UIColor  grayColor]set];
    CGFloat kuangRadius = MJRadius*0.4;
    CGFloat kuangY = starty;
    CGFloat kuangx = rect.size.width *0.5 -kuangRadius;
    CGContextAddArc(ctx, kuangx, kuangY, kuangRadius, 0, M_PI*2, 1);
    CGContextFillPath(ctx);
    CGFloat kuangx2 = rect.size.width *0.5 +kuangRadius;
    CGContextAddArc(ctx, kuangx2, kuangY, kuangRadius, 0, M_PI*2, 1);
    CGContextFillPath(ctx);

    //3 里面的白色框
    [[UIColor whiteColor]set];
    CGFloat whiteRadius = kuangRadius * 0.7;
    CGFloat whiteX = kuangx;
    CGFloat whitey = kuangY;
    CGContextAddArc(ctx, whiteX, whitey, whiteRadius, 0, M_PI*2, 1);
    CGContextFillPath(ctx);
    
    CGContextAddArc(ctx, kuangx2, whitey, whiteRadius, 0, M_PI*2, 1);
    CGContextFillPath(ctx);
   //在往里面一个圈圈
    [[UIColor  brownColor]set];
    CGFloat threex =kuangRadius * 0.8;
    

}
void drawhair(CGContextRef ctx ,CGRect rect )
{
    //1根
    CGFloat onex = rect.size.width*0.5;
    CGFloat oney = MJTopY -MJRadius;
    CGContextMoveToPoint(ctx, onex, oney);
    CGContextAddLineToPoint(ctx, onex, 10);
    CGContextSetLineWidth(ctx, 3);
    //2根
    CGContextMoveToPoint(ctx, onex-8, oney-1);
    CGContextAddLineToPoint(ctx, onex-15, 10);
    CGContextSetLineWidth(ctx, 3);
    //3根
    CGContextMoveToPoint(ctx, onex+8, oney-1);
    CGContextAddLineToPoint(ctx, onex+15, 10);
    CGContextSetLineWidth(ctx, 3);
    [[UIColor blackColor]set];
    
    
    CGContextStrokePath(ctx);
    
  


}

@end
