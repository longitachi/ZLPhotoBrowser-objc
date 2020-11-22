![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/ZLPhotoBrowser.png)

[![Version](https://img.shields.io/cocoapods/v/ZLPhotoBrowser-objc.svg?style=flat)](http://cocoadocs.org/docsets/ZLPhotoBrowser-objc)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)&nbsp;
[![License](https://img.shields.io/cocoapods/l/ZLPhotoBrowser-objc.svg?style=flat)](http://cocoadocs.org/docsets/ZLPhotoBrowser-objc)
[![Platform](https://img.shields.io/cocoapods/p/ZLPhotoBrowser-objc.svg?style=flat)](http://cocoadocs.org/docsets/ZLPhotoBrowser-objc)
![Language](https://img.shields.io/badge/Language-%20Objective%20C%20-blue.svg)

----------------------------------------

## 说明
该框架为原[`ZLPhotoBrowser`](https://github.com/longitachi/ZLPhotoBrowser)，`4.0.0`版本以后由`Swift`重新编写，该`OC`版本不在维护，`Swift`版本有更多功能，请使用`Swift`版本

### 运行Demo
下载完Demo请执行`carthage update --platform iOS` （运行时候请选择 `Example` target）`SDWebImage.framework` 和 `SDWebImageMapKit.framework` 路径如果报错的话，关掉项目，重新打开即可

### 框架整体介绍
* [功能介绍](#功能介绍)
* [更新日志](#更新日志)
* [使用方法(支持cocoapods/carthage安装)](#使用方法)
* [English Document](#English)
* [效果图](#效果图)

### <a id="功能介绍"></a>功能介绍
- [x] 支持横竖屏
- [x] 预览快速选择、可设置预览最大数 (支持拖拽选择)
- [x] 直接进入相册选择 （支持滑动多选）
- [x] 编辑图片 (可自定义裁剪比例)
- [x] 编辑视频
- [x] 查看、选择gif、LivePhoto(iOS9.0)、video
- [x] 3D Touch预览image、gif、LivePhoto、video
- [x] 混合选择image、gif、livePhoto、video
- [x] 在线下载iCloud照片
- [x] 控制选择video最大时长
- [x] 多语言国际化 (中文简/繁、英文、日文，可设置跟随系统和自行切换，可自定义多语言提示)
- [x] 相册内拍照按钮实时显示镜头捕捉画面
- [x] 已选择图片遮罩层标记
- [x] 已选择图片index
- [x] 预览已选择照片
- [x] 预览网络及本地 图片/视频 (图片支持长按保存至相册)
- [x] 相册内图片自定义圆角弧度
- [x] 自定义升序降序排列
- [x] 支持点击拍照及长按录制视频 (仿微信)
- [x] 开发者可自定义资源图片
- [x] 支持导出视频 (可指定导出视频尺寸、添加图片水印、粒子特效 ps:文字水印暂不支持)

### Feature

> 如果您在使用中有好的需求及建议，或者遇到什么bug，欢迎随时issue，我会及时的回复
 
### 更新日志
> [更多更新日志](https://github.com/longitachi/ZLPhotoBrowser-objc/blob/master/UPDATELOG.md)
```
● 1.0.1: 适配iOS14 limited权限;
```

### 框架支持
最低支持：iOS 8.0 

IDE：Xcode 9.0 及以上版本 (由于适配iPhone X使用iOS11api，所以请使用Xcode 9.0及以上版本)

### <a id="使用方法"></a>使用方法

第一步：
* Manually 
  * 1.直接把PhotoBrowser文件夹拖入到您的工程中
  * 2.导入 Photos.framework及PhotosUI.framework
  * 3.项目依赖 `SDWebImage`、`GPUImage` 所以需要导入这两个框架
  * 4.导入 "ZLPhotoBrowser.h"
* Cocoapods
  * 1.在Podfile 中添加 `pod 'ZLPhotoBrowser-objc'`
  * 2.执行 `pod setup`
  * 3.执行 `pod install` 或 `pod update`
  * 4.导入 \<ZLPhotoBrowser/ZLPhotoBrowser.h\>
* Carthage
  * 1.在Cartfile 中添加 `github "longitachi/ZLPhotoBrowser-objc"`
  * 2.执行 `carthage update`
  * 3.导入 \<ZLPhotoBrowser/ZLPhotoBrowser.h\>

第二步：
- 在项目plist配置文件中添加如下键值对
```objc
//如果不添加该键值对，则不支持多语言，相册名称默认为英文
Localized resources can be mixed YES
//或者右键plist文件Open As->Source Code 添加
<key>CFBundleAllowMixedLocalizations</key>
<true/>

//相册使用权限描述
Privacy - Photo Library Usage Description
//相机使用权限描述
Privacy - Camera Usage Description
//麦克风使用权限描述
Privacy - Microphone Usage Description
```

代码中调用
```objc
#import <ZLPhotoBrowser/ZLPhotoBrowser.h>
    
ZLPhotoActionSheet *ac = [[ZLPhotoActionSheet alloc] init];

// 相册参数配置，configuration有默认值，可直接使用并对其属性进行修改
ac.configuration.maxSelectCount = 5;
ac.configuration.maxPreviewCount = 10;

//如调用的方法无sender参数，则该参数必传
ac.sender = self;

// 选择回调
[ac setSelectImageBlock:^(NSArray<UIImage *> * _Nonnull images, NSArray<PHAsset *> * _Nonnull assets, BOOL isOriginal) {
    //your codes
}];

// 调用相册
[ac showPreviewAnimated:YES];

// 预览网络图片
[ac previewPhotos:arrNetImages index:0 hideToolBar:YES complete:^(NSArray * _Nonnull photos) {
    // your codes
}];


// 直接调用相机
ZLCustomCamera *camera = [[ZLCustomCamera alloc] init];


camera.doneBlock = ^(UIImage *image, NSURL *videoUrl) {
    // 自己需要在这个地方进行图片或者视频的保存
};

[self showDetailViewController:camera sender:nil];

```

------------------
### <a id="English"></a>English

#### Functions
- [x] Multiple orientations support: Portrait, Landscape
- [x] Adaption with iPhone X
- [x] Supports quick selection in preview list, can set maximum preview numbers (drag selection supported)
- [x] Select from album directly (slide to select multiple images is supported)
- [x] Edit images (image filter, cut-out proportion can be customized)
- [x] Edit videos
- [x] View and select gif, LivePhoto(iOS 9.0+), video
- [x] 3D Touch preview image, gif, LivePhoto, video
- [x] Select image, gif, LivePhoto, video assembly
- [x] Download photos from iCloud online
- [x] Control to select video max play time
- [x] Internationalization (current supported: Simple Chinese, English, Japanese, Traditional Chinese. Can follow system or changed in code. Can specify the other language)
- [x] Including camera cell in album, rendering captured image in real time
- [x] Able to have a mask on selected items
- [x] Preview selected items
- [x] Preview images/videos saved locally or online (long press to save image to album is supported)
- [x] Customize radius of images in album
- [x] Able to sort ascending items or descending items
- [x] Click to take photos or long press to record videos is supported (just like WeChat)
- [x] Can customize resource images
- [x] Able to Export video (Can specify video size or add an image watermark or particle effects. PS: text watermark is not supported currently)

#### Requirements
iOS 8.0+
Xcode 9.0+

#### Usage
Step1
 * Manually
  * 1. Drag PhotoBrowser/ folder into your project
  * 2. Import Photos.framework and PhotosUI.framework
  * 3. This repo relays on SDWebImage and GPUImage, so you also need it
  * 4. Import "ZLPhotoActionSheet.h" at where you wanna use it

 * Cocoapods
  * 1. Add `pod 'ZLPhotoBrowser'` to your Podfile
  * 2. `pod setup`
  * 3. `pod install` or `pod update`
  * 4. import `<ZLPhotoBrowser/ZLPhotoBrowser.h>`
* Carthage
  * 1.Add `github "longitachi/ZLPhotoBrowser"` to your Cartfile 
  * 2.Run `carthage update --platform ios` and add the framework to your project.
  * 3.import `<ZLPhotoBrowser/ZLPhotoBrowser.h>`

Step2
 * add description in info.plist
```objc
Localized resources can be mixed YES
Privacy - Photo Library Usage Description
Privacy - Camera Usage Description
Privacy - Microphone Usage Description
```

### <a id="效果图"></a> 效果图
- 多语言国际化效果图
![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/english.png)
![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/japan.png)
![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/zh-hans.png)
![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/zh-hant.png)

- iPhone X

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/iPhoneXPortrait.png)

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/IPhoneXLandscape.png)

- 3DTouch预览效果图

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/forceTouch.gif)

- 导出视频添加粒子特效(雪花效果)

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/snowEffect.gif)

- 编辑视频预览图

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/editVideo.gif)

- 编辑图片预览图

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/edit.gif)

- 自定义相机效果图及介绍

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/customCamera.gif)
![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/introduce.png)

- 滑动多选预览图

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/slideSelect.gif)

- 拖拽选择预览图

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/dragSelect.gif)

- 混合选择预览图

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/mixSelect.gif)

- 横屏预览图

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/landscape.gif)

- 预览网络图片

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/previewNetImage.gif)

- 遮罩层

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/selectmask.gif)

- 预览快速多选效果图

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/预览图快速选择.gif)
![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/预览大图快速选择.gif)

- 直接进入相册选择相片效果图

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/直接进入相册选择相片.gif)

- 预览大图及缩放效果图

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/查看大图支持缩放.gif)
![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/预览选择gif.gif)
![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/预览选择视频.gif)

- 拍照

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/相册内部拍照.gif)

- 相册内混合选择效果图

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/相册内混合选择.gif)

- 预览已选择照片效果图

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/预览已选择照片.gif)
![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/预览确定选择的照片.gif)

- 原图功能效果图

![image](https://github.com/longitachi/ImageFolder/blob/master/ZLPhotoBrowser-objc/原图功能.gif)
 

