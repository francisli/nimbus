//
//  UISegmentedControl+NIStyleable.m
//  LiftRep
//
//  Created by Francis Li on 1/20/13.
//  Copyright (c) 2013 TikiTaki Studio. All rights reserved.
//

#import "UISegmentedControl+NIStyleable.h"

#import "UIView+NIStyleable.h"
#import "NICSSRuleset.h"
#import "NimbusCore.h"

#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "Nimbus requires ARC support."
#endif

NI_FIX_CATEGORY_BUG(UISegmentedControl_NIStyleable)

@implementation UISegmentedControl (NIStyleable)


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)applySegmentedControlStyleWithRuleSet:(NICSSRuleset *)ruleSet {
    if ([ruleSet hasTintColor]) { self.tintColor = ruleSet.tintColor; }
    if ([ruleSet hasSegmentedControlStyle]) { self.segmentedControlStyle = ruleSet.segmentedControlStyle; }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)applyStyleWithRuleSet:(NICSSRuleset *)ruleSet {
    [self applyViewStyleWithRuleSet:ruleSet];
    [self applySegmentedControlStyleWithRuleSet:ruleSet];
}

@end
