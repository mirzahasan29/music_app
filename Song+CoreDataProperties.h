//
//  Song+CoreDataProperties.h
//  MuzikMirza
//
//  Created by Mirza Rishad Hasan on 7/24/16.
//  Copyright © 2016 Mirza Rishad Hasan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Song.h"

NS_ASSUME_NONNULL_BEGIN

@interface Song (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *imageLocation;
@property (nullable, nonatomic, retain) NSString *songImage;
@property (nullable, nonatomic, retain) NSString *nameSong;
@property (nullable, nonatomic, retain) NSString *nameArtist;

@end

NS_ASSUME_NONNULL_END
