//
//  ViewController.m
//  LDAlignmentImageViewExample
//
//  Created by Lucas Duda on 27.01.2017.
//  Copyright © 2017 Lucas Duda. All rights reserved.
//

#import "ViewController.h"
#import "LDAlignmentImageView.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet LDAlignmentImageView *ldImageAlignmentView;
@property (weak, nonatomic) IBOutlet UIButton *horizontalLeft;
@property (weak, nonatomic) IBOutlet UIButton *horizontalCenter;
@property (weak, nonatomic) IBOutlet UIButton *horizontalRight;

@property (weak, nonatomic) IBOutlet UIButton *verticalTop;
@property (weak, nonatomic) IBOutlet UIButton *verticalCenter;
@property (weak, nonatomic) IBOutlet UIButton *verticalBottom;

@property (weak, nonatomic) IBOutlet UISwitch *animationSwitch;

@property (weak, nonatomic) IBOutlet UIButton *imgPortraitButton;
@property (weak, nonatomic) IBOutlet UIButton *imgLandscapeButton;

@property (weak, nonatomic) IBOutlet UIButton *contentModeOrigSizeButton;
@property (weak, nonatomic) IBOutlet UIButton *contentModeScaleToFillButton;
@property (weak, nonatomic) IBOutlet UIButton *contentModeScaleAspectFillButton;
@property (weak, nonatomic) IBOutlet UIButton *contentModeScaleAspectFitButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ldImageAlignmentView.layer.borderWidth = 2.0f;
    self.ldImageAlignmentView.layer.borderColor = [UIColor redColor].CGColor;
    
    [self clearHorizontalState];
    [self clearVerticalState];
    [self verticalCenterAction:self.verticalCenter];
    [self horizontalCenterAction:self.horizontalCenter];
    [self contentModeScaleToFillAction:self.contentModeScaleToFillButton];
    
    self.imgPortraitButton.backgroundColor = [UIColor lightGrayColor];
    self.imgLandscapeButton.backgroundColor = [UIColor clearColor];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clearHorizontalState{
    self.horizontalLeft.backgroundColor = [UIColor clearColor];
    self.horizontalCenter.backgroundColor = [UIColor clearColor];
    self.horizontalRight.backgroundColor = [UIColor clearColor];
}

- (void)clearVerticalState{
    self.verticalTop.backgroundColor = [UIColor clearColor];
    self.verticalCenter.backgroundColor = [UIColor clearColor];
    self.verticalBottom.backgroundColor = [UIColor clearColor];
}

- (void)clearContentModeState{
    self.contentModeOrigSizeButton.backgroundColor = [UIColor clearColor];
    self.contentModeScaleToFillButton.backgroundColor = [UIColor clearColor];
    self.contentModeScaleAspectFitButton.backgroundColor = [UIColor clearColor];
    self.contentModeScaleAspectFillButton.backgroundColor = [UIColor clearColor];
}

- (IBAction)verticalTopAction:(id)sender {
    [self clearVerticalState];
    
    UIButton *button = (UIButton *)sender;
    button.backgroundColor = [UIColor lightGrayColor];
    
    [UIView animateWithDuration:_animationSwitch.isOn ? 0.4 : 0.0 animations:^{
        self.ldImageAlignmentView.imageVerticalAlignment = LDImageVerticalAlignmentTop;
    }];
    
}

- (IBAction)verticalCenterAction:(id)sender {
    [self clearVerticalState];
    UIButton *button = (UIButton *)sender;
    button.backgroundColor = [UIColor lightGrayColor];
    
    [UIView animateWithDuration:_animationSwitch.isOn ? 0.4 : 0.0 animations:^{
        self.ldImageAlignmentView.imageVerticalAlignment = LDImageVerticalAlignmentCenter;
    }];
    
}

- (IBAction)verticalBottomAction:(id)sender {
    [self clearVerticalState];
    UIButton *button = (UIButton *)sender;
    button.backgroundColor = [UIColor lightGrayColor];
    
    [UIView animateWithDuration:_animationSwitch.isOn ? 0.4 : 0.0 animations:^{
        self.ldImageAlignmentView.imageVerticalAlignment = LDImageVerticalAlignmentBottom;
    }];
    
}

