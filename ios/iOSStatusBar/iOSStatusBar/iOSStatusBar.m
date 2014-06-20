/*
 * iOSStatusBar.m
 * iOSStatusBar
 *
 * Created by CZQ on 14-6-19.
 * Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
 */

#import "iOSStatusBar.h"
#import <UIKit/UIKit.h>

/* iOSStatusBarExtInitializer()
 * The extension initializer is called the first time the ActionScript side of the extension
 * calls ExtensionContext.createExtensionContext() for any context.
 *
 * Please note: this should be same as the <initializer> specified in the extension.xml 
 */
void iOSStatusBarExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet) 
{
    NSLog(@"Entering iOSStatusBarExtInitializer()");

    *extDataToSet = NULL;
    *ctxInitializerToSet = &iOSStatusBarContextInitializer;
    *ctxFinalizerToSet = &iOSStatusBarContextFinalizer;

    NSLog(@"Exiting iOSStatusBarExtInitializer()");
}

/* iOSStatusBarExtFinalizer()
 * The extension finalizer is called when the runtime unloads the extension. However, it may not always called.
 *
 * Please note: this should be same as the <finalizer> specified in the extension.xml 
 */
void iOSStatusBarExtFinalizer(void* extData) 
{
    NSLog(@"Entering iOSStatusBarExtFinalizer()");

    // Nothing to clean up.
    NSLog(@"Exiting iOSStatusBarExtFinalizer()");
    return;
}

/* iOSStatusBarContextInitializer()
 * The context initializer is called when the runtime creates the extension context instance.
 */
void iOSStatusBarContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    NSLog(@"Entering ContextInitializer()");
    
    /* The following code describes the functions that are exposed by this native extension to the ActionScript code.
     */
    static FRENamedFunction func[] = 
    {
        MAP_FUNCTION(setStyleLightContent, NULL),
        MAP_FUNCTION(setStyleDefault, NULL),
        MAP_FUNCTION(setHiddenOn, NULL),
        MAP_FUNCTION(setHiddenOff, NULL),
    };
    
    *numFunctionsToTest = sizeof(func) / sizeof(FRENamedFunction);
    *functionsToSet = func;
    
    NSLog(@"Exiting ContextInitializer()");
}

/* iOSStatusBarContextFinalizer()
 * The context finalizer is called when the extension's ActionScript code
 * calls the ExtensionContext instance's dispose() method.
 * If the AIR runtime garbage collector disposes of the ExtensionContext instance, the runtime also calls ContextFinalizer().
 */
void iOSStatusBarContextFinalizer(FREContext ctx)
{
    NSLog(@"Entering ContextFinalizer()");

    // Nothing to clean up.
    NSLog(@"Exiting ContextFinalizer()");
    return;
}


ANE_FUNCTION(setStyleLightContent)
{
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
    return NULL;
}
ANE_FUNCTION(setStyleDefault)
{
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }
    return NULL;
}
ANE_FUNCTION(setHiddenOn)
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    return NULL;
}
ANE_FUNCTION(setHiddenOff)
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    return NULL;
}

