//
//  NIFetchedResultsTableViewModel.m
//  LiftRep
//
//  Created by Francis Li on 9/22/12.
//  Copyright (c) 2012 TikiTaki Studio. All rights reserved.
//

#import "NIFetchedResultsTableViewModel.h"

@implementation NIFetchedResultsTableViewModel

- (id)initWithFetchedResultsController:(NSFetchedResultsController *)controller
                             tableView:(UITableView *)tableView
                              delegate:(id<NIFetchedResultsTableViewModelDelegate>)delegate
{
    self = [super initWithDelegate:delegate];
    if (self) {
        _controller = controller;
        _controller.delegate = self;
        _tableView = tableView;
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
    if (self.sectionIndexType != NITableViewModelSectionIndexNone) {
        return _controller.sectionIndexTitles;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [_controller sectionForSectionIndexTitle:title atIndex:index];
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [_tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    UITableViewRowAnimation animation = UITableViewRowAnimationAutomatic;
    if ([self.delegate respondsToSelector:@selector(tableViewModel:rowAnimationForSection:atIndex:forChangeType:withController:inTableView:)]) {
        animation = [self.delegate tableViewModel:self
                           rowAnimationForSection:sectionInfo
                                          atIndex:sectionIndex
                                    forChangeType:type
                                   withController:_controller
                                      inTableView:_tableView];
    }
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [_tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                      withRowAnimation:animation];
            break;
            
        case NSFetchedResultsChangeDelete:
            [_tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                      withRowAnimation:animation];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableViewRowAnimation animation = UITableViewRowAnimationAutomatic;
    if ((type != NSFetchedResultsChangeMove) && [self.delegate respondsToSelector:@selector(tableViewModel:rowAnimationForObject:atIndexPath:forChangeType:newIndexPath:withController:inTableView:)]) {
        animation = [self.delegate tableViewModel:self
                            rowAnimationForObject:anObject
                                      atIndexPath:indexPath
                                    forChangeType:type
                                     newIndexPath:newIndexPath
                                   withController:_controller
                                      inTableView:_tableView];
    }
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [_tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                              withRowAnimation:animation];
            break;
            
        case NSFetchedResultsChangeDelete:
            [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                              withRowAnimation:animation];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                              withRowAnimation:animation];
            break;
            
        case NSFetchedResultsChangeMove:
            [_tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [_tableView endUpdates];
}

@end
