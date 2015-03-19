# Introduction #

Web开发中涉及许多路径问题，此规范尝试总结一些经验，避免因为路径问题影响开发和部署。
因为我们的项目大部分都在Microsoft Visual Studio中完成，因此其在“设计时”对路径的解析方式，也极大的影响着我们的工作（主要针对ASP.NET页面的设计视图）。
所以我们在努力消除由路径问题导致的“编译时错误”和“运行时错误”的同时，也必须兼顾VS在“设计时”的路径问题。


# Details #

Add your content here.  Format your content with:
  1. '<%@ Page MasterPageFile="'
  1. '<%@ Register Src="'
  1. '<script src="'
  1. '<link href="'
  1. 服务器端控件声明属性中的路径,如'<asp:LinkButton NavigateUrl="'
  1. html中的路径，如'<form action="'
  1. C#代码中的路径，如'Response.Redirect("'
  1. js代码中的路径，如'window.open("     , document.location="'
  1. css中的路径， 如'url("'