在ppt中bvpinit的调用，除了`xmesh`，还输入了`x1`和`x2`两个变量，对此问题的探讨
---
参考资料为math works官方的函数说明文档：[bvp5c](https://ww2.mathworks.cn/help/matlab/ref/bvp5c.html)、[bvpinit](https://ww2.mathworks.cn/help/matlab/ref/bvpinit.html#mw_1c665a1d-6f2b-438a-95eb-6c6a2cd19026)。

在`bvp5c`的说明文档中的子标题`solinit - 解的初始估计值`中详细描述了`bvpinit`输出数据的详细含义。并且，在介绍`odefun`和`bcfun`的部分中详细描述了`未知参数`的概念。这些概念对理解`bvpinit`的使用方法有帮助。

接着阅读`bvpinit`文档，可以得知在采用`solinit = bvpinit(x,yinit)`调用方法时还可以在`yinit`后加上`未知变量`的输入，即`solinit = bvpinit(___,parameters)`。因此，结合ppt前文，ppt中`x1`和`x2`两个变量的含义也就明了了。个人认为`x2`为`未知变量`的初始估计值向量。
