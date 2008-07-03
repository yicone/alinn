
var lunarInfo=new Array(
	0x04bd8,0x04ae0,0x0a570,0x054d5,0x0d260,0x0d950,0x16554,0x056a0,0x09ad0,0x055d2,
	0x04ae0,0x0a5b6,0x0a4d0,0x0d250,0x1d255,0x0b540,0x0d6a0,0x0ada2,0x095b0,0x14977,
	0x04970,0x0a4b0,0x0b4b5,0x06a50,0x06d40,0x1ab54,0x02b60,0x09570,0x052f2,0x04970,
	0x06566,0x0d4a0,0x0ea50,0x06e95,0x05ad0,0x02b60,0x186e3,0x092e0,0x1c8d7,0x0c950,
	0x0d4a0,0x1d8a6,0x0b550,0x056a0,0x1a5b4,0x025d0,0x092d0,0x0d2b2,0x0a950,0x0b557,
	0x06ca0,0x0b550,0x15355,0x04da0,0x0a5d0,0x14573,0x052d0,0x0a9a8,0x0e950,0x06aa0,
	0x0aea6,0x0ab50,0x04b60,0x0aae4,0x0a570,0x05260,0x0f263,0x0d950,0x05b57,0x056a0,
	0x096d0,0x04dd5,0x04ad0,0x0a4d0,0x0d4d4,0x0d250,0x0d558,0x0b540,0x0b5a0,0x195a6,
	0x095b0,0x049b0,0x0a974,0x0a4b0,0x0b27a,0x06a50,0x06d40,0x0af46,0x0ab60,0x09570,
	0x04af5,0x04970,0x064b0,0x074a3,0x0ea50,0x06b58,0x055c0,0x0ab60,0x096d5,0x092e0,
	0x0c960,0x0d954,0x0d4a0,0x0da50,0x07552,0x056a0,0x0abb7,0x025d0,0x092d0,0x0cab5,
	0x0a950,0x0b4a0,0x0baa4,0x0ad50,0x055d9,0x04ba0,0x0a5b0,0x15176,0x052b0,0x0a930,
	0x07954,0x06aa0,0x0ad50,0x05b52,0x04b60,0x0a6e6,0x0a4e0,0x0d260,0x0ea65,0x0d530,
	0x05aa0,0x076a3,0x096d0,0x04bd7,0x04ad0,0x0a4d0,0x1d0b6,0x0d250,0x0d520,0x0dd45,
	0x0b5a0,0x056d0,0x055b2,0x049b0,0x0a577,0x0a4b0,0x0aa50,0x1b255,0x06d20,0x0ada0);

var solarMonth=new Array(31,28,31,30,31,30,31,31,30,31,30,31);
var Gan=new Array("甲","乙","丙","丁","戊","己","庚","辛","壬","癸");
var Zhi=new Array("子","丑","寅","卯","辰","巳","午","未","申","酉","戌","亥");
//var Animals=new Array("鼠","牛","虎","兔","龙","蛇","马","羊","猴","鸡","狗","猪");
var Animals=new Array("猴","鸡","狗","猪","鼠","牛","虎","兔","龙","蛇","马","羊");
var solarTerm = new Array("小寒","大寒","立春","雨水","惊蛰","春分","清明","谷雨","立夏","小满","芒种","夏至","小暑","大暑","立秋","处暑","白露","秋分","寒露","霜降","立冬","小雪","大雪","冬至")
var sTermInfo = new Array(0,21208,42467,63836,85337,107014,128867,150921,173149,195551,218072,240693,263343,285989,308563,331033,353350,375494,397447,419210,440795,462224,483532,504758)
var nStr1 = new Array('日','一','二','三','四','五','六','七','八','九','十')
var nStr2 = new Array('初','十','廿','卅','　')
var monthName = new Array("JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC");

//国历节日 *表示放假日
var sFtv = new Array(
"19490101*元旦",
"19000214 情人节",
"19490308 妇女节",
"19790312 植树节",
"19830315 消费者权益日",
"19000401 愚人节",
"19000501*劳动节",
"19190504 青年节",
"19010512 护士节",
"19500601 儿童节",
"19210701 建党节 ",
"19790701 香港回归纪念",
"19330801 建军节",
"19450808 父亲节",
"19760909 毛泽东逝世纪念",
"19850910 教师节",
"19000928 孔子诞辰",
"19491001*国庆节",
"19481024 联合国日",
"19001112 孙中山诞辰纪念",
"19991220 澳门回归纪念",
"19001225 圣诞节",
"18931226 毛泽东诞辰纪念")

