//
//  NIFetchedResultsTableViewModel.h
//  LiftRep
//
//  Created by Francis Li on 9/22/12.
//  Copyright (c) 2012 TikiTaki Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NIFetchedResultsTableViewModel : NITableViewModel {
    @private
    NSFetchedResultsController *_controller;
}

- (id)initWithFetchedResultsController:(NSFetchedResultsController *)controller delegate:(id<NITableViewModelDelegate>)delegate;

@end
