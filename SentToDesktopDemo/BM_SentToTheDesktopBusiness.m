//
//  BM_SentToTheDesktopBusiness.m
//  SentToTheDesktopDemo
//
//  Created by 尹东博 on 16/2/23.
//  Copyright © 2016年 尹东博. All rights reserved.
//

#import "BM_SentToTheDesktopBusiness.h"
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@implementation BM_SentToTheDesktopBusiness


-(void)sendDesktopGetName:(NSString*)name GetIconStr:(NSString*)iconStr GetVCID:(NSString*)VCid OpenUrlStr:(NSString*)OpenUrlstr{
    {
        __weak AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        //开启服务
        [appDelegate startServer];
        
        //服务账号名称
        NSString * accountNameStr = [[NSString alloc] init];
        accountNameStr = name;
        
        //页面提示标题文本
        NSString * hintTitleStr  = [[NSString alloc] init];
        hintTitleStr = @"添加到桌面";
        
        //提示文本字段1
        NSString * hintContentStrF = [[NSString alloc] init];
        hintContentStrF = @"点击下方工具栏上的";
        
        //提示文本字段2
        NSString * hintContentStrS = [[NSString alloc] init];
        hintContentStrS = @"并选择“添加到主屏幕";
        
        /*
         html
         */
        NSMutableString * dataHtml = [NSMutableString stringWithFormat:@"data:text/html;charset=UTF-8,<html>"];
        
        NSString * headTag = @"<head><meta charset=\"utf-8\"><meta content=\"initial-scale=1.0,width=device-width\" name=\"viewport\" /><meta content=\"yes\" name=\"apple-mobile-web-app-capable\" /><meta content=\"black\" name=\"apple-mobile-web-app-status-bar-style\" /><meta content=\"telephone=no\" name=\"format-detection\" />";//head标签
        
        
        NSString * headTitleStr = [NSString stringWithFormat:@"<title>%@</title>",accountNameStr];//title标签
        
        NSString * headIconLinkTag = [NSString stringWithFormat:@"<link rel=\"apple-touch-icon-precomposed\" href=\"%@\"/>",iconStr];//服务账号图标
        
        
        NSString *headStyleTag = @"<style>body{ color:#333; background-color:#ff4e00;}body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,button,textarea,p,blockquote,label,th,td{ margin:0; padding:0;}.white{ color:#fff;}.yellow{color:#ff4e00;}.t_center{ text-align:center;}.t_left{ text-align:left;}.fb{ font-weight:bold;}.box10{ height:10px;}.whitewindow{ background:#fff; padding:20px 30px; width:154px; margin:0 auto; border-radius:8px; position:relative;}.borderwid{ width:0; height:0; border-width:8px; border-color:#fff #ff4e00 #ff4e00 #ff4e00; position:absolute; bottom:-16px; left:90px; background:#fff; border-style:solid;}</style>";//style标签
        
        NSString * headScriptTag = @"<META HTTP-EQUIV=\"pragma\" CONTENT=\"no-cache\"> <META HTTP-EQUIV=\"Cache-Control\" CONTENT=\"no-store, must-revalidate\"> <META HTTP-EQUIV=\"expires\" CONTENT=\"0\"> <script language=\"javascript\"> window.opener.document.location.reload() </script>";//script标签
        
        NSString * headTagEnd = @"</head>";//head标签结束
        
        NSString * bodyTag= [NSString stringWithFormat:@"<body onload=\"opener.location.reload()\"><div class=\"box10\"></div><div class=\"box10\"></div><div class=\"t_center\"><p class=\"white t_center yahei\">%@</p><div class=\"box10\"></div><div class=\"box10\"></div><div class=\"box10\"></div><div class=\"box10\"></div><div class=\"box10\"></div>",hintTitleStr];//body标签 提示语标题
        
        //MainICO 转码
        UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:iconStr]]];
        NSData * imageData = UIImageJPEGRepresentation(image, 0.4);
        NSString * bodyImageTagSrc = [NSString stringWithFormat:@"<img src=\"data:img/jpg;base64,%@\" alt=\"\">",[imageData base64Encoding]];
        
        NSString * bodyAccountNameTitle = [NSString stringWithFormat:@"<div class=\"box10\"></div><div class=\"box10\"></div><div class=\"whitewindow\"><p class=\"yellow\">%@</p>",accountNameStr];//服务好名称title
        
        NSString * bodyHintStr1 = [NSString stringWithFormat:@"<p class=\"t_left\" style=\"line-height:19px;\">%@</p>",hintContentStrF];//提示文本1 :点击下方工具栏上的
        
        NSString * bodyHintImageStr = @"<img src=\"data:img/jpg;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAlCAYAAABcZvm2AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEgAACxIB0t1+/AAAABx0RVh0U29mdHdhcmUAQWRvYmUgRmlyZXdvcmtzIENTNui8sowAAAFMSURBVEiJ7de9SgNBFIbhJ5LSS9AkRvA+vAYFwUJsNI2WWqW1UuwUROzEQrAS6+RatLaz8i8WmdUhya6zUVKEfM0unHO+98zZ2WG3snLaU0I1XIT7XTylFlZLQBrohCt0sYrHlOK5MSHQDLD6f4GWgmEjJ9ZJgf0GGjRqR7F2lJPXSBIoHk0PBziK4kc4DLGG4dEmgZqhsBaM9nAyIu8Y+xGsq7/CJNByKKjhAzs4z+sUZ2iF3HpocAg2CMogi6FwC1cFkEyX2I5gXf2pjARV8YAFvGIDNwmQTNfYxJv+NO5j/xj0rv+2P2MNdyUgmW6xHjxa+MwClRFH0DxeCsyygkpBzpDHqM1QBEnVkEfqEfRnTQxU9TPzPBU9i1iFPhNdUabUzvOUV99jGjfDDDQDfavMd12msd636RvdDDQDTTEoPhlK/WOW1cRW9AW0IDx1DqcMHgAAAABJRU5ErkJggg==\" width=\"13\"/>";//提示文本中的图片
        
        NSString * bodyHintStr2 = [NSString stringWithFormat:@"<p>%@”</p><div class=\"box10\"></div><div class=\"borderwid\"></div></div></div>",hintContentStrS];//提示文本2 :并选择“添加到主屏幕
        
        NSString * bodyTagEnd = @"</body>";//body结束标签
        
        NSString * scriptStr = [NSString stringWithFormat:@"<script>if (window.navigator.standalone){window.location.href='BusterMark://%@%@';}</script>",OpenUrlstr,VCid];//JS方法
        
        NSString * htmlEndTag = @"</html>";//html标签结束
        
        //dataHtml 为页面主体<html>
        [dataHtml appendString:headTag];//添加<head>
        [dataHtml appendString:headIconLinkTag];//添加iconLink标签
        [dataHtml appendString:headTitleStr];//添加页面title标签
        [dataHtml appendString:headStyleTag];//添加DivStyle标签
        [dataHtml appendString:headScriptTag];//添加script标签
        [dataHtml appendString:headTagEnd];//添加</head>
        
        [dataHtml appendString:bodyTag];//添加<body>
        [dataHtml appendString:bodyImageTagSrc];//添加页面中的LOGO显示<img>
        [dataHtml appendString:bodyAccountNameTitle];//添加页面中的服务账号名称显示
        [dataHtml appendString:bodyHintStr1];//添加提示语1
        [dataHtml appendString:bodyHintImageStr];//添加提示文本 图片
        [dataHtml appendString:bodyHintStr2];//添加提示语2
        [dataHtml appendString:bodyTagEnd];//添加</body>
        
        [dataHtml appendString:scriptStr];//添加JS跳转<script>
        [dataHtml appendString:htmlEndTag];//添加</html>
        
        NSString * contentEncode = [dataHtml stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [appDelegate.httpServer get:@"/old" withBlock:^(RouteRequest *request, RouteResponse *response) {
            [response setStatusCode:302];
            [response setHeader:@"Location" value:contentEncode];
        }];
        UInt16 port = appDelegate.httpServer.port;
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:%u/old", port]]];
    }
}
@end
