//
//  SongTableViewCell.h
//  MuzikMirza
//
//  Created by Mirza Rishad Hasan on 7/23/16.
//  Copyright © 2016 Mirza Rishad Hasan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongTableViewCell : UITableViewCell {
    
    BOOL userLikes;
    NSDictionary *songDict;
}


@property (weak, nonatomic) IBOutlet UIImageView *storeImg;


@property (weak, nonatomic) IBOutlet UIButton *storeButton;


@property (weak, nonatomic) IBOutlet UIImageView *songImage;


@property (weak, nonatomic) IBOutlet UILabel *songName;

@property (weak, nonatomic) IBOutlet UILabel *artistName;

@property (weak, nonatomic) IBOutlet UIButton *playButton;

-(void) cellCreator:(NSDictionary *)resultDictionary;

//-(void)storeButn: (UIButton*)button;

@end
