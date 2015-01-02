//
//  WaitingPenguin.m
//  PeevedPenguins
//
//  Created by Victoria Simpri on 1/2/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "WaitingPenguin.h"

@implementation WaitingPenguin

-(void)didLoadFromCCB {
    float delay = (arc4random() % 2000) / 1000.f;
    [self performSelector:@selector(startBlinkAndJump) withObject:nil afterDelay:delay];
}

-(void)startBlinkAndJump {
    //the animation manager of each node is stored in the animation manager property
    CCAnimationManager *animationManager = self.animationManager;
    //timelines can be referenced and run by name
    [animationManager runAnimationsForSequenceNamed:@"BlinkAndJump"];
}

@end
