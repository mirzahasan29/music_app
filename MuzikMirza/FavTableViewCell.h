//
//  FavTableViewCell.h
//  MuzikMirza
//
//  Created by Mirza Rishad Hasan on 7/24/16.
//  Copyright © 2016 Mirza Rishad Hasan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"

@interface FavTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *songLabel;

@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;

@property (weak, nonatomic) IBOutlet UIImageView *songImg;
@property (weak, nonatomic) IBOutlet UIImageView *storeImg;

-(void) cellCreatorFav:(Song *)song;


@end
