//
//  NIFetchedResultsTableViewModel.m
//  LiftRep
//
//  Created by Francis Li on 9/22/12.
//  Copyright (c) 2012 TikiTaki Studio. All rights reserved.
//

#import "NIFetchedResultsTableViewModel.h"

@implementation NIFetchedResultsTableViewModel

- (id)initWithFetchedResultsController:(NSFetchedResultsController *)controller delegate:(id<NITableViewModelDelegate>)delegate
{
    self = [super initWithDelegate:delegate];
    if (self) {
        _controller = controller;
    }
    return self;
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath
{
    return [_controller objectAtIndexPath:indexPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_controller.sections objectAtIndex:section] numberOfObjects];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _controller.sections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[_controller.sections objectAtIndex:section] name];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return nil;//_controller.sectionIndexTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [_controller sectionForSectionIndexTitle:title atIndex:index];
}

@end
