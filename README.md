# LDAlignmentImageView
UIImageView subclass with simple methods to align and scale image inside UIImageView.

##Demo:
![](https://github.com/LucasssD/LDAlignmentImageView/blob/master/demo.gif)

##Available properties:

-imageVerticalAlignment (Top, Center, Bottom)

-imageHorizontalAlignment (Left, Center, Right)
  
-imageContentMode (Original size, Scale to Fill, Scale Aspect Fill, Scale Aspect Fit)


##Animatable
All changes can be easly animated by putting them in animation block, for example

    [UIView animateWithDuration:0.4  animations:^{
        ldImageAlignmentView.imageVerticalAlignment = LDImageVerticalAlignmentCenter;
        ldImageAlignmentView.imageHorizontalAlignment= LDImageHorizontalAlignmentLeft;
        ldImageAlignmentView.imageContentMode = LDImageContentModeScaleToFill;
    }];
    

