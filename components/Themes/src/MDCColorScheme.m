/*
 Copyright 2017-present the Material Components for iOS authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MDCColorScheme.h"

@implementation MDCBasicColorScheme

- (nonnull instancetype)initWithPrimaryColor:(nonnull UIColor *)primaryColor
                           primaryLightColor:(nonnull UIColor *)primaryLightColor
                            primaryDarkColor:(nonnull UIColor *)primaryDarkColor
                              secondaryColor:(nonnull UIColor *)secondaryColor
                         secondaryLightColor:(nonnull UIColor *)secondaryLightColor
                          secondaryDarkColor:(nonnull UIColor *)secondaryDarkColor {
  self = [super init];
  if (self) {
    _primaryColor = primaryColor;
    _primaryLightColor = primaryLightColor;
    _primaryDarkColor = primaryDarkColor;
    _secondaryColor = secondaryColor;
    _secondaryLightColor = secondaryLightColor;
    _secondaryDarkColor = secondaryDarkColor;
  }
  return self;
}

- (nonnull instancetype)initWithPrimaryColor:(nonnull UIColor *)primaryColor {
  UIColor *primaryLightColor = [self lighterColorForColor:primaryColor];
  UIColor *primaryDarkColor = [self darkerColorForColor:primaryColor];
  return [self initWithPrimaryColor:primaryColor
                  primaryLightColor:primaryLightColor
                   primaryDarkColor:primaryDarkColor
                     secondaryColor:primaryColor
                secondaryLightColor:primaryLightColor
                 secondaryDarkColor:primaryDarkColor];
}

- (nonnull instancetype)initWithPrimaryColor:(nonnull UIColor *)primaryColor
                           primaryLightColor:(nonnull UIColor *)primaryLightColor
                            primaryDarkColor:(nonnull UIColor *)primaryDarkColor {
  return [self initWithPrimaryColor:primaryColor
                  primaryLightColor:primaryLightColor
                   primaryDarkColor:primaryDarkColor
                     secondaryColor:primaryColor
                secondaryLightColor:primaryLightColor
                 secondaryDarkColor:primaryDarkColor];
}

- (nonnull instancetype)initWithPrimaryColor:(nonnull UIColor *)primaryColor
                              secondaryColor:(nonnull UIColor *)secondaryColor {
  return [self initWithPrimaryColor:primaryColor
                  primaryLightColor:[self lighterColorForColor:primaryColor]
                   primaryDarkColor:[self darkerColorForColor:primaryColor]
                     secondaryColor:secondaryColor
                secondaryLightColor:[self lighterColorForColor:secondaryColor]
                 secondaryDarkColor:[self darkerColorForColor:secondaryColor]];
}

- (UIColor *)lighterColorForColor:(UIColor *)color {
  CGFloat r, g, b, a;
  if ([color getRed:&r green:&g blue:&b alpha:&a])
    return [UIColor colorWithRed:MIN(r + 0.2, 1.0)
                           green:MIN(g + 0.2, 1.0)
                            blue:MIN(b + 0.2, 1.0)
                           alpha:a];
  return nil;
}

- (UIColor *)darkerColorForColor:(UIColor *)color {
  CGFloat r, g, b, a;
  if ([color getRed:&r green:&g blue:&b alpha:&a])
    return [UIColor colorWithRed:MAX(r - 0.2, 0.0)
                           green:MAX(g - 0.2, 0.0)
                            blue:MAX(b - 0.2, 0.0)
                           alpha:a];
  return nil;
}

@end