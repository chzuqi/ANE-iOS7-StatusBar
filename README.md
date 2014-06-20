ANE-iOS7-StatusBar
==================

修复ios7状态栏会被UIImagePickerController(CameraRool)修改的问题,并且能改变他们的颜色

CameraRool和CameraUI都会导致ios7的状态栏出现/变色，需要用这个东西修改。平时也可以变个颜色，出现隐藏之类的。

把以下代码加到  
xxx-app.xml<iPhone><InfoAdditions>里  
```
<key>UIViewControllerBasedStatusBarAppearance</key>
<false/>
<key>UIStatusBarStyle</key>
<string>UIStatusBarStyleLightContent</string>
```

记得前面的fullscreen改为false  

```
<fullScreen>false</fullScreen>
```

一样需要在OSX内编译