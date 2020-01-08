//
//  LDImageView.h
//  AutoLayout
//
//  Created by Aral Balkan on 11/10/2018.
//  Copyright © 2018 Aral Balkan. All rights reserved.
//

#ifndef LDAlignmentImageView_h
#define LDAlignmentImageView_h

//
//  LDImageView.h
//  FotoGis
//
//  Created by Lucas Duda on 31.12.2016.
//  Copyright © 2016 apronet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDAlignmentImageView : UIImageView

typedef enum LDImageVerticalAlignment{
    LDImageVerticalAlignmentTop,
    LDImageVerticalAlignmentCenter,
    LDImageVerticalAlignmentBottom
} LDImageVerticalAlignment;

typedef enum LDImageHorizontalAlignment{
    LDImageHorizontalAlignmentLeft,
    LDImageHorizontalAlignmentCenter,
    LDImageHorizontalAlignmentRight
} LDImageHorizontalAlignment;

typedef enum LDImageContentMode{
    LDImageContentModeScaleAspectFill,
    LDImageContentModeScaleAspectFit,
    LDImageContentModeScaleToFill,
    LDImageContentModeOriginalSize
} LDImageContentMode;

@property (nonatomic) LDImageVerticalAlignment imageVerticalAlignment;
@property (nonatomic) LDImageHorizontalAlignment imageHorizontalAlignment;
@property (nonatomic) LDImageContentMode imageContentMode;
@property (nonatomic) UIImage* correctImage;

@end

#endif /* LDAlignmentImageView_h */
