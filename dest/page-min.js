(function(){var a,b,c,d,e,f,g,h;a=1e4;if(this.g_cpu_history)return;f=[],h=50,e=null,d=function(){var a,d;return a=new Date,d=a-e-h,b(Math.floor(d/h)),c(Math.floor(d%h/h*100)),g()},b=function(a){var b;b=[];while(a-->0)b.push(c(100));return b},c=function(b){if(f.length>a)return;return f.push(b)},g=function(){return e=new Date,setTimeout(d,h)},this.g_cpu_history={init:g,data:f}}).call(this),function(){var a,b,c,d,e,f,g,h,i,j;if(!this.g_cpu_history)return;a="http://www.atpanel.com/ued.1.1.2?type=9&id=cpuhistory",c=300,b=2e4,f=!1,e=0,d=function(){var a,b;if(!f&&parseInt(Math.random()*c)!==0)return;b=this.g_cpu_history.data;if(e>0)return;if(!b||!b.length)return;return a=this["g_cpuhistory_"+e++]=new Image,b=g(b).join(","),a.src=""+h()+"&data="+b},g=function(a){var b,c,d,e,f;b=0,c=0;for(e=0,f=a.length;e<f;e++)d=a[e],d===100?b++:d>=50&&c++;return[b,c]},h=function(){return""+a+"&t="+ +(new Date)+"&apikey=fp2012"},typeof (j=this.g_cpu_history).init=="function"&&j.init(),i=this.onunload,this.onunload=function(){return typeof i=="function"&&i(),d()},setTimeout(d,b),location.href.indexOf("__cpuhistory__")>-1&&(f=!0)}.call(this);