//
//  TitleViewController.m
//  MuzikMirza
//
//  Created by Mirza Rishad Hasan on 7/23/16.
//  Copyright © 2016 Mirza Rishad Hasan. All rights reserved.
//

#import "TitleViewController.h"
#import "ViewController.h"

@interface TitleViewController ()<AVAudioPlayerDelegate>

@end

@implementation TitleViewController {
    
    AVAudioPlayer *player;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.labelSong.text = [self.songDictDetail objectForKey:@"trackName"];
    self.labelArtist.text = [self.songDictDetail objectForKey:@"artistName"];
    NSLog(@"..............%@",_songDictDetail);
    
    NSString *url = [NSString stringWithFormat:@"%@",[self.songDictDetail objectForKey:@"artworkUrl100"]];
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    self.titleImage.image =[UIImage imageWithData:data];
    
    
    NSString *playUrl = [NSString stringWithFormat:@"%@",[self.songDictDetail objectForKey:@"previewUrl"]];
    NSData *playData = [NSData dataWithContentsOfURL:[NSURL URLWithString:playUrl]];
    player = [[AVAudioPlayer alloc] initWithData:playData error:nil];
    [player setDelegate:self];
    [player play];
    
    
}


- (IBAction)playButtonClicked:(id)sender {
    
    [player play];
    
    self.playButton.hidden = YES;
    self.stopButton.hidden = NO;
    
}

- (IBAction)stopButtonClicked:(id)sender {
    
    
    [player stop];
    
    self.playButton.hidden = NO;
    self.stopButton.hidden = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
