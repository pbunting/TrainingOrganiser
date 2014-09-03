//
//  OHTMenuMasterViewController.m
//  TrainingOrganiser
//
//  Created by Paul Bunting on 9/3/14.
//  Copyright (c) 2014 100 Trees. All rights reserved.
//

#import "OHTMenuMasterViewController.h"


@interface OHTMenuMasterViewController ()

@property (nonatomic, strong) NSArray* optionList;
@property (nonatomic) BOOL isTree;

@end

@implementation OHTMenuMasterViewController

- (id) init
{
    self = [super init];
    if (self)
    {
        self.isTree = NO;
        self.optionList = [NSArray arrayWithObjects:
                            @"Your Profile",
                            @"Trainees",
                           nil];
    }
    return self;
}

- (BOOL) isLeafOptionAtIndex:(NSInteger)index
{
    return YES;
}

- (NSArray *)options
{
    return self.optionList;
}

- (NSString*) optionAtIndex:(NSInteger)index
{
    return self.optionList[index];
}

- (void) handleOption:(NSObject *)option forMasterView:(UINavigationController *)masterView forDetailView:(UINavigationController *)detailView usingManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    
}


// Basic Table in UINavigationController stuff
- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (OHTDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.isTree)
    {
        return [self.optionList count];
    }
    else
    {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isTree)
    {
        return [self.optionList[section] count];
    }
    else
    {
        return [self.optionList count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (self.isTree)
    {
        cell.textLabel.text = self.optionList[indexPath.section][indexPath.row];
    }
    else
    {
        cell.textLabel.text = self.optionList[indexPath.row];
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        if (self.isTree)
        {
            // Need to identify which row the segue is triggered from so in prepare for segue can then
            // prepare the next controller appropriately
            //
            // An example on the web is:
            // [self.tableView indexPathForCell:sender];
            // this method needs to ensure performsegue sends the index cell as the sender. Cute!
            cell.textLabel.text = self.optionList[indexPath.section][indexPath.row];
        }
        else
        {
            cell.textLabel.text = self.optionList[indexPath.row];
        }
    }
    
        if (indexPath.row == 0)
        {
            [self.detailViewController performSegueWithIdentifier:@"showTrainees" sender:self.detailViewController];
        }
        else
        {
            [self.detailViewController performSegueWithIdentifier:@"showProfile" sender:self.detailViewController];
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showTrainees"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setDetailItem:[self getCellDataAtIndexPath:indexPath]];
    }
    if ([[segue identifier] isEqualToString:@"showProfile"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setDetailItem:[self getCellDataAtIndexPath:indexPath]];
    }
}


- (NSString*) getCellDataAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return @"Trainees";
    }
    else
    {
        return @"My Profile";
    }
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = [self getCellDataAtIndexPath:indexPath];
}

@end
