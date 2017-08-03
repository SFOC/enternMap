//
//  ViewController.m
//  test
//
//  Created by mac on 2017/8/3.
//  Copyright © 2017年 Fly. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+SFExpandBtnClickScope.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.btn setExpandBtnClickScopeWithTop:100 right:100 bottom:100 left:100];
}

- (IBAction)btnAction:(UIButton *)sender {
    NSLog(@"点击了按钮");

//    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"appb:"]]) {
//        NSLog(@"能打开");
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"appb://hello"] options:@{@"key":@"您好"} completionHandler:nil];
//    }
//    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]]) {
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"iosamap://"] options:@{} completionHandler:nil];
//    }
    [self gotoMap];
}

#pragma mark - 去地图展示路线
/** 
 去地图展示路线 
 苹果地图和高德地图的坐标系一样，百度地图和高德地图的坐标系不一样。
 */
- (void)gotoMap{
    // 后台返回的目的地坐标是百度地图的
    // 百度地图与高德地图、苹果地图采用的坐标系不一样，故高德和苹果只能用地名不能用后台返回的坐标
    CGFloat latitude  = 34.333;  // 纬度
    CGFloat longitude = 108.24533; // 经度
    NSString *address = @"西安市南窑头"; // 送达地址
    
    // 打开地图的优先级顺序：百度地图->高德地图->苹果地图
//    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]]) {
//        // 百度地图
//        // 起点为“我的位置”，终点为后台返回的坐标
//        NSString *urlString = [[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=%f,%f&mode=riding&src=天天快递", latitude, longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        NSURL *url = [NSURL URLWithString:urlString];
//        [[UIApplication sharedApplication] openURL:url];
//    }else
//        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]]) {
//        // 高德地图
//        // 起点为“我的位置”，终点为后台返回的address
//        NSString *urlString = [[NSString stringWithFormat:@"iosamap://path?sourceApplication=applicationName&sid=BGVIS1&sname=%@&did=BGVIS2&dname=%@&dev=0&t=0",@"我的位置",address] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
//    }else
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"http://maps.apple.com"]]){
        // 苹果地图
        // 起点为“我的位置”，终点为后台返回的address
        NSString *urlString = [[NSString stringWithFormat:@"http://maps.apple.com/?daddr=%@",address] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    }else{
        // 快递员没有安装上面三种地图APP，弹窗提示安装地图APP
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"请安装地图APP" message:@"建议安装百度地图APP" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertVC animated:NO completion:nil];
    }
}



@end