//农历节日 *表示放假日
var lFtv = new Array(
"0101*春节",
"0115 元宵节",
"0505 端午节",
"0707 七夕情人节",
"0715 中元节",
"0815 中秋节",
"0909 重阳节",
"1208 腊八节",
"1223 小年",
"0100*除夕")

var wFtv = new Array("0520 母亲节")
var noticeDays = new Array();
var Today = new Date();// 当前时间
var tY = Today.getFullYear();
var tM = Today.getMonth();
var tD = Today.getDate();
//var beAbleBuyDate_start = "2008-01-30";// 日历的开始显示日期
var beAbleBuyDate_start_year = tY;// 日历的开始显示年份
var beAbleBuyDate_start_month = 1;// 日历的开始显示月份

var width = "130";
var offsetx = 2;
var offsety = 16;

var x = 0;
var y = 0;
var snow = 0;
var sw = 0;
var cnt = 0;

var dStyle;
var cld;
var http_request = false;
var noticeDates = new Array();// 提示可购买的日期,日期格式
var buyStartDay;// 记录选中的投放开始日期,日期格式
var buyEndDay;// 记录选中的投放结束日期,日期格式
function lYearDays(y) {
   var i, sum = 348
   for(i=0x8000; i>0x8; i>>=1) sum += (lunarInfo[y-beAbleBuyDate_start_year] & i)? 1: 0
   return(sum+leapDays(y))
} 

function leapDays(y) {
   if(leapMonth(y))  return((lunarInfo[y-beAbleBuyDate_start_year] & 0x10000)? 30: 29)
   else return(0)
}

function leapMonth(y) {
   return(lunarInfo[y-beAbleBuyDate_start_year] & 0xf)
}

function monthDays(y,m) {
   return( (lunarInfo[y-beAbleBuyDate_start_year] & (0x10000>>m))? 30: 29 )
}

function Lunar(objDate) {

   var i, leap=0, temp=0
   var baseDate = new Date(beAbleBuyDate_start_year,0,31)
   var offset   = (objDate - baseDate)/86400000

   this.dayCyl = offset + 40
   this.monCyl = 14

   for(i=beAbleBuyDate_start_year; i<2050 && offset>0; i++) {
      temp = lYearDays(i)
      offset -= temp
      this.monCyl += 12
   }

   if(offset<0) {
      offset += temp;
      i--;
      this.monCyl -= 12
   }

   this.year = i
   this.yearCyl = i-1864

   leap = leapMonth(i)
   this.isLeap = false

   for(i=1; i<13 && offset>0; i++) {
      if(leap>0 && i==(leap+1) && this.isLeap==false)
         { --i; this.isLeap = true; temp = leapDays(this.year); }
      else
         { temp = monthDays(this.year, i); }

      if(this.isLeap==true && i==(leap+1)) this.isLeap = false

      offset -= temp
      if(this.isLeap == false) this.monCyl ++
   }

   if(offset==0 && leap>0 && i==leap+1)
      if(this.isLeap)
         { this.isLeap = false; }
      else
         { this.isLeap = true; --i; --this.monCyl;}

   if(offset<0){ offset += temp; --i; --this.monCyl; }

   this.month = i
   this.day = offset + 1
}

// 获得指定月份的总天数
function solarDays(y,m) {
   if(m==1)
      return(((y%4 == 0) && (y%100 != 0) || (y%400 == 0))? 29: 28)
   else
      return(solarMonth[m])
}

// 获得农历的年份名字
function cyclical(num) {
   return(Gan[num%10]+Zhi[num%12])
}

function calElement(sYear,sMonth,sDay,week,lYear,lMonth,lDay,isLeap,cYear,cMonth,cDay) {

      this.isToday    = false;
      this.sYear      = sYear;
      this.sMonth     = sMonth;
      this.sDay       = sDay;
      this.week       = week;
      this.lYear      = lYear;
      this.lMonth     = lMonth;
      this.lDay       = lDay;
      this.isLeap     = isLeap;
      this.cYear      = cYear;
      this.cMonth     = cMonth;
      this.cDay       = cDay;

      this.color      = '';

      this.lunarFestival = '';
      this.solarFestival = '';
      this.solarTerms    = '';

}

