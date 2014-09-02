//
//  OHTMasterViewController.h
//  TrainingOrganiser
//
//  Created by Paul Bunting on 2/09/2014.
//  Copyright (c) 2014 100 Trees. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OHTDetailViewController;

#import <CoreData/CoreData.h>

@interface OHTMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) OHTDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
