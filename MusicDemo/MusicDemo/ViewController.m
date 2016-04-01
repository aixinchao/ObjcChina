//
//  ViewController.m
//  MusicDemo
//
//  Created by Taskmall on 16/3/23.
//  Copyright © 2016年 Taskmall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) AVAudioPlayer * audioPlayer;
@property (nonatomic,strong) UISlider * musicSlider;
@property (nonatomic,strong) UILabel * timeLabel;
@property (nonatomic,strong) NSTimer * timer;

@end

@implementation ViewController
//254 239 119
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"四月是你的谎言";
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100.f, 100.f, 60.f, 60.f);
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonSelector:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.view.backgroundColor = [UIColor colorWithRed:254.f/255.0 green:239.f/255.0 blue:119.f/255.0 alpha:1];
    
    UIButton * playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    playButton.tag = 1000;
    playButton.backgroundColor = [UIColor colorWithRed:254.f/255.0 green:239.f/255.0 blue:119.f/255.0 alpha:1];
    playButton.center = CGPointMake(self.view.center.x-60.f, self.view.center.y-100.f);
    playButton.bounds = CGRectMake(0.f, 0.f, 60.f, 60.f);
    playButton.layer.cornerRadius = 30.f;
    playButton.titleLabel.font = [UIFont boldSystemFontOfSize:20.f];
    [playButton setTitleColor:[UIColor colorWithRed:33.f/255.0 green:255.f/255.0 blue:255.f/255.0 alpha:1] forState:UIControlStateNormal];
    [playButton setTitle:@"play" forState:UIControlStateNormal];
    [playButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playButton];
    
    UIButton * pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pauseButton.tag = 1001;
    pauseButton.backgroundColor = [UIColor colorWithRed:254.f/255.0 green:239.f/255.0 blue:119.f/255.0 alpha:1];
    pauseButton.layer.cornerRadius = 30.f;
    pauseButton.center = CGPointMake(self.view.center.x+60.f, self.view.center.y-100.f);
    pauseButton.titleLabel.font = [UIFont boldSystemFontOfSize:20.f];
    pauseButton.bounds = CGRectMake(0.f, 0.f, 60.f, 60.f);
    [pauseButton setTitleColor:[UIColor colorWithRed:33.f/255.0 green:255.f/255.0 blue:255.f/255.0 alpha:1] forState:UIControlStateNormal];
    [pauseButton setTitle:@"pause" forState:UIControlStateNormal];
    [pauseButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pauseButton];
    
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0.f, self.view.center.y-20.f, self.view.frame.size.width, 70.f)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"head.jpg"]];
    imageView.frame = CGRectMake(10.f, 5.f, 60.f, 60.f);
    [backView addSubview:imageView];
    
    self.musicSlider = [[UISlider alloc] initWithFrame:CGRectMake(80.f, 10.f, self.view.frame.size.width-90.f, 20.f)];
    self.musicSlider.minimumValue = 0;
    self.musicSlider.maximumValue = 100;
    [self.musicSlider addTarget:self action:@selector(musicSliderClick:) forControlEvents:UIControlEventValueChanged];
    [backView addSubview:self.musicSlider];
    
    UILabel * musicName = [[UILabel alloc] initWithFrame:CGRectMake(80.f, 40.f, 100.f, 25.f)];
    musicName.font = [UIFont systemFontOfSize:12.f];
    musicName.textAlignment = NSTextAlignmentCenter;
    musicName.text = @"四月是你的谎言";
    [backView addSubview:musicName];
    
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-70.f, 40.f, 60.f, 25.f)];
    self.timeLabel.font = [UIFont systemFontOfSize:12.f];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.text = @"00:00";
    [backView addSubview:self.timeLabel];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(musicTime) userInfo:nil repeats:YES];
    
    NSURL * url = [[NSBundle mainBundle] URLForResource:@"四月是你的谎言" withExtension:@"mp3"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
}

- (void)buttonSelector:(UIButton *)sender {
    LNViewController * LNVC = [[LNViewController alloc] init];
    [self.navigationController pushViewController:LNVC animated:YES];
}

- (void)buttonClick:(UIButton *)sender {
    if (sender.tag == 1000) {
        [self.audioPlayer play];
    } else if (sender.tag == 1001) {
        [self.audioPlayer pause];
    }
}

- (void)musicTime {
    self.musicSlider.value = (self.audioPlayer.currentTime/self.audioPlayer.duration)*100;
    int min = self.audioPlayer.currentTime/60;
    int sec = (int)(self.audioPlayer.currentTime)%60;
    self.timeLabel.text = [NSString stringWithFormat:@"%02d:%02d",min,sec];
}

- (void)musicSliderClick:(UISlider *)sender {
    self.audioPlayer.currentTime = (sender.value/100)*(self.audioPlayer.duration);
    int min = self.audioPlayer.currentTime/60;
    int sec = (int)(self.audioPlayer.currentTime)%60;
    self.timeLabel.text = [NSString stringWithFormat:@"%02d:%02d",min,sec];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
