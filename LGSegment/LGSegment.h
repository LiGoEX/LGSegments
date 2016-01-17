//
//  LGSegment.h
//  LGSegment
//
//  Created by LiGo on 12/19/15.
//  Copyright © 2015 LiGo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SegmentDelegate <NSObject>
@optional
- (void)scrollToPage:(int)page;
@end

@interface LGSegment : UIView {
    id <SegmentDelegate> delegate;
}

@property (nonatomic, weak) id <SegmentDelegate> delegate;

@property(nonatomic, assign) CGFloat maxWidth;
@property(nonatomic,strong)NSMutableArray *titleList;
@property(nonatomic,strong)NSMutableArray *buttonList;
@property(nonatomic,weak)CALayer *LGLayer;
@property(nonatomic,assign)CGFloat bannerNowX;

+ (instancetype)initWithTitleList:(NSMutableArray *)titleList;
-(id)initWithTitleList:(NSMutableArray*)titleList;
-(void)moveToOffsetX:(CGFloat)X;

@end
