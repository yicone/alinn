//定义TextZone对象
function TextZone(zoneSize, layoutType){
    this.zoneSize = zoneSize;
    this.layoutType = layoutType;
    
    this.preDiv = $("#pre");
    //this.bgimgDiv = $("#bgimg");
    this.outerDiv = $("#outer");
    this.zoneDiv = $("#zone");
    this.maininnerDiv = $("#main_inner");
    this.maintitleDiv;
    this.maintextDiv;
    this.mainlinkDiv;
    //this.iconDiv = $("#icon");
    this.Style;
    this.Designer = new TextZoneDesigner();
    
    if (typeof TextZone._initialized == "undefined") {
        //设置对象的“样式”属性
        TextZone.prototype.setStyle = function(style){
            if (style instanceof TextZoneStyle) {
                this.Style = style;
            }
        };
        //对广告位应用样式
        TextZone.prototype.applyStyle = function(isSyncToDesinger){
            //	            if(typeof _currentStyle == "undefined" || !_currentStyle instanceof TextZoneStyle){
            //	                assert(false, "广告位样式未定义");
            //		            $w._currentStyle = defaultStyle;
            //	            }
            if (this.Style != undefined) {
                var titlecolor = this.Style.title$color;
                this.maintitleDiv.css("color", "#" + this.Style.title$color);
                this.maintextDiv.css("color", "#" + this.Style.text$color);
                this.mainlinkDiv.css("color", "#" + this.Style.link$color);
                
                //this.bgimgDiv.css("display", "none");
                this.preDiv.css("display", "");
                //this.preDiv.css("border", "1px solid #" + this.Style.border$color);
                
//                if (this.Style.background$image == 0) {//不带背景
//                    this.preDiv.css("background-color", "#" + this.Style.background$color);
//                    this.preDiv.css("background-image", "");
//                }
//                else {//带背景
//                    this.preDiv.css("background-color", "#" + this.Style.background$color);
//                    //this.preDiv.css("backgroundImage", "url('"+imgHome+"/adzone/bg"+s.bgi+".gif')");
//                }
                
                //将样式同步到设计器
                if (isSyncToDesinger) {
                    this.Designer.init(this.Style);
                }
            }
        };
        TextZone.prototype.changeDivSize = function(element, w1, h1){
            element.css("width", w1 + "px");
            element.css("height", h1 + "px");
        };
        
        //设置广告位的大小和对应大小的容器样式
        TextZone.prototype.initZone = function(title, link, text, isDefaultZone){
            var w = parseInt(this.zoneSize.split("x")[0]);
            var h = parseInt(this.zoneSize.split("x")[1]);
            if(isDefaultZone == "true")
            {
            title = "阿里奶奶：好产品更需要好广告";
            text = "我们一起创建公开、透明的广告交易平台。买广告，卖广告，一切都很轻松!";
            link = "www.alinn.com";
            }
            
            //修改文字广告牌
            var outerDiv = this.outerDiv;
            var zoneDiv = this.zoneDiv;
            this.changeDivSize(outerDiv, w, h);
            this.changeDivSize(zoneDiv, w - 10, h - 10);
            //changeSize(this.iconDiv, iconWidth, iconHeight); //TODO:iconWidith,iconHeight未定！
            //p_icon.css("left", (w - iconWidth -1));
            //p_icon.css("top", (h - iconHeight));
            //changeDivSize(this.bgimgDiv, w, h);
            this.changeDivSize(this.preDiv, w - 2, h - 2);
            
            if (this.layoutType == "1") {
                this.maininnerDiv.html("<tr><td id='main_title_outer' class='t" + this.zoneSize + "' nowrap><div id='main_title'>" + title + "</div><div id='main_link_outer' class='l" + this.zoneSize + "'><div id='main_link'>" + link + "</div></div></td><td id='main_text_outer' class='d" + this.zoneSize + "'><div id='main_text'>" + text + "</div></td></tr>");
            }
            else {
                this.maininnerDiv.html("<tr><td valign='middle'><div id='main_title_td' class='t" + this.zoneSize + "'><div id='main_title' style='color: rgb(0, 0, 255);'>"+title+"</div></div><div id='main_text_td' class='d" + this.zoneSize + "'><div id='main_text' style='color: rgb(0, 0, 0);'>"+text+"</div></div><div id='main_link_td' class='l" + this.zoneSize + "'><div id='main_link' style='color: rgb(0, 128, 0);'>"+link+"/div></div></td></tr>");
            }
            //在构造完整的广告位之后，取得对应三个文字区域的JQuery对象
            this.maintitleDiv = $("#main_title");
            this.maintextDiv = $("#main_text");
            this.mainlinkDiv = $("#main_link"); 
        };
        
        TextZone._initialized = true;
    }
}


