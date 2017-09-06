//
//  NetAPI.h
//  TRGFShop
//
//  Created by 刘仰清 on 2017/9/4.
//  Copyright © 2017年 trgf. All rights reserved.
//

#ifndef NetAPI_h
#define NetAPI_h

#define	kUrlHost @"http://trgf.vellgo.com.cn"
#define minetype @"application/json"

// 首页
#define kHomeCarousel @"/api/product/coverImage"
#define kHomeProduct  @"/api/product/searchAll"


//消息
#define kMesseage   @"/api/message/searchSiteMsg"

//个人中心
#define kUserInfo   @"/api/customer/get"

//登录注册
#define kLogin          @"/api/customer/userLogin"
#define kIdentifyCode   @"/api/identifycode/sendCode"
#define kRegister       @""

//推广助手
#define kPromoteHelper  @"/api/product/getPromAsstPageNo"

//h5网页 Get协议
#define kCService       @"http://trgfapp.vellgo.com.cn:8004/trgfAppOne/kefu.html"
#define kCart           @"http://trgfapp.vellgo.com.cn:8004/trgfAppOne/cart.html"


#endif /* NetAPI_h */