function sTerm(y,n) {
   var offDate = new Date( ( 31556925974.7*(y-beAbleBuyDate_start_year) + sTermInfo[n]*60000  ) + Date.UTC(beAbleBuyDate_start_year,0,6,2,5) );
   return(offDate.getUTCDate());
}

function calendar(y,m) {

   var sDObj, lDObj, lY, lM, lD=1, lL, lX=0, tmp1, tmp2
   var lDPOS = new Array(3)
   var n = 0
   var firstLM = 0

   sDObj = new Date(y,m,1)

   this.length    = solarDays(y,m)
   this.firstWeek = sDObj.getDay()

   for(var i=0;i<this.length;i++) {

      if(lD>lX) {
         sDObj = new Date(y,m,i+1)
         lDObj = new Lunar(sDObj)
         lY    = lDObj.year
         lM    = lDObj.month
         lD    = lDObj.day
         lL    = lDObj.isLeap
         lX    = lL? leapDays(lY): monthDays(lY,lM)

         if(n==0) firstLM = lM
         lDPOS[n++] = i-lD+1
      }

      this[i] = new calElement(y, m+1, i+1, nStr1[(i+this.firstWeek)%7],
                               lY, lM, lD++, lL,
                               cyclical(lDObj.yearCyl) ,cyclical(lDObj.monCyl), cyclical(lDObj.dayCyl++) )


      if((i+this.firstWeek)%7==0)   this[i].color = '#FF5F07'
      if((i+this.firstWeek)%14==13) this[i].color = '#FF5F07'
   }

   tmp1=sTerm(y,m*2  )-1
   tmp2=sTerm(y,m*2+1)-1
   this[tmp1].solarTerms = solarTerm[m*2]
   this[tmp2].solarTerms = solarTerm[m*2+1]
   if(m==3) this[tmp1].color = '#FF5F07'

   for(i in sFtv) {
      if(sFtv[i].match(/^(\d{4})(\d{2})(\d{2})([\s\*])(.+)$/)) {
         if(Number(RegExp.$1)<=y && Number(RegExp.$2)==(m+1)) {
            this[Number(RegExp.$3)-1].solarFestival += RegExp.$5 + ' '
            if(RegExp.$4=='*') this[Number(RegExp.$3)-1].color = '#FF5F07'
         }
      }
   }

   for(i in wFtv)
      if(wFtv[i].match(/^(\d{2})(\d)(\d)([\s\*])(.+)$/))
         if(Number(RegExp.$1)==(m+1)) {
            tmp1=Number(RegExp.$2)
            tmp2=Number(RegExp.$3)
            this[((this.firstWeek>tmp2)?7:0) + 7*(tmp1-1) + tmp2 - this.firstWeek].solarFestival += RegExp.$5 + ' '
         }

   for(i in lFtv)
      if(lFtv[i].match(/^(\d{2})(.{2})([\s\*])(.+)$/)) {
         tmp1=Number(RegExp.$1)-firstLM
         if(tmp1==-11) tmp1=1
         if(tmp1 >=0 && tmp1<n) {
            tmp2 = lDPOS[tmp1] + Number(RegExp.$2) -1
            if( tmp2 >= 0 && tmp2<this.length) {
               this[tmp2].lunarFestival += RegExp.$4 + ' '
               if(RegExp.$3=='*') this[tmp2].color = '#FF5F07'
            }
         }
      }

   //if((this.firstWeek+12)%7==5)
   //   this[12].solarFestival += '黑色星期五 ';

   if(y==tY && m==tM) {
   		this[tD-1].isToday = true;
   }

}

