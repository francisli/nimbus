//
//  UISegmentedControl+NIStyleable.h
//  LiftRep
//
//  Created by Francis Li on 1/20/13.
//  Copyright (c) 2013 TikiTaki Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISegmentedControl (NIStyleable)

/**
 * Applies the given rule set to this segmented control.
 *
 * This method is exposed primarily for subclasses to use when implementing the
 * applyStyleWithRuleSet: method from NIStyleable.
 */
- (void)applySegmentedControlStyleWithRuleSet:(NICSSRuleset *)ruleSet;

@end
