//
//  VideoWithZoom.m
//  Video Zoom
//
//  Created by Danny Witters on 05/10/2014.
//  Copyright (c) 2014 CaptureProof. All rights reserved.
//

#define maxScale 5.0f;
#define minScale 1.0f;

#import "VideoWithZoom.h"
#import <MediaPlayer/MediaPlayer.h>

@interface VideoWithZoom ()

@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
@property BOOL play;

@end

@implementation VideoWithZoom

#pragma mark View Initializer

- (id)initWithFrame:(CGRect)frame andVideoName:(NSString *)name andFileType:(NSString*)type {
    
    self = [super init];
    
    if (self) {
       
        self.frame = frame;
        self.delegate = self;
        [self setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];

        self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:name ofType:type]]];
        [self.moviePlayer.view setFrame:frame];
        self.moviePlayer.fullscreen = NO;
        [self.moviePlayer.view setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
        
        //REMOVE THE PINCH GRESTURE EMBEDDED IN THE DEFAULT MPMOVIEPLAYER.. USING CUSTOM SCROLL METHODS
        [[[self.moviePlayer view] subviews] enumerateObjectsUsingBlock:^(id view, NSUInteger idx, BOOL *stop) {
            [[view gestureRecognizers] enumerateObjectsUsingBlock:^(id pinch, NSUInteger idx, BOOL *stop) {
                if([pinch isKindOfClass:[UIPinchGestureRecognizer class]]) {
                    [view removeGestureRecognizer:pinch];
                }
            }];
        }];
        
        [self addSubview:self.moviePlayer.view];
        
        self.maximumZoomScale = maxScale;
        self.minimumZoomScale = minScale;
        
        [self.moviePlayer play];
    }
    
    return self;
}

- (void)viewDidLayoutSubviews {
    self.contentSize = self.moviePlayer.view.bounds.size;
}

#pragma mark Button Methods

- (void)stopVideo {
    [self.moviePlayer stop];
}

#pragma mark ZOOM Methods

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.moviePlayer.view;
}

- (void)centerScrollViewContents {
    CGSize boundsSize = self.bounds.size;
    CGRect contentsFrame = self.moviePlayer.view.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    
    self.moviePlayer.view.frame = contentsFrame;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {

    [self centerScrollViewContents];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    NSUInteger tapCount = touch.tapCount;

    if (tapCount == 2) {
        [self handleDoubleTapBegan:[touch locationInView:self.superview]];
    }
    
    [[self nextResponder] touchesEnded:touches withEvent:event];
}

- (void)handleDoubleTapBegan:(CGPoint)touchPoint {
    
    [UIView animateWithDuration:0.25
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{ [self setZoomScale:1.0f animated:NO]; }
                     completion:nil];
}

@end
