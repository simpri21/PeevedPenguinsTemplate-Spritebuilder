//
//  Gameplay.m
//  PeevedPenguins
//
//  Created by Victoria Simpri on 1/1/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Gameplay.h"

@implementation Gameplay {
    CCPhysicsNode *_physicsNode;
    CCNode *_catapultArm;
}

//is called when CCB file has completed loading
-(void)didLoadFromCB {
    //tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
}

//called on every touch in this screne
-(void)touchBegan:(UITouch *)touch withEvent:(UITouchEvent *)event {
    [self launchPenguin];
}

-(void)launchPenguin {
    //loads the Penguin.ccb that was set up in spritebuilder
    CCNode *penguin = [CCBReader load:@"Penguin"];
    //position the penguin at the bowl of the catapult
    penguin.position = ccpAdd(_catapultArm.position, ccp(16, 50));
    
    //add the penguin to the physicsNode of this scene (because it has physics enabled)
    [_physicsNode addChild:penguin];
    
    //manually create and apply a force to launch the penguin
    CGPoint launchDirection = ccp(1, 0);
    CGPoint force = ccpMult(launchDirection, 8000);
    [penguin.physicsBody applyForce:force];
}

@end