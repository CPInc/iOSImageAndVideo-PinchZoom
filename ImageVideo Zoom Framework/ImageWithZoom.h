//
//  ImageWithZoom.h
//  Video Zoom
//
//  Created by Danny Witters on 05/10/2014.
//  Copyright (c) 2014 CaptureProof. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageWithZoom : UIScrollView <UIScrollViewDelegate>

- (id)initWithFrame:(CGRect)frame andImage:(UIImage *)image;

@end