// 年月日的上下箭头事件处理
function pushBtm(K) {
	var SY = document.getElementById("SY");
	var SM = document.getElementById("SM");
	switch (K){
		case 'YD' :
			if(SY.selectedIndex>0) SY.selectedIndex--;
			break;
		case 'YU' :
			if(SY.selectedIndex<149) SY.selectedIndex++;
         	break;
      	case 'MD' :
         	if(SM.selectedIndex>0) {
            	SM.selectedIndex--;
         	} else {
            	SM.selectedIndex=11;
            	if(SY.selectedIndex>0) SY.selectedIndex--;
         	}
         	break;
      	case 'MU' :
         	if(SM.selectedIndex<11) {
            	SM.selectedIndex++;
         	} else {
            	SM.selectedIndex=0;
            	if(SY.selectedIndex<149) SY.selectedIndex++;
         	}
         	break;
      	default :
         	SY.selectedIndex=tY-beAbleBuyDate_start_year;
         	SM.selectedIndex=tM;
	}
   	changeCld();
}
// 日期变化后的处理
function changeCld() {
	var SY = document.getElementById("SY");
	var SM = document.getElementById("SM");
	var year = SY.selectedIndex+beAbleBuyDate_start_year;
	var month = SM.selectedIndex;
	drawCld(year,month);
	var putOnDay = document.getElementById("putOnDay");
	//putOnDay.innerHTML = "";// 清除提示信息
}
// 日期变化时同时清除开始购买,结束时间
function changeCld_1() {
	var SY = document.getElementById("SY");
	var SM = document.getElementById("SM");
	var year = SY.selectedIndex+beAbleBuyDate_start_year;
	var month = SM.selectedIndex;
	drawCld(year,month);
	var putOnDay = document.getElementById("putOnDay");
	putOnDay.innerHTML = "";// 清除提示信息
	buyStartDay = null;
	buyEndDay = null;
}
function drawCld(SY,SM) {
   	var i,sD,s,size;
   	cld = new calendar(SY,SM);

	var sObj;	// 阳历对象

   	for (i = 0; i < 42; i++) {
      	sObj=document.getElementById('SD'+ i);

		sObj.className='';
      	sD = i - cld.firstWeek;

      	if (sD > -1 && sD < cld.length) {
      	 	var day = sD + 1;

			if((i-7) % 7 == 0 || (i-6) % 7 == 0) {	// 写周末日期对象（td中）的内容
				//sObj.innerHTML = '<a class="a_w s_d bolder" href="#" onclick="javascript: selectDay(' + day + ')">' + day + '</a>';
				sObj.innerHTML = '' + day;
			} else {	// 写非周末日期对象（td中）的内容
				//sObj.innerHTML = '<a class="a_d s_d bolder" href="#" onclick="javascript: selectDay(' + day + ')">' + day + '</a>';
				sObj.innerHTML = '' + day;
	        }
	        sObj.className='gray_button';
	       	if (cld[sD].isToday) {	// 如果是今天，修改td的边框
				//sObj.style.border = '1px solid #333366';
				sObj.className='kuang_button';
	   		}
	   		
		} else {
         	sObj.innerHTML = ' ';
		}
	}
	// 时长
	var SDuring = document.getElementById("SDuring");
	var adZoneId = document.getElementById("adZoneId");
	var during = SDuring.value;
	if (during == null || during == "") {
		during = 1;
	}
	// 广告位id
	var adZoneId = adZoneId.value;
	if (adZoneId == null || adZoneId == "") {
		adZoneId = 0;
	}
	// 动态读取可购买相应时长的日期
	ajaxRequest('/Public/GetDayBeAbleToPutCampaignOn.aspx?zoneid='+ adZoneId +'&year=' + SY +'&month=' + (parseInt(SM)+1) + '&during=' + during);
}

function ajaxRequest(url) {
	/* 通过ajax读取数据 */
    if (window.XMLHttpRequest) { // Mozilla, Safari,...
        http_request = new XMLHttpRequest();
        if (http_request.overrideMimeType) {
           http_request.overrideMimeType('text/xml');
        }

	    http_request.onreadystatechange = viewNoticeDays;
	    http_request.open('GET', url, true);
	    http_request.setRequestHeader('Content-Type', 'text/xml');
	    http_request.setRequestHeader('Pragma', 'no-cache');
	    http_request.setRequestHeader('Cache-Control', 'no-cache,no-store,must-revalidate');
	    http_request.setRequestHeader('Expires', '0');
	    http_request.send(null);
    } else if (window.ActiveXObject) { // IE
        try {
        	http_request = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
            	http_request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
        }

	    if (http_request) {
	        http_request.onreadystatechange = viewNoticeDays;
		    http_request.open('GET', url, true);
		    http_request.setRequestHeader('Content-Type', 'text/xml');
		    http_request.setRequestHeader('Pragma', 'no-cache');
		    http_request.setRequestHeader('Cache-Control', 'no-cache,no-store,must-revalidate');
		    http_request.setRequestHeader('Expires', '0');
		    http_request.send();
	    } else {
	   		alert('Giving up :( Cannot create an XMLHTTP instance');
		}
    }
    else {
    	alert("暂时还未能支持您的浏览器");
    }
}

