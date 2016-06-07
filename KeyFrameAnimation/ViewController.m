//
//  ViewController.m
//  KeyFrameAnimation
//
//  Created by ORCHAN on 31/3/16.
//  Copyright © 2016年 ORCHAN. All rights reserved.
//

#import "ViewController.h"

#define kCornerRadiusOfImage CGRectGetWidth(_imgVAnimation.frame)/2.0

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgVAnimation;
@property (weak, nonatomic) IBOutlet UIButton *btnAnimation1;
@property (weak, nonatomic) IBOutlet UIButton *btnAnimation2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
<<<<<<< HEAD
    [self.view setBackgroundColor:[UIColor yellowColor]];
=======
    [self.view setBackgroundColor:[UIColor blackColor]];
>>>>>>> dev
    [self layoutUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)layoutUI {
    //图片视图
    _imgVAnimation.layer.masksToBounds = YES;
    _imgVAnimation.layer.cornerRadius = kCornerRadiusOfImage;
    _imgVAnimation.layer.borderColor = [UIColor greenColor].CGColor;
    _imgVAnimation.layer.borderWidth = 1.0;
    
    //按钮
    [self modifyLayerForButton:_btnAnimation1];
    [self modifyLayerForButton:_btnAnimation2];
}

- (void)modifyLayerForButton:(UIButton *)btn {
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 4.0;
    btn.layer.borderColor = [UIColor grayColor].CGColor;
    btn.layer.borderWidth = 2.0;
}

- (IBAction)btnAnimation1:(UIButton *)sender {
    //移到右下角；使用关键帧动画，移动路径为预定的贝塞尔曲线路径
    CGPoint fromPoint = _imgVAnimation.center;
    CGFloat toPointX = self.view.frame.size.width - kCornerRadiusOfImage;
    CGFloat toPointY = self.view.frame.size.height - kCornerRadiusOfImage;
    CGPoint toPoint = CGPointMake(toPointX, toPointY);
    CGPoint controlPoint = CGPointMake(toPointX, 0.0);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:fromPoint];
    positionAnimation.removedOnCompletion = YES;
    
    //透明；使用基础动画
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.1];
    opacityAnimation.removedOnCompletion = YES;
    
    //变小；使用基础动画
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]; //设置 X 轴和 Y 轴缩放比例都为1.0，而 Z 轴不变
    transformAnimation.removedOnCompletion = YES;
    
    //组合效果；使用动画组
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[ positionAnimation, transformAnimation, opacityAnimation ];
    animationGroup.duration = 1.0; //设置动画执行时间；这里设置为1.0秒
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]; //设置媒体调速运动；默认为 kCAMediaTimingFunctionLinear，即为线型间隔；这里设置为 kCAMediaTimingFunctionEaseIn，即先慢后快，相当于有个加速度
    animationGroup.autoreverses = YES; //设置自动倒退，即动画回放；默认值为NO
    [_imgVAnimation.layer addAnimation:animationGroup forKey:nil];
}

- (IBAction)btnAnimation2:(UIButton *)sender {
    //向右移动；使用关键帧动画，移动路径为预定的直线路径
    CGPoint fromPoint = _imgVAnimation.center;
    CGPoint toPoint = CGPointMake(fromPoint.x + 100.0, fromPoint.y);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:fromPoint];
    [path addLineToPoint:toPoint];
    
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.path = path.CGPath;
    positionAnimation.removedOnCompletion = YES;
    
    //旋转；使用基础动画
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 0.0, 0.0, 1.0)]; //设置沿着 Z 轴顺时针旋转90度；注意 CATransform3DMakeRotation 总是按最短路径来选择，当顺时针和逆时针的路径相同时（e.g. M_PI），会使用逆时针
<<<<<<< HEAD
    transformAnimation.repeatCount = 4.0; //设置动画播放重复次数；这里设置为8.0次，共720度
    transformAnimation.duration = 1.5; //设置动画执行时间；这里设置为0.5秒
=======
    transformAnimation.repeatCount = 8.0; //设置动画播放重复次数；这里设置为8.0次，共720度
    transformAnimation.duration = 9.5; //设置动画执行时间；这里设置为0.5秒
>>>>>>> dev
    transformAnimation.cumulative = YES; //设置是否累积；默认值为NO，这里设置为YES，看起来才动画效果连贯
    transformAnimation.removedOnCompletion = YES;
    
    //组合效果；使用动画组
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
<<<<<<< HEAD
    animationGroup.animations = @[ transformAnimation, positionAnimation ];
    animationGroup.duration = 5.0; //设置动画执行时间；这里设置为4.0秒
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]; //设置媒体调速运动；默认为 kCAMediaTimingFunctionLinear，即为线型间隔；这里设置为 kCAMediaTimingFunctionEaseIn，即先慢后快，相当于有个加速度
=======
    animationGroup.animations = @[ positionAnimation, transformAnimation ];
    animationGroup.duration = 35.0; //设置动画执行时间；这里设置为4.0秒
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]; //设置媒体调速运动；默认为 kCAMediaTimingFunctionLinear，即为线型间隔；这里设置为 kCAMediaTimingFunctionEaseIn，即先慢后快，相当于有个加速度
>>>>>>> dev
    animationGroup.autoreverses = YES; //设置自动倒退，即动画回放；默认值为NO
    
    //以下两句是『动画结束后回到初始状态的现象』的解决方法；这里没用到
    //animationGroup.removedOnCompletion = NO; //设置是否完成后从对应的所属图层移除他，默认为YES
    //animationGroup.fillMode = kCAFillModeForwards; //设置动画填充模式；默认值为 kCAFillModeRemoved，即动画执行完就移除，变回原来的状态，这里设置为 kCAFillModeForwards，即保持向前的状态
    
}

@end
