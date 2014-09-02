//
//  OHTDetailViewController.h
//  TrainingOrganiser
//
//  Created by Paul Bunting on 2/09/2014.
//  Copyright (c) 2014 100 Trees. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OHTDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