function viewNoticeDays() {	// 修改需要提醒日期的背景色
	var SY = document.getElementById("SY");
	var SM = document.getElementById("SM");
	var year = SY.selectedIndex+beAbleBuyDate_start_year;
	var month = SM.selectedIndex;
	var during = document.getElementById("SDuring");
	if (http_request.readyState == 4) {
        if (http_request.status == 200) {        
        	// 根据返回的XML的内容，更新noticeDays数组中的信息
        	noticeDays = new Array();
        	var xmlDoc;
        	if (window.XMLHttpRequest) { // Mozilla, Safari,...
				var browser=navigator.appName;
				var b_version=navigator.appVersion;
				var version=b_version.split(";");
				var trim_Version=version[1].replace(/[ ]/g,"");
				if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE7.0"){// IE7
	    			xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
	    			xmlDoc.loadXML(http_request.responseText);
				} else {
					xmlDoc = http_request.responseXML;
				}
			} else if (window.ActiveXObject) { // IE6
    			xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    			//xmlDoc.async = "false";
    			xmlDoc.loadXML(http_request.responseText);
			} else {
				alert("暂时不支持您的浏览器");
			}
        	var dayOfMonthTags = xmlDoc.getElementsByTagName('day_of_month');
			for (var i = 0; i < dayOfMonthTags.length; i++) {
				noticeDays[i] = dayOfMonthTags.item(i).firstChild.data;
			}
			var index = 0;
			noticeDates = new Array();
			for (i = 0; i < 42; i++) {
		      	sObj=document.getElementById('SD'+ i);
		      	sD = i - cld.firstWeek;
		      	if (sD > -1 && sD < cld.length) {
		      	 	var day = sD + 1;
			      	for (var y = 0; y < noticeDays.length; y++) {
			         	if (day == noticeDays[y]) {
			         		var date = getDate(year,month,'SD'+ i);
			         		noticeDates[index++] = date;
					        if (buyStartDay <= date && date <= buyEndDay) {
					        	sObj.className='red_button';
					        } else {
					        	sObj.className='blue_button';// 可以购买的背景色
					        }
			          		break;
			         	}
			      	}
				}
			}
        } else {
            alert('There was a problem with the request.' + http_request.status);
        }
    }
}
// 初始化方法
function initial() {
	//var y = ;
	//var m = ;
	var y = tY;
	var m = tM;
   	dStyle = document.getElementById("detail").style;
   	var SY = document.getElementById("SY");
	var SM = document.getElementById("SM");
   	SY.selectedIndex=y-beAbleBuyDate_start_year;
   	SM.selectedIndex=m;
   	drawCld(y,m);
}

