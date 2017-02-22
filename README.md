RetainCycleDemo

对EOC书本上bock的retain Cycle例子EOCNetworkFetcherDemo做全面的解析，有部分代码不一致，但逻辑大体相同。

1. 因为block里通过networkFetcher的url属性retain了networkFetcher对象（networkFetcher:1+1=2）；
2. 然后block因访问_fetchedData而retain self（vc:1+1=2）；
3. 进入[networkFetcher startWithCompletionHandler:]，
   self.completionHandler = completion；并没有retain  block对象（Block类型属性在arc默认为copy，即使我们使用了其他的属性特质，故其retainCount仍为1）；

1. 异步请求触发（为了不阻塞主线程）后，startWithCompletionHandler方法返回，接着networkFetcher指针离开作用域，对应的对象（堆里的networkFetcher对象）release，retainCount为1；

通过block执行回调，执行完回调之后，networkFetcher离开 各个对象的retainCount为：

- vc：（如果视图返回到viewA，retainCount：1，否则为2），为1时block内部变量指向它，为2时还有navigation.viewController数组元素指向它。
- block对象：为1，只有networkFetcher对象指向它。
- networkFetcher对象：为1.

显然：networkFetcher <=> block之间存在一个保留环；另外block内部有指向VC对象的指针。故最合适的方法就是通过释放block对象来破坏保留环，还有释放VC对象。

做法就是执行完block回调后的 self.completionHandler = nil;//block对象释放，然后block指向networkFetcher对象的指针=nil，然后触发networkFetcher对象释放。

另外，self.completionHandler = nil；会使得block对象里指向vc的strong类型指针=nil，这又会触发vc对象的释放。

故 self.completionHandler = nil 引起的对象释放顺序为 completionHandler块对象释放 -> networkFetcher对象释放、vc对象释放。