//定义TextZoneDesigner对象
function TextZoneDesigner(){
    
    if (typeof TextZoneDesigner._initialized == "undefined") {
        TextZoneDesigner.prototype.setField = function(field, color){
            $("#colorfield-" + field).val(color);
            $("#colorsample-" + field).css("background-color", "#" + color);
        }
        TextZoneDesigner.prototype.init = function(style){
            this.setField("title", style.title$color);
            this.setField("text", style.text$color);
            this.setField("link", style.link$color);
            this.setField("border", style.border$color);
            this.setField("background", style.background$color);
            this.setField("grounding", style.grounding$color);
            //	$("#imagesample-bg").css("backgroundimage", "url('"+imageHome+"/zone/bg"+this.background$image+".gif");
            //	$("#imagesample-zj").css("backgroundimage", "url('"+imageHome+"/zone/zj"+this.corner$style+".gif");
            //	//sync to radio for icon
            //	var radio = $("#radioIcon");
            //    for (var i; i < radio.length; i++) {
            //        if (radio.val == this.icon$image) {
            //            radio.attr("checked", "true");
            //        }
            //        else {
            //            radio.attr("checked", "false");
            //        }
            //    }
        };
        
        TextZoneDesigner._initialized = true;
    }
}

//定义TextZoneStyle对象
function TextZoneStyle(jsonString){
    eval("array=" + jsonString + ";");
    this.title$color = array[0];
    this.text$color = array[1];
    this.link$color = array[2];
    this.border$color = array[3];
    this.background$color = array[4];
    this.grounding$color = array[5];
    this.corner$style = array[6]; //转角规格
    this.background$image = array[7];
    this.icon$image = array[8];
    
    if (typeof TextZoneStyle._initialized == "undefined") {
        TextZoneStyle.prototype.toJson = function(){
            //TODO：替换为Microsoft.AJAX的JSON序列化方法，或使用StringBuilder
            return '["' + this.title$color + '","' + this.text$color + '","' + this.link$color + '","' + this.border$color + '","' + this.background$color + '","' + this.grounding$color + '",' + this.corner$style + ',' + this.background$image + ',' + this.icon$image + ']';
        };
        
        TextZoneStyle._initialized = true;
    }
}

function copyCode(jscode){
    if (window.clipboardData) {
        window.clipboardData.setData("Text", jscode);
        alert('已成功复制到剪贴板！您可以将代码加入到您的网站页面里了！\n\n请不要修改代码，否则会导致无法激活。');
    }
}

function generateCode(zoneId, oTextZoneStyle, sizeCode, layoutType){
    var sbJs = new StringBuilder('<script type="text/JavaScript"> \n');
    sbJs.append('alinn_pid="');
    sbJs.append(zoneId);
    sbJs.append('"; \n');

    sbJs.append('alinn_titlecolor="');
    sbJs.append(oTextZoneStyle.title$color);
    sbJs.append('"; \n');
    
    sbJs.append('alinn_textcolor="');
    sbJs.append(oTextZoneStyle.text$color);
    sbJs.append('"; \n');
    
    sbJs.append('alinn_linkcolor="');
    sbJs.append(oTextZoneStyle.link$color);
    sbJs.append('"; \n');
    
    sbJs.append('alinn_bordercolor="');
    sbJs.append(oTextZoneStyle.border$color);
    sbJs.append('"; \n');
    
    sbJs.append('alinn_backgroundcolor="');
    sbJs.append(oTextZoneStyle.background$color);
    sbJs.append('"; \n');
    
    sbJs.append('alinn_groundingcolor="');
    sbJs.append(oTextZoneStyle.grounding$color);
    sbJs.append('"; \n');
    
    sbJs.append('alinn_cornerstyle="');
    sbJs.append(oTextZoneStyle.corner&style);
    sbJs.append('"; \n');
	
	sbJs.append('alinn_backgroundimage="');
    sbJs.append(oTextZoneStyle.background$image);
    sbJs.append('"; \n');
	
    sbJs.append('alinn_iconimage="');
    sbJs.append(oTextZoneStyle.icon$image);
    sbJs.append('"; \n');
	
	sbJs.append('alinn_sizecode="');
    sbJs.append(sizeCode);
    sbJs.append('"; \n');
	
		sbJs.append('alinn_layouttype="');
    sbJs.append(layoutType);
    sbJs.append('"; \n');
	
	sbJs.append('<\/script> \n');
	sbJs.append('<script src="http://www.aaaa0.com/JavaScript/jquery.js" type=text/javascript> \n');
	sbJs.append('<\/script>');
	sbJs.append('<script src="http://www.aaaa0.com/JavaScript/inf.js" type=text/javascript> \n');
	sbJs.append('<\/script>');
	
	$("#genjstxt").val(sbJs.toString());
}

//TODO:移入common.js
function StringBuilder(value){
    this.strings = new Array("");
    this.append(value);
}

StringBuilder.prototype.append = function(s){
    if (s) {
        this.strings.push(s);
    }
}
StringBuilder.prototype.clear = function(){
    this.strings.length = 1;
}
StringBuilder.prototype.toString = function(){
    return this.strings.join("");
}

