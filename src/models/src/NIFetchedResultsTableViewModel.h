//
//  NIFetchedResultsTableViewModel.h
//  LiftRep
//
//  Created by Francis Li on 9/22/12.
//  Copyright (c) 2012 TikiTaki Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NIFetchedResultsTableViewModel;

@protocol NIFetchedResultsTableViewModelDelegate <NSObject, NITableViewModelDelegate>

@optional

- (UITableViewRowAnimation)tableViewModel:(NIFetchedResultsTableViewModel *)tableViewModel
                   rowAnimationForSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
                                  atIndex:(NSUInteger)sectionIndex
                            forChangeType:(NSFetchedResultsChangeType)type
                           withController:(NSFetchedResultsController *)controller
                              inTableView:(UITableView *)tableView;

- (UITableViewRowAnimation)tableViewModel:(NIFetchedResultsTableViewModel *)tableViewModel
                    rowAnimationForObject:(id)anObject
                              atIndexPath:(NSIndexPath *)indexPath
                            forChangeType:(NSFetchedResultsChangeType)type
                             newIndexPath:(NSIndexPath *)newIndexPath
                           withController:(NSFetchedResultsController *)controller
                              inTableView:(UITableView *)tableView;

@end

@interface NIFetchedResultsTableViewModel : NITableViewModel <NSFetchedResultsControllerDelegate> {
    @private
    NSFetchedResultsController *_controller;
    __weak UITableView *_tableView;
}
@property (nonatomic, NI_WEAK) id<NIFetchedResultsTableViewModelDelegate> delegate;

- (id)initWithFetchedResultsController:(NSFetchedResultsController *)controller
                             tableView:(UITableView *)tableView
                              delegate:(id<NIFetchedResultsTableViewModelDelegate>)delegate;

@end
