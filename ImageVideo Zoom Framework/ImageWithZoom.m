//
//  ImageWithZoom.m
//  Video Zoom
//
//  Created by Danny Witters on 05/10/2014.
//  Copyright (c) 2014 CaptureProof. All rights reserved.
//

#define maxScale 5.0f;
#define minScale 1.0f;

#import "ImageWithZoom.h"

@interface ImageWithZoom ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ImageWithZoom

#pragma mark View Initializer

- (id)initWithFrame:(CGRect)frame andImage:(UIImage *)image {
    
    self = [super init];
    
    if (self) {
        
        self.frame = frame;
        self.delegate = self;
        [self setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, frame.size.width, frame.size.height)];
        self.imageView.image = image;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.imageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];

        [self addSubview:self.imageView];

        self.maximumZoomScale = maxScale;
        self.minimumZoomScale = minScale;
    }
    
    return self;
}

- (void)viewDidLayoutSubviews {
    
    self.contentSize = self.imageView.bounds.size;
}

#pragma mark ZOOM Methods

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.imageView;
}

- (void)centerScrollViewContents {
    
    CGSize boundsSize = self.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
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
    
    self.imageView.frame = contentsFrame;
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
