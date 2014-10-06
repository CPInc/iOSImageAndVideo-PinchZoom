//
//  VideoWithZoom.h
//  Video Zoom
//
//  Created by Danny Witters on 05/10/2014.
//  Copyright (c) 2014 CaptureProof. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoWithZoom : UIScrollView <UIScrollViewDelegate>

- (id)initWithFrame:(CGRect)frame andVideoName:(NSString *)name andFileType:(NSString*)type;
- (void)stopVideo;

@end