// 选择起始日期
function selectDay(tdId) {
	var SY = document.getElementById("SY");
	var SM = document.getElementById("SM");
	var year = SY.selectedIndex+beAbleBuyDate_start_year;
	var month = SM.selectedIndex;
	var during = document.getElementById("SDuring");
	var selectDay = document.getElementById(tdId);
	var selectDate = getDate(year,month,tdId);
	// 只有noticeDates数据组中的日期才可以点击
	if(indexOf(noticeDates,selectDate) != -1){
		// 当现在选择的起始日，不为原起始日的时候
		if (selectDay != buyStartDay) {
			// at first
			// 恢复为初始状态
			
			var redObj;
			for (i = 0; i < 42; i++) {
		      	redObj=document.getElementById('SD'+ i);
		      	sD = i - cld.firstWeek;
		      	if (sD > -1 && sD < cld.length) {
		      		redObj.className='gray_button';
			       	if (cld[sD].isToday) {	// 如果是今天，修改td的边框
						redObj.className='kuang_button';
			   		}
		      	 	var day = sD + 1;
			      	for (var y = 0; y < noticeDays.length; y++) {
			         	if (day == noticeDays[y]) {
					        redObj.className='blue_button';// 可以购买的背景色
			         	}
			      	}
				}
			}
			// at second
			// 根据选择的tdId,重新设定活动的开始日期，结束日期
			buyStartDay = getDate(year,month,tdId);
			buyEndDay = getEndDate(buyStartDay,during.value);
			// at third
			// 根据起始日期,结束日期重新在日历中标识选中投放的日期
			var tdIdDate;
			//alert("开始日期"+buyStartDay.getFullYear()+"-"+buyStartDay.getMonth()+"-"+buyStartDay.getDate());
			//alert("结束日期"+buyEndDay.getFullYear()+"-"+buyEndDay.getMonth()+"-"+buyEndDay.getDate());
			var temp = 0;
			for (i = 0; i < 42; i++) {
				tdIdDate = getDate(year,month,'SD' + i);
				//alert("td日期"+tdIdDate.getFullYear()+"-"+tdIdDate.getMonth()+"-"+tdIdDate.getDate());
				redObj = document.getElementById('SD'+ i);
				
				if (buyStartDay <= tdIdDate && redObj.className == 'blue_button') {
					//alert("td日期"+tdIdDate.getFullYear()+"-"+tdIdDate.getMonth()+"-"+tdIdDate.getDate());
					redObj.className='red_button';
					temp++;
					
					if(temp >= during.value){
					    buyEndDay = getDate(year,month,'SD' + i);
					    break;
					}
				}
			}
		}
		// 提示购买信息

		var putOnDay = document.getElementById("putOnDay");
		var putOnDayHtml = "";
		
		var buyStartDayStr = buyStartDay.getFullYear() + "-";
		if(buyStartDay.getMonth()+1<10){
			buyStartDayStr=buyStartDayStr+"0"+(buyStartDay.getMonth()+1);
		}else{
			buyStartDayStr=buyStartDayStr+(buyStartDay.getMonth()+1);
		}
		if(buyStartDay.getDate()<10){
			buyStartDayStr=buyStartDayStr+"-0"+(buyStartDay.getDate());
		}else{
			buyStartDayStr=buyStartDayStr+"-"+(buyStartDay.getDate());
		}
		
		var buyEndDayStr = buyEndDay.getFullYear() + "-"; 
		if(buyEndDay.getMonth()+1<10){
			buyEndDayStr=buyEndDayStr+"0"+(buyEndDay.getMonth()+1);
		}else{
			buyEndDayStr=buyEndDayStr+(buyEndDay.getMonth()+1);
		}
		if(buyEndDay.getDate()<10){
			buyEndDayStr=buyEndDayStr+"-0"+(buyEndDay.getDate());
		}else{ 
			buyEndDayStr=buyEndDayStr+"-"+(buyEndDay.getDate());
		}
		putOnDayHtml += "<p>起始日期:" + buyStartDayStr + "</p>";
		putOnDayHtml += "<p>结束日期:" + buyEndDayStr + "</p>";
		putOnDayHtml += "<p>购买天数:" + during.value + "天</p>";
		putOnDay.innerHTML = putOnDayHtml;
		var startDate = document.getElementById("startDate");
		var endDate = document.getElementById("endDate");
		startDate.value=buyStartDayStr;
		endDate.value=buyEndDayStr;
	}
}
function mOvr(tdId) {

	// 鼠标经过的时间对象
	var selectDay = document.getElementById(tdId);
	if (selectDay.className != 'gray_button' && selectDay.className != '') {
		selectDay.style.cursor="pointer";
		if (selectDay.className=="blue_button" || selectDay.className=="blue_yellow_button") {
			selectDay.className="blue_yellow_button";
		}
	}
}
function mOut(tdId) {
	// 鼠标移出的时间对象
	var selectDay = document.getElementById(tdId);
	if (selectDay.className != 'gray_button' && selectDay.className != '') {
		if (selectDay.className=="blue_yellow_button") {
			selectDay.className="blue_button";
		}
	}
}
// 根据tdId获得日期
function getDate(year,month,tdId) {
	var date=new Date();
	var sD = tdId.substr(2,2) - cld.firstWeek;
	var day;
	var dayOfMonth = solarDays(year,month);
	if (sD > -1 && sD < dayOfMonth) {
		day = sD + 1;
	} else {
		day = null;
	}
	date=new Date(year,month,parseInt(day));
	return date;
}
// 根据日期获得tdId
function getTdId(date) {
	var newDate = new Date(date.getFullYear(),date.getMonth(),1);
	var firstWeek = newDate.getDay();
	return 'SD' + (date.getDate() + parseInt(firstWeek) - 1);
}
// 由开始日期,时长获得结束日期
function getEndDate(startDate,during) {
	var endDate=new Date();
	endDate=new Date(startDate.getFullYear(),startDate.getMonth(),startDate.getDate()+parseInt(during)-1);
	return endDate;
}
// 返回某元素在数组中的位置
function indexOf(array,object) {
	for (var i = 0; i < array.length; i++){
		// 再两个时间进行相等比较的时候,不可以用"=="
		if (array[i] >= object && array[i] <= object) return i;
	}
	return -1;
}