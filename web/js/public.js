
<<<<<<< HEAD
//Ñ¡Ïî¿¨²å¼þ
=======
//é€‰é¡¹å¡æ’ä»¶
>>>>>>> 0f6281e20e609089f09d54158833dd359089e44c
(function($){
	$.fn.tabs=function(options){
		var setting={event:"mouseover",now:1};    
		var opts=$.extend(setting,options);
		var title=$(this).find("dl dt a:not(span a)");
		var content=$(this).find("dl dd");
		content.hide();
		content.eq(opts.now-1).show();
		title.eq(opts.now-1).addClass("now");
		title.each(function(i){
			$(this).bind(opts.event,function(){
				title.removeClass("now");
				title.eq(i).addClass("now");
				content.hide();
				content.eq(i).show();
			});
		});
	}
})(jQuery);