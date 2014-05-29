//
//  TutorialViewController.m
//  MyLocationDemo
//
//  Created by Nicole Zhu on 5/22/14.
//  Copyright (c) 2014 Delta Hackers. All rights reserved.
//

#import "TutorialViewController.h"

@interface TutorialViewController ()

@property (strong, nonatomic) AVPlayer *player;
@property (strong, nonatomic) AVPlayerLayer *playerLayer;

@end

@implementation TutorialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
    //self.titleLabel.text = self.titleText;
    self.beginButton.hidden = YES;
    self.actionLabel.hidden = YES;
    if (self.pageIndex == 5) {
        [self playVideo];
    } else {
        [self.playerLayer removeFromSuperlayer];
    }
}

- (void)playVideo
{
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"demoVideo" withExtension:@"mp4"];
    AVAsset *avAsset = [AVAsset assetWithURL:videoURL];
    AVPlayerItem *avPlayerItem =[[AVPlayerItem alloc]initWithAsset:avAsset];
    AVPlayer *avPlayer = [[AVPlayer alloc]initWithPlayerItem:avPlayerItem];
    self.player = avPlayer;
    AVPlayerLayer *avPlayerLayer =[AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer = avPlayerLayer;
    [avPlayerLayer setFrame:self.view.frame];
    [self.view.layer addSublayer:avPlayerLayer];
    [self.player seekToTime:kCMTimeZero];
    self.player.muted = NO;
    self.player.volume = 1;
    [self.player play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
