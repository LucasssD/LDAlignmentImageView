//
//  LDImageView.m
//  FotoGis
//
//  Created by Lucas Duda on 31.12.2016.
//  Copyright © 2016 apronet. All rights reserved.
//

#import "LDAlignmentImageView.h"

@interface LDAlignmentImageView()

@property (weak, nonatomic) UIImageView *innerImageView;
//@property (nonatomic) UIViewContentMode innerContentMode;
@property (weak, nonatomic) UIView *innerView;

@end

@implementation LDAlignmentImageView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _imageVerticalAlignment = LDImageVerticalAlignmentCenter;
        _imageHorizontalAlignment = LDImageHorizontalAlignmentCenter;
        _imageContentMode = LDImageContentModeScaleAspectFit;
        [super setContentMode:UIViewContentModeScaleToFill];
        self.clipsToBounds = YES;
        
        UIView *tmpView = [[UIView alloc] init];
        tmpView.backgroundColor = [UIColor whiteColor];
        [self addSubview:tmpView];
        _innerView = tmpView;

        UIImageView *tmp = [[UIImageView alloc] init];
        tmp.contentMode = UIViewContentModeScaleToFill;
        tmp.backgroundColor = [UIColor clearColor];
        [self addSubview:tmp];
        _innerImageView = tmp;
        
        self.contentMode = [super contentMode];
        // self.image = [super image];
    }
    
    return self;
}

- (void)layoutSubviews{
    [super setImage:nil];
    [super layoutSubviews];
    if (!self.innerImageView.image) return;
    
    CGFloat imageViewXOrigin = 0;
    CGFloat imageViewYOrigin = 0;
    CGFloat imageViewWidth;
    CGFloat imageViewHeight;
    
    // compute scale factor for imageView
    CGFloat widthScaleFactor = CGRectGetWidth(self.frame) / self.image.size.width;
    CGFloat heightScaleFactor = CGRectGetHeight(self.frame) / self.image.size.height;
    
    //calculate size
    if (_imageContentMode == LDImageContentModeScaleAspectFill) {
        if (widthScaleFactor > heightScaleFactor) {
            imageViewWidth = self.image.size.width * widthScaleFactor;
            imageViewHeight = self.image.size.height * widthScaleFactor;
        } else {
            imageViewWidth = self.image.size.width * heightScaleFactor;
            imageViewHeight = self.image.size.height * heightScaleFactor;
        }
    } else if (_imageContentMode == LDImageContentModeScaleAspectFit){
        if (widthScaleFactor < heightScaleFactor) {
            imageViewWidth = self.bounds.size.width;
            imageViewHeight = self.bounds.size.width * (self.image.size.height / self.image.size.width);
        } else {
            imageViewWidth =  self.bounds.size.height * (self.image.size.width / self.image.size.height);
            imageViewHeight = self.bounds.size.height;
        }
    } else if (_imageContentMode == LDImageContentModeScaleToFill){
        imageViewWidth = self.bounds.size.width;
        imageViewHeight = self.bounds.size.height;
    } else if (_imageContentMode == LDImageContentModeOriginalSize){
        imageViewWidth = self.image.size.width;
        imageViewHeight = self.image.size.height;
    }
    
    //calculate position
    //x
    switch (self.imageHorizontalAlignment) {
        case LDImageHorizontalAlignmentLeft:
            break;
            
        case LDImageHorizontalAlignmentCenter:
            imageViewXOrigin += (self.frame.size.width - imageViewWidth) / 2.0;
            break;
            
        case LDImageHorizontalAlignmentRight:
            imageViewXOrigin += self.frame.size.width - imageViewWidth;
            break;
            
        default:
            imageViewXOrigin += (self.frame.size.width - imageViewWidth) / 2.0;
            break;
    }
    
    //y
    switch (self.imageVerticalAlignment) {
        case LDImageVerticalAlignmentTop:
            break;
            
        case LDImageVerticalAlignmentCenter:
            imageViewYOrigin += (self.frame.size.height - imageViewHeight) / 2.0;
            break;
            
        case LDImageVerticalAlignmentBottom:
            imageViewYOrigin += self.frame.size.height - imageViewHeight;
            break;
            
        default:
            imageViewYOrigin += (self.frame.size.height - imageViewHeight) / 2.0;
            break;
    }

    self.innerImageView.frame = CGRectMake(imageViewXOrigin,
                                           imageViewYOrigin,
                                           imageViewWidth,
                                           imageViewHeight);
    [self.innerView setFrame: self.frame];
}


- (void)setImageVerticalAlignment:(LDImageVerticalAlignment)imageVerticalAlignment{
    if (imageVerticalAlignment != _imageVerticalAlignment) {
        _imageVerticalAlignment = imageVerticalAlignment;
        //        [self setNeedsUpdateConstraints];
        [self layoutSubviews];
    }
}

- (void)setImageHorizontalAlignment:(LDImageHorizontalAlignment)imageHorizontalAlignment{
    if (imageHorizontalAlignment != _imageHorizontalAlignment) {
        _imageHorizontalAlignment = imageHorizontalAlignment;
        [self layoutSubviews];
    }
}

- (void)setImageContentMode:(LDImageContentMode)imageContentMode{
    if (imageContentMode != _imageContentMode) {
        _imageContentMode = imageContentMode;
        [self layoutSubviews];
    }
}

- (void)setContentMode:(UIViewContentMode)contentMode{
    
    switch (contentMode) {
        case UIViewContentModeScaleToFill:
            _imageContentMode = LDImageContentModeScaleToFill;
            break;
            
        case UIViewContentModeScaleAspectFill:
            _imageContentMode = LDImageContentModeScaleAspectFill;
            break;
            
        case UIViewContentModeScaleAspectFit:
            _imageContentMode = LDImageContentModeScaleAspectFit;
            break;
            
        case UIViewContentModeTop:
            _imageVerticalAlignment = LDImageVerticalAlignmentTop;
            break;
            
        case UIViewContentModeCenter:
            _imageVerticalAlignment = LDImageVerticalAlignmentCenter;
            _imageHorizontalAlignment = LDImageHorizontalAlignmentCenter;
            break;
            
        case UIViewContentModeBottom:
            _imageVerticalAlignment = LDImageVerticalAlignmentBottom;
            break;
            
        case UIViewContentModeLeft:
            _imageHorizontalAlignment = LDImageHorizontalAlignmentLeft;
            break;
            
        case UIViewContentModeRight:
            _imageHorizontalAlignment = LDImageHorizontalAlignmentRight;
            break;
            
        case UIViewContentModeTopLeft:
            _imageHorizontalAlignment = LDImageHorizontalAlignmentLeft;
            _imageVerticalAlignment = LDImageVerticalAlignmentTop;
            break;
            
        case UIViewContentModeTopRight:
            _imageHorizontalAlignment = LDImageHorizontalAlignmentRight;
            _imageVerticalAlignment = LDImageVerticalAlignmentTop;
            break;
            
        case UIViewContentModeBottomLeft:
            _imageHorizontalAlignment = LDImageHorizontalAlignmentLeft;
            _imageVerticalAlignment = LDImageVerticalAlignmentBottom;
            break;
            
        case UIViewContentModeBottomRight:
            _imageHorizontalAlignment = LDImageHorizontalAlignmentRight;
            _imageVerticalAlignment = LDImageVerticalAlignmentBottom;
            break;
            
        default:
            break;
    }
    
    [self setNeedsDisplay];
}

- (void)setImage:(UIImage *)image{
    
    self.innerImageView.image = image;
    [self layoutSubviews];
}

- (UIImage *)image{
    return self.innerImageView.image;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
