# CommentPlugin
Xcode 中文输入法下快速敲出单行注释符，在连续写多行注释时不用切换输入法

1.运行即可直接将插件安装在程序中

注意
1.CYPrivateHeader.h 中存储了匹配的字符串，不做限制会将要匹配的字符串也替换掉，第二次运行插件就不起作用了。运行起来后做实验不要在 CYPrivateHeader.h 文件和 当前文件中做，因为这两个文件中包含 CYPrivateHeader.h 字符串，会直接被 return。敲击完两个顿号后直接打注释，就会立刻替换。
