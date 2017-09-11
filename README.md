# CFBadge
CFBadge是一套角标添加的工具，只需一行代码就可以实现(UIView、UIBarButtonItem、UITabBarItem)角标的添加，可以显示数字，小红点。

![img-w50](https://github.com/cfbm99/CFBadge/blob/master/CFBadge/CFBadgeDemo/source/Simulator%20Screen%20Shot%202017年9月11日%20下午3.30.48.png)

快速集成
=====
 1、将CFBadge文件夹拖入工程中，即可使用

 2、使用
 ```
 //offset: CGPoint(0~1, 0~1) 属性,默认CGPoint(0.5, 0.5),badge的center在UIView的右上角，(0 , 0)显示UIView的top下，right右边，(1, 1)显示在top上，right左边
 //UIView class
 imageView.showDot(offset: nil)//显示小红点
 imageView.showBadge(value: Int(arc4random_uniform(160)), offset: CGPoint(x: 0.5, y: 0.3))//显示数字／大于99自动转成99+
 imageView.hideBadge()//隐藏

 //UIBarButtonItem class
 navigationItem.showDot(offset: nil)//显示小红点
 navigationItem.showBadge(value: Int(arc4random_uniform(160)), offset: CGPoint(x: 0.5, y: 0.3))//显示数字／大于99自动转成99+
 navigationItem.hideBadge()//隐藏

 //TabBarItem class
 tabBarItem.showDot(offset: nil)//显示小红点
 tabBarItem.showBadge(value: Int(arc4random_uniform(160)), offset: CGPoint(x: 0.5, y: 0.3))//显示数字／大于99自动转成99+
 tabBarItem.hideBadge()//隐藏
```
