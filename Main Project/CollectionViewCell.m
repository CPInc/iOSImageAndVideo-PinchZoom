//
//  CollectionViewCell.m
//  Video Zoom
//
//  Created by Danny Witters on 05/10/2014.
//  Copyright (c) 2014 CaptureProof. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.thumbnailImage = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.contentView.bounds.size.width, self.contentView.bounds.size.height)];
        [self.thumbnailImage setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        [self.thumbnailImage setContentMode:UIViewContentModeScaleAspectFit];
        
        self.playButton = [[UIImageView alloc] initWithFrame:CGRectMake(self.thumbnailImage.frame.size.width / 2 - 12.5f, self.thumbnailImage.frame.size.height / 2 - 12.5f, 25.0f, 25.0f)];
        self.playButton.image = [UIImage imageNamed:@"play.png"];
        
        [self.contentView addSubview:self.thumbnailImage];
        [self.contentView addSubview:self.playButton];
    }
    
    return self;
}


@end
