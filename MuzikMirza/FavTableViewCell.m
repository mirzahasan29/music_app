//
//  FavTableViewCell.m
//  MuzikMirza
//
//  Created by Mirza Rishad Hasan on 7/24/16.
//  Copyright © 2016 Mirza Rishad Hasan. All rights reserved.
//

#import "FavTableViewCell.h"
#import "CoreDataStack.h"

#import "Song+CoreDataProperties.h"
#import "FavTableViewController.h"


@implementation FavTableViewCell


-(void) cellCreatorFav:(Song *)song {
    
    self.songLabel.text = song.nameSong;
    self.artistLabel.text = song.nameArtist;
    self.songImg.image = [UIImage imageNamed:song.imageLocation];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
