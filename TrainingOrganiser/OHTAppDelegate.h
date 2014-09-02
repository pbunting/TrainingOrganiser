//
//  OHTAppDelegate.h
//  TrainingOrganiser
//
//  Created by Paul Bunting on 2/09/2014.
//  Copyright (c) 2014 100 Trees. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OHTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
