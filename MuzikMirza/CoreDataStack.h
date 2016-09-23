//
//  CoreDataStack.h
//  MuzikMirza
//
//  Created by Mirza Rishad Hasan on 7/23/16.
//  Copyright © 2016 Mirza Rishad Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CoreDataStack : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+(CoreDataStack *) coreDataStack;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end