- (IBAction)horizontalLeftAction:(id)sender {
    [self clearHorizontalState];
    UIButton *button = (UIButton *)sender;
    button.backgroundColor = [UIColor lightGrayColor];
    
    [UIView animateWithDuration:_animationSwitch.isOn ? 0.4 : 0.0 animations:^{
        self.ldImageAlignmentView.imageHorizontalAlignment= LDImageHorizontalAlignmentLeft;
    }];
    
}

- (IBAction)horizontalCenterAction:(id)sender {
    [self clearHorizontalState];
    UIButton *button = (UIButton *)sender;
    button.backgroundColor = [UIColor lightGrayColor];
    
    [UIView animateWithDuration:_animationSwitch.isOn ? 0.4 : 0.0 animations:^{
        self.ldImageAlignmentView.imageHorizontalAlignment= LDImageHorizontalAlignmentCenter;
    }];
    
}

- (IBAction)horizontalRightAction:(id)sender {
    [self clearHorizontalState];
    UIButton *button = (UIButton *)sender;
    button.backgroundColor = [UIColor lightGrayColor];
    
    [UIView animateWithDuration:_animationSwitch.isOn ? 0.4 : 0.0 animations:^{
        self.ldImageAlignmentView.imageHorizontalAlignment= LDImageHorizontalAlignmentRight;
    }];
    
}

- (IBAction)portraitImageAction:(id)sender {
    self.imgPortraitButton.backgroundColor = [UIColor lightGrayColor];
    self.imgLandscapeButton.backgroundColor = [UIColor clearColor];
    [self.ldImageAlignmentView setImage:[UIImage imageNamed:@"portrait"]];
    
}

- (IBAction)landscapeImageAction:(id)sender {
    self.imgPortraitButton.backgroundColor = [UIColor clearColor];
    self.imgLandscapeButton.backgroundColor = [UIColor lightGrayColor];
    [self.ldImageAlignmentView setImage:[UIImage imageNamed:@"landscape"]];
    
}

- (IBAction)contentModeOrigSizeAction:(id)sender {
    [self clearContentModeState];
    UIButton *button = (UIButton *)sender;
    button.backgroundColor = [UIColor lightGrayColor];
    
    [UIView animateWithDuration:_animationSwitch.isOn ? 0.4 : 0.0 animations:^{
        self.ldImageAlignmentView.imageContentMode = LDImageContentModeOriginalSize;
    }];
}

- (IBAction)contentModeScaleToFillAction:(id)sender {
    [self clearContentModeState];
    UIButton *button = (UIButton *)sender;
    button.backgroundColor = [UIColor lightGrayColor];
    
    [UIView animateWithDuration:_animationSwitch.isOn ? 0.4 : 0.0 animations:^{
        self.ldImageAlignmentView.imageContentMode = LDImageContentModeScaleToFill;
    }];
}

- (IBAction)contentModeScaleAspectFillAction:(id)sender {
    [self clearContentModeState];
    UIButton *button = (UIButton *)sender;
    button.backgroundColor = [UIColor lightGrayColor];
    
    [UIView animateWithDuration:_animationSwitch.isOn ? 0.4 : 0.0 animations:^{
        self.ldImageAlignmentView.imageContentMode = LDImageContentModeScaleAspectFill;
    }];
}

- (IBAction)contentModeScaleToFitAction:(id)sender {
    [self clearContentModeState];
    UIButton *button = (UIButton *)sender;
    button.backgroundColor = [UIColor lightGrayColor];
    
    [UIView animateWithDuration:_animationSwitch.isOn ? 0.4 : 0.0 animations:^{
        self.ldImageAlignmentView.imageContentMode = LDImageContentModeScaleAspectFit;
    }];
}

- (IBAction)clipToBoundsValueChanged:(UISwitch *)sender {
    self.ldImageAlignmentView.clipsToBounds = sender.isOn;
}

@end
