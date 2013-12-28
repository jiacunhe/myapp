function Dialog(title,x,y,width,height)
{
	var object=this;
	var hwnd=this.Hwnd=parseInt(Math.random()*1000000000000);
	var dialogMask;
    this.Title=title?title:"无标题";
    this.Width=width?width:300;
    this.Height=height?height:200;
    //this.X=x?x:(document.documentElement.clientWidth-this.Width)/2;
    //this.Y=y?y:document.documentElement.scrollTop+(document.documentElement.clientHeight-this.Height)/2;
    this.X=x?x:(document.body.scrollWidth-this.Width)/2;
   // this.X=x?x:document.documentElement.scrollLeft+(document.documentElement.scrollWidth-this.Width)/2;
    this.Y=y?y:document.documentElement.scrollTop+(document.documentElement.scrollHeight-this.Height)/2;

    this.Show=function ()
    {
       this.Dialog.style.display="block";
    }    
    this.Hide=function ()
    {
       if (dialogMask)
       {
          dialogMask.style.display="none";
       }
       this.Dialog.style.display="none";
    }
    
    this.Close=function ()
    {
       if (dialogMask)
       {
           dialogMask.parentNode.removeChild(dialogMask);
       }
       this.Dialog.parentNode.removeChild(this.Dialog);
       this.Dispose();
    }
    
    this.Dispose=function ()
    {       
       this.Dialog=null;
       delete dialogMask;
       dialogMask=null;
       delete object;
       object=null;
    }
    
    if (window.attachEvent) {
		window.attachEvent("onunload", this.Dispose);
	}
	else {
		window.addEventListener("unload", this.Dispose, false);
	};
    
    this.Alert=function (message)
    {
        this.showModelessDialog();
        this.Dialog.childNodes[1].innerHTML="<div class='DialogContentLeft'></div><div class='DialogContentRight'>"+message+"</div><div class='DialogContentButton'><INPUT class='Button' type='button' value='  确 定  ' onmouseover=\"javascript:this.className='ButtonOver'\" onmouseout=\"javascript:this.className='Button'\" onclick='javascript:this.parentNode.parentNode.parentNode.Dialog.Close();this.parentNode.parentNode.parentNode.Dialog.Alert.Dispose();'></div>";
        this.Dialog.lastChild.style.height=this.Dialog.offsetHeight+"px";
    }
    this.Confirm=function (message)
    {
        this.showModelessDialog();
        this.Dialog.childNodes[1].innerHTML="<div class='DialogContentLeft'></div><div class='DialogContentRight'>"+message+"</div><div class='DialogContentButton'><INPUT class='Button' type='button' value=' 确 定 ' onmouseover=\"javascript:this.className='ButtonOver'\" onmouseout=\"javascript:this.className='Button'\" onclick='javascript:this.parentNode.parentNode.parentNode.Dialog.Close();this.parentNode.parentNode.parentNode.Dialog.Confirm.OK();'>&nbsp;&nbsp;&nbsp;<INPUT class='Button' type='button' value=' 取 消 ' onmouseover=\"javascript:this.className='ButtonOver'\" onmouseout=\"javascript:this.className='Button'\" onclick='javascript:this.parentNode.parentNode.parentNode.Dialog.Close();this.parentNode.parentNode.parentNode.Dialog.Confirm.Cancel();'></div>";
        this.Dialog.lastChild.style.height=this.Dialog.offsetHeight+"px";
    }
    
    this.OpenWindow=function (url)
    {
        this.showModelessDialog();
        this.Dialog.childNodes[1].innerHTML="<iframe id='iframeurl' width='100%' src='"+url+"' frameborder=no border=0></iframe>";
        if (window.attachEvent) {
					//alert(this.Dialog.offsetHeight);
					this.Dialog.childNodes[1].style.height=this.Dialog.offsetHeight+"px";
					document.getElementById('iframeurl').height=(this.Dialog.offsetHeight - 28)+"px";
					//this.Dialog.lastChild.style.height=this.Dialog.offsetHeight+"px";
				}else{
					document.getElementById('iframeurl').height=(this.Dialog.offsetHeight - 28)+"px";
				}
    }
    
    this.OpenWindow2=function (as_html)
    {
        this.showModelessDialog();
        this.Dialog.childNodes[1].innerHTML=as_html;
				this.Dialog.lastChild.style.height=this.Dialog.offsetHeight+"px";
    }
    
    this.showModelessDialog=function ()
    {
        dialogMask=document.createElement("div");
        dialogMask.className="DialogMask";
        document.body.appendChild(dialogMask);	
        dialogMask.style.height=document.body.clientHeight+"px";
    }
    
    

    this.SetTitle=function (title)
    {
        this.Title=title;
        headerCenter.innerHTML=this.Title;  
    }   
    this.SetXY=function (x,y)
    {
       this.X=x;
       this.Y=y;
       this.Dialog.style.left=this.X+"px";
       this.Dialog.style.top=this.Y+"px";
    }    
    
   
    this.SetRange=function (width,height)
    {
        this.Width=width;
        this.Height=height;
        //this.X=x?x:(document.documentElement.clientWidth-this.Width)/2;
        //this.Y=y?y:document.documentElement.scrollTop+(document.documentElement.clientHeight-this.Height)/2;
		this.X=x?x:(document.body.scrollWidth-this.Width)/2;
		this.Y=y?y:document.documentElement.scrollTop+(document.documentElement.scrollHeight-this.Height)/2;
        this.Dialog.style.left=this.X+"px";
        this.Dialog.style.top=this.Y+"px";
        this.Dialog.style.width=this.Width+"px";
        //this.Dialog.style.top=this.Height+"px";
        this.Dialog.style.height=this.Height+"px";
    }
    
   
    this.closeShow=function ()
    {
        $('closeImage').style.display="";
    }
     this.closeHide=function ()
    {
        $('closeImage').style.display="none";
    }

 	var dialog=this.Dialog=document.createElement("div");
    document.body.appendChild(dialog);	

	dialog.className="Dialog";
	dialog.Dialog=this;   
    
           
    dialog.style.left=this.X+"px";
	dialog.style.top=this.Y+"px";
	dialog.style.width=this.Width+"px";


	
	var header=document.createElement("div");
	header.className="DialogHeader";
	dialog.appendChild(header);
	
	var headerLeft=document.createElement("div");
	headerLeft.className="DialogHeaderLeft";
	header.appendChild(headerLeft);
	
    var expandImage=document.createElement("div");
	expandImage.className="DialogExpandImage";
	expandImage.setAttribute("State","Expand");
	expandImage.onmouseover=function () {this.className="Dialog"+this.getAttribute("State")+"ImageOver";};
	expandImage.onmouseout=function () {this.className="Dialog"+this.getAttribute("State")+"Image";};
	expandImage.onmousedown=function (e) 
	{
		if (e)
		{
			window.event=e;
		}
   		window.event.cancelBubble = true; 
   		var content=this.parentNode.parentNode.parentNode.childNodes[1];
   		var footer=this.parentNode.parentNode.parentNode.childNodes[2];
		if (this.getAttribute("State")=="Expand")
		{    	   	   
       	   	this.title="展开";
      		this.setAttribute("State","Collapse");
			content.style.display="none";
			footer.style.display="none";
		}
		else
		{
			this.title="折叠";
      		this.setAttribute("State","Expand");
			content.style.display="block";
			footer.style.display="block";
		}
		content=null;
		footer=null;
		this.className="Dialog"+this.getAttribute("State")+"ImageOver";
	} 
	headerLeft.appendChild(expandImage);
	
	
	var headerCenter=document.createElement("div");
	headerCenter.className="DialogHeaderCenter";
	headerCenter.innerHTML=this.Title;		
	header.appendChild(headerCenter);		
			
	var headerRight=document.createElement("div");
	headerRight.className="DialogHeaderRight";
	header.appendChild(headerRight);
	
	var closeImage=document.createElement("div");
	closeImage.id="closeImage";
	closeImage.className="DialogCloseImage";
	closeImage.title="关闭";
	closeImage.onmouseover=function () {this.className="DialogCloseImageOver";};
	closeImage.onmouseout=function () {this.className="DialogCloseImage";};
	closeImage.onmousedown=function (e) 
	{		 
	    window.event.returnValue = true;    
  		object.Close();
	}
	headerRight.appendChild(closeImage);	

		
	var content=document.createElement("div");
	content.className="DialogContent";
	//content.style.border="solid 1px #000000";
	dialog.appendChild(content);  
			
	var footer=document.createElement("div");
	footer.className="DialogFooter";
	footer.id="footer"+hwnd;
	dialog.appendChild(footer);  	

    var iframe=document.createElement("iframe");
	iframe.className="MaskDiv";
	iframe.id="iframe"+hwnd;
	dialog.appendChild(iframe);
	
	header.onmousedown=function (e)
	{		
		if (e)
		{
			window.event=e;
			window.event.srcElement=e.target;      
		}
		window.event.returnValue = true;
		var dialog=this.parentNode;   
		var header=this;
		this.style.cursor="move";
		var offsetX=window.event.clientX-GetLeft(dialog);
		var offsetY=window.event.clientY-GetTop(dialog);
		document.onmousemove=function (e)
		{
			if (e)
			{
				window.event=e;
				window.event.srcElement=e.target;      
			}
    		window.event.returnValue = true;   
    		object.SetXY(window.event.clientX-offsetX,window.event.clientY-offsetY);
         }
         document.onmouseup=function (e)
		 {
		    header.style.cursor="";
			document.onmousemove=null;
			document.onmouseup=null;
			dialog=null;
			header=null;
		 }
    }  
    delete expandImage;
	expandImage=null;
	delete closeImage;
	closeImage=null;
				
	delete headerLeft;
	headerLeft=null;
	delete headerCenter;
	headerCenter=null;				
	delete headerRight;
	headerRight=null;
	
	delete header;
	header=null;
	delete footer;
	footer=null;
	delete content;
	content=null;
	delete dialog;
	dialog=null; 
};  

//显示提示框
function GetLeft(src){
	var left=0;
	while(src){
		left+=src.offsetLeft-src.scrollLeft;
		src=src.offsetParent;
	}
	return left;
}
function GetTop(src){
	var top=-document.documentElement.scrollTop;
	while(src){
		top+=src.offsetTop-src.scrollTop;
		src=src.offsetParent;
	}
	return top;
}