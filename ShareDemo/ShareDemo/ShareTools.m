//
//  ShareTools.m
//  Test
//
//  Created by liupeng on 1/17/14.
//  Copyright (c) 2014 crte. All rights reserved.
//

#import "ShareTools.h"
#import "ActionView.h"
#import "AppDelegate.h"

#define shareContentDefault @"... from https://github.com/79144876/ShareCustomView"

@implementation ShareTools

static ShareTools *_shareTools = nil;
+(ShareTools *)shareToolsInstance
{
    if (_shareTools == nil)
    {
        _shareTools = [[ShareTools alloc] init];
    }
    return _shareTools;
}

#pragma -- showAction
-(void)showShareView:(UIViewController *)uiViewController isFollow:(BOOL)follow andString:(NSString *)string
{
    self.str = string;

    CGRect baseRect = [[UIScreen mainScreen] bounds];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){

        UIView *sheetContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, baseRect.size.width, 120)];
        sheetContentView.backgroundColor = [UIColor clearColor];
        
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 5,baseRect.size.width, 20)];
        [titleLable setText:@"分享"];
        titleLable.textAlignment = NSTextAlignmentCenter;
        [titleLable setTextColor:[UIColor grayColor]];
        [titleLable setFont:[UIFont systemFontOfSize:18]];
        [titleLable setBackgroundColor:[UIColor clearColor]];
        [sheetContentView addSubview:titleLable];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
        [btn setImage:[UIImage imageNamed:@"sns_icon_1.png"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(shareButton:) forControlEvents:UIControlEventTouchUpInside];
        [sheetContentView addSubview:btn];
        
        UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(baseRect.size.width-120, 20, 100, 100)];
        [btn2 setImage:[UIImage imageNamed:@"sns_icon_6.png"] forState:UIControlStateNormal];
        [btn2 addTarget:self action:@selector(shareButton:) forControlEvents:UIControlEventTouchUpInside];
        [sheetContentView addSubview:btn2];
        
        UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(baseRect.size.width*0.5-50, 20, 100, 100)];
        [btn3 setImage:[UIImage imageNamed:@"sns_icon_23.png"] forState:UIControlStateNormal];
        [btn3 addTarget:self action:@selector(shareButton:) forControlEvents:UIControlEventTouchUpInside];
        [sheetContentView addSubview:btn3];
        
        self.shareView=[[ActionView alloc] initWithFrame:CGRectMake(0, [[UIApplication sharedApplication] keyWindow].frame.size.height, baseRect.size.width, 250)];
        [self.shareView addSubview:sheetContentView];
        [self.shareView updateFollowStatus:follow];
        [self.shareView showInView:uiViewController.view];

    }

}

- (void)shareButton:(UIButton *)sender{
    NSLog(@"------%@",self.str);
}


#pragma -- share lib action
//- (void)shareWithMode:(int)action fromSender:(UIView*)sender shareContent:(NSString*)someText
//{
//    //create share content
//    id<ISSContent> publishContent = [ShareSDK content:someText
//                                       defaultContent:@""
//                                                image:nil
//                                                title:nil
//                                                  url:@"http://eudic.net"
//                                          description:nil
//                                            mediaType:SSPublishContentMediaTypeText];
//    //create container
//    id<ISSContainer> container = [ShareSDK container];
////    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
//    
//    
//    AppDelegate* delegate=(AppDelegate*)[UIApplication sharedApplication].delegate;
//    id<ISSShareOptions> shareOptions;
//    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
//                                                         allowCallback:YES
//                                                         authViewStyle:SSAuthViewStylePopup
//                                                          viewDelegate:nil
//                                               authManagerViewDelegate:delegate.viewDelegate];
//    
//    shareOptions= [ShareSDK defaultShareOptionsWithTitle:@"title"
//                                         oneKeyShareList:nil
//                                          qqButtonHidden:YES
//                                   wxSessionButtonHidden:YES
//                                  wxTimelineButtonHidden:YES
//                                    showKeyboardOnAppear:NO
//                                       shareViewDelegate:delegate.viewDelegate
//                                     friendsViewDelegate:delegate.viewDelegate
//                                   picViewerViewDelegate:nil];
//    
////    [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
////                                    [ShareSDK userFieldWithType:SSUserFieldTypeUid value:SINA_UUID],
////                                    SHARE_TYPE_NUMBER(ShareTypeSinaWeibo),
////                                    nil]];
//    ShareType actionType;
//    switch (action) {
//        case ShareTypeSinaWeibo:
//        {
//            actionType = ShareTypeSinaWeibo;
//        }
//            break;
//        case ShareTypeTencentWeibo:
//        {
//            actionType = ShareTypeTencentWeibo;
//        }
//            break;
//        case ShareTypeQQSpace:
//        {
//            actionType = ShareTypeQQSpace;
//        }
//            break;
//        case ShareTypeQQ:
//        {
//            actionType = ShareTypeQQ;
//        }
//            break;
//        case ShareTypeEvernote:
//        {
//            actionType = ShareTypeEvernote;
//        }
//            break;
//        case ShareTypeWeixiSession:
//        {
//            actionType = ShareTypeWeixiSession;
//        }
//            break;
//        case ShareTypeWeixiTimeline:
//        {
//            actionType = ShareTypeWeixiTimeline;
//        }
//            break;
//        case ShareTypeSMS:
//        {
//            actionType = ShareTypeSMS;
//        }
//            break;
//        case ShareTypeMail:
//        {
//            actionType = ShareTypeMail;
//        }
//            break;
//        case ShareTypeCopy:
//        {
//            actionType = ShareTypeCopy;
//        }
//            break;
//        case ShareTypeAirPrint:
//        {
//            actionType = ShareTypeAirPrint;
//        }
//            break;
//        default:
//            actionType = ShareTypeCopy;
//            break;
//    }
//    
//    //show share view
//    [ShareSDK showShareViewWithType:actionType
//                          container:container
//                            content:publishContent
//                      statusBarTips:YES
//                        authOptions:authOptions
//                       shareOptions:shareOptions
//                             result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
//                                 
//                                 if (state == SSPublishContentStateSuccess)
//                                 {
//                                     NSLog(@"success");
//                                 }
//                                 else if (state == SSPublishContentStateFail)
//                                 {
//                                     NSLog(@"Fail !error code == %d, error code == %@", [error errorCode], [error errorDescription]);
//                                 }
//                             }];
//}

@end
