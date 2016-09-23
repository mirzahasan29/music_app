//
//  TitleViewController.h
//  MuzikMirza
//
//  Created by Mirza Rishad Hasan on 7/23/16.
//  Copyright © 2016 Mirza Rishad Hasan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface TitleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelSong;

@property (weak, nonatomic) IBOutlet UILabel *labelArtist;

@property (weak, nonatomic) IBOutlet UIImageView *titleImage;


@property(nonatomic,strong) NSMutableDictionary *songDictDetail;

@property (nonatomic, strong) NSString *song;
@property (nonatomic, strong) NSString *artist;

@property (weak, nonatomic) IBOutlet UIButton *playButton;

@property (weak, nonatomic) IBOutlet UIButton *stopButton;


@end
