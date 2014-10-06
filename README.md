iOS-Video-Image-Zoom
====================

Framework to set pinch and zoom to an image or video for iOS.

iOS method to implement pinch and zoom for images and videos. Compatible with horizontal and vertical orientations. 



*Video Zoom (VideoWithZoom.h / VideoWithZoom.m)

- (id)initWithFrame:(CGRect)frame andVideoName:(NSString *)name andFileType:(NSString*)type;

Initialize your video with the frame size and video name and filetype from your bundle. Use pinch to zoom between 1.0 and 5.0 scale. Double-tap to revert to the original position. 



*Image Zoom (ImageWithZoom.h / ImageWithZoom.m)

- (id)initWithFrame:(CGRect)frame andImage:(UIImage *)image;

Initialize your image with the frame size and image. Use pinch to zoom between 1.0 and 5.0 scale. Double-tap to revert to the original position. 
