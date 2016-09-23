//
//  SongTableViewCell.m
//  MuzikMirza
//
//  Created by Mirza Rishad Hasan on 7/23/16.
//  Copyright © 2016 Mirza Rishad Hasan. All rights reserved.
//

#import "SongTableViewCell.h"
#import "ViewController.h"
#import "CoreDataStack.h"
#import "Song.h"
#import "Song+CoreDataProperties.h"


@implementation SongTableViewCell

-(void) cellCreator:(NSDictionary *)resultDictionary {
    
    songDict = resultDictionary;

    self.songName.text=[resultDictionary objectForKey:@"trackName"];
    self.artistName.text = [resultDictionary objectForKey:@"artistName"];
    NSString *url = [NSString stringWithFormat:@"%@",[resultDictionary objectForKey:@"artworkUrl60"]];
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    self.songImage.image =[UIImage imageWithData:data];
    
    [self.storeButton addTarget:self action:@selector(storeButn:) forControlEvents:UIControlEventTouchUpInside];
    
//    [self.storeButton setImage:[UIImage imageNamed:@"empty.png"] forState:UIControlStateNormal];
    
    self.storeImg.image = [UIImage imageNamed:@"empty.png"];
    
    self.storeImg.userInteractionEnabled =YES;
    userLikes =NO;
    
    
//likeImage
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(storeImage:)];
    [self.storeImg addGestureRecognizer:gesture];
    gesture.numberOfTapsRequired =1;
    
    
    
}

-(void)storeButn: (UIButton*)button {
    
//    CoreDataStack *cds = [CoreDataStack coreDataStack];
//    Song *song = [NSEntityDescription insertNewObjectForEntityForName:@"Song" inManagedObjectContext:cds.managedObjectContext];
//    song.nameArtist = [songDict objectForKey:@"artistName"];
//    song.nameSong = [songDict objectForKey:@"trackName"];
//    [cds saveContext];
//    
//    NSArray *arrayOfDictionary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask , YES);
//    NSLog(@"%@",[arrayOfDictionary lastObject]);
    
//    if(self.storeButton.selected){
//        //self.storeImg.image = [UIImage imageNamed:@"empty.png"];
//        [self.storeButton setImage:[UIImage imageNamed:@"empty.png"] forState:UIControlStateNormal];
//        userLikes = NO;
//        NSLog(@"empty clik btn");
//        
//    } else {
//        //self.storeImg.image = [UIImage imageNamed:@"full.png"];
//        [self.storeButton setImage:[UIImage imageNamed:@"full.png"] forState:UIControlStateSelected];
//        userLikes = YES;
//        NSLog(@"full clik btn");
//    }
    
    

    NSLog(@"btn clik");


    
    //    [self.storeButton setImage:[UIImage imageNamed:@"full.png"] forState:UIControlStateNormal];
    //    int rowVal = button.tag;
    //    NSLog(@"%d",rowVal);
  
}


-(void)storeImage: (UITapGestureRecognizer *) sender {
    
    CoreDataStack *cds = [CoreDataStack coreDataStack];
    
    if(userLikes){
//        CoreDataStack *cds = [CoreDataStack coreDataStack];
//        Song *song = [arrayOfStudents objectAtIndex:indexPath.row];
//        [cds.managedObjectContext deleteObject:student];
//        [cds saveContext];
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Song" inManagedObjectContext:cds.managedObjectContext];
        [fetchRequest setEntity:entity];
// Specify criteria for filtering which objects to fetch
//NSPredicate *predicate = [NSPredicate predicateWithFormat:@"<#format string#>", <#arguments#>];
//[fetchRequest setPredicate:predicate];
// Specify how the fetched objects should be sorted

         NSError *error = nil;
        NSArray *fetchedObjects = [cds.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        if (fetchedObjects == nil) {
                ///error
        } else {
            
            Song *song = [fetchedObjects lastObject];
            [cds.managedObjectContext deleteObject:song];
            
        }
        
        
        
        self.storeImg.image = [UIImage imageNamed:@"empty.png"];
        userLikes = NO;
        NSLog(@"empty clik image");

    } else {

        Song *song = [NSEntityDescription insertNewObjectForEntityForName:@"Song" inManagedObjectContext:cds.managedObjectContext];
        song.nameArtist = [songDict objectForKey:@"artistName"];
        song.nameSong = [songDict objectForKey:@"trackName"];
        
        NSString *theUrl = [songDict objectForKey:@"artworkUrl60"];
        NSURL *imageUrl = [NSURL URLWithString:theUrl];
        song.imageLocation = [imageUrl lastPathComponent];
        
        
        NSArray *arrayOfDictionary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask , YES);
        NSLog(@"%@",[arrayOfDictionary lastObject]);
        self.storeImg.image = [UIImage imageNamed:@"full.png"];
        userLikes = YES;
         NSLog(@"full clik image");
    }
    
    [cds saveContext];
    
}



@end
