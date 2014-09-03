//
//  OHTMasterMenuOptions.h
//  TrainingOrganiser
//
//  Created by Paul Bunting on 9/3/14.
//  Copyright (c) 2014 100 Trees. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OHTMasterMenuOptions <NSObject>

- (NSArray*) options;

- (BOOL) isLeafOptionAtIndex:(NSInteger) index;

- (NSString*) optionAtIndex:(NSInteger) index;

- (void) handleOption:(NSObject*) option forMasterView:(UINavigationController*) masterView forDetailView:(UINavigationController*) detailView usingManagedObjectContext:(NSManagedObjectContext*) managedObjectContext;

@end
