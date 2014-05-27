TRACustomWindow
===============

TRACustomWindow you can easily implement pop-up of the announcement.  
You can turn off the View in touch.  
![demo_image](https://raw.github.com/wiki/travitu/my-resources/3b68879f58cb2818a69c320b6479022f.gif)

Requirements
===============
* iOS 6.0 or later  
* Xcode 5.1 or later
* ARC

Usage
===============
1. Add TRACustomWindow folder into your project.
2. `#import "TRACustomUIWindow.h"` and `TRACustomUIWindowDelegate` into your ViewController header file.
3. How to.
Show popup
``` 
[[TRACustomUIWindow sharedInstance] showWindow];  
[[TRACustomUIWindow sharedInstance] setDelegate:self];  
```
  Dismiss popup.
```
[[TRACustomUIWindow sharedInstance] hideWindow];
```
  Disable touch event of screen. Default is enable.  
```
[[TRACustomUIWindow sharedInstance] setEnableBaseViewTouch:NO];
```
