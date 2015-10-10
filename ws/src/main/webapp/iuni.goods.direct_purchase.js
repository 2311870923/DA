/******************************
 ֱ��

 2014-05-15 16:24:57 wangzz ����
 *******************************/
$namespace("iuni.goods.direct_purchase");
/******************************
 ��ȫ�ֲ�������
 *******************************/
iuni.goods.direct_purchase.data={
	productData:bu_productData,    //��Ʒ����
	mainRole:'',
	disbuy:"btn_gray",         //����ť�û�
	attrSelected:"acc_inor_typelist_onthis",     //����ѡ��
	attrDis:"action_false",          //���Բ���ѡ
	attrNoStock:"no_Stock"   //�����޿��	
};
iuni.goods.direct_purchase.dom={
	attrCon:$id("attr_con"),    //���Բ���
	attrsObject:{},                   //����dom�Ķ�����ʽ
	attrsArr:[],                       //����dom��һά������ʽ

	btn_buy:$id("btnNext"),      //����ť����һ����
	goodsPrice:$id("goodsPrice_con"),  //�۸񲿷�
	quanlityNum:$id("quanlity_num"),   //��������
	btn_buy2:$id("buy_cart")  //tab�ϵĹ���ť
};
/******************************
 ����ʼ������
 *******************************/
iuni.goods.direct_purchase.init=function(){
	var that=this;

	//��ʽ������
	that.initData();

	//��ʼ����Ʒ����
	that.initAttr();

	//��ʼ�������������
	that.initQuantity();

	//�����¼�
	that.addListener();

	//��ʼ��ͼƬ����
	that.initImage();

	//��ʼ���Ƽ����
	that.initReco();

	//��ʼ�����tab����
	that.initTab();

};
/******************************
 ������ʵ����
 *******************************/
iuni.goods.direct_purchase.initData=function(){
	var that=this,
		attrsObject=that.dom.attrsObject,
		attrsArr=that.dom.attrsArr,
		tagName="action_tag";

	//��ʽ������
	var productData=that.data.productData;
	productData.attrGroupList=productData.attrGroupList || {};

	//��ʽ������
	attrsArr=$attr(tagName,null,that.dom.attrCon);
	that.dom.attrsArr=attrsArr;

	//��ʽObject
	for(var i=0,len=attrsArr.length,attr,type;i<len;i++){
		attr=attrsArr[i];
		type=attr.getAttribute(tagName);
		if(!attrsObject[type]){
			attrsObject[type]=[];
		}
		attrsObject[type].push(attr);
	}

	if(len>0){
		that.data.mainRole=attrsArr[0].getAttribute(tagName) || "";
	}

	//�������������
	var product=that.data.productData;
	if(isNaN(product.max_buy_num-0)){
		product.max_buy_num=9;
	}
};

iuni.goods.direct_purchase.initAttr=function(){
	var that=this,
		productData=that.data.productData;

	var curProduct=productData.attrGroupList[productData.sku_id] || {},
		dataList=curProduct.dataList || {},
		attrsArr=[];

	for(var i in dataList){
		if(dataList.hasOwnProperty(i)){
			attrsArr.push(dataList[i].itemId);
		}
	}

	//�����Ը���
	var domAttrs=that.dom.attrsArr;
	var len=attrsArr.length,
		lenj=domAttrs.length,
		i=0,
		j=0,
		item,
		selected=that.data.attrSelected;

	for(var i=0; i<len; i++){

		for(var j=0;j<lenj;j++){
			item=domAttrs[j];
			if(item.getAttribute("action_data")===attrsArr[i]){
				$(item).addClass(selected);
				break;
			}

		}

	}

	//��ֹ�޴�����Ʒ�����ԣ��û�ȱ����Ʒ
	that.setAttribute(attrsArr);
	that.changeBuyStatus(true);
};

iuni.goods.direct_purchase.setAttribute=function(attrsSelectedArr){
	attrsSelectedArr=attrsSelectedArr || [];

	var that=this,
		attrGroupList=that.data.productData.attrGroupList,
		attrDis=that.data.attrDis,
		attrNoStock=that.data.attrNoStock,
		attrSelected=that.data.attrSelected,
		attrsObject=that.dom.attrsObject,
		attrList,
		select=that.data.attrSelected;

	for(var i in attrsObject){
		if(attrsObject.hasOwnProperty(i)){

			//ĳһ������
			attrList=attrsObject[i];

			//ĳһ��ѡ��dom
			var seletedDom;
			for(var j=0,lenj=attrList.length;j<lenj;j++){
				if($(attrList[j]).hasClass(select)){
					seletedDom=attrList[j];
					break;
				}
			}

			//ĳһ����ѡ�е�����
			var selectedAttr=[];
			if(seletedDom){
				var item=seletedDom.getAttribute("action_data");
				for(var j=0,lenj=attrsSelectedArr.length;j<lenj;j++){
					if(item!==attrsSelectedArr[j]){
						selectedAttr.push(attrsSelectedArr[j]);
					}
				}
			}

			//û�д�����Ʒ������
			var isMain=!!(i===that.data.mainRole);
			for(var k=0,lenk=attrList.length,itemDom;k<lenk;k++){
				itemDom=attrList[k];
				if(itemDom===seletedDom){
					continue;
				}

				var itemDomj=$(itemDom);
				itemDomj.removeClass(attrSelected);
				itemDomj.removeClass(attrNoStock);
				itemDomj.removeClass(attrDis);

				var result=that.getSKUProduct(selectedAttr.concat(itemDom.getAttribute("action_data")));
				if(result){
					if(result.stock >0){
						continue;
					}else{
						itemDomj.addClass(attrNoStock);
					}
				}else{
					if(isMain){
						itemDomj.addClass(attrNoStock);
					}else{
						itemDomj.addClass(attrDis);
					}
				}
			}
		}
	}
};
iuni.goods.direct_purchase.getSKUProduct=function(selectedArr){
	selectedArr=selectedArr || [];

	var result=null,
		attrGroupList=this.data.productData.attrGroupList || {},
		groupItem,
		dataList;
	for(var m in attrGroupList){
		if(attrGroupList.hasOwnProperty(m)){

			groupItem=attrGroupList[m] || {};
			dataList=groupItem.dataList || {};
			for(var n=0,lenn=selectedArr.length;n<lenn;n++){

				for(var k=0,lenk=dataList.length;k<lenk;k++){
					if(dataList[k].itemId==selectedArr[n]){
						break;
					}
				}
				if(k>=lenk){  //û���ҵ�selectedArr[n]
					break;
				}

			}

			if(n>=lenn){//����
				if(groupItem.stock>0){
					result=groupItem;
					return  result;
				}else if(!result){
					result=groupItem;
				}
			}
		}
	}

	return  result;
};
iuni.goods.direct_purchase.initQuantity=function(){
	var less=$id("quanlity_redu"),
		plus=$id("quanlity_plus"),
		txt=$id("quanlity_num");

	function setQuantity(num,maxValue,minValue) {
		var num=num || 1;
		var minValue=minValue || 1;
		var max_buy_num=iuni.goods.direct_purchase.data.productData.max_buy_num,
			stock=iuni.goods.direct_purchase.data.productData.stock,
			maxValue=maxValue || (max_buy_num<stock?max_buy_num:stock);

		if(maxValue<1){
			maxValue=1;
		}
		if(minValue<1){
			minValue=1;
		}

		num = parseInt(num);
		isNaN(num) ? (num = 1) : (num = num);

		if(num>maxValue){
			num=maxValue;
		}
		txt.innerHTML = num;

		if (num <=minValue) {
			less.className = "number_reduce action_false";
		} else {
			less.className = "number_reduce";
		}

		if (num >= maxValue) {
			plus.className = "number_add action_false";
		} else {
			plus.className = "number_add";
		}
	};

	//���¼�
	$bindEvent(less,function(){
		var less=$(this);
		if(less.hasClass("number_false")){
			return;
		}
		var num=txt.innerHTML-0;
		setQuantity(num-1);
	},"click");

	$bindEvent(plus,function(){
		var plus=$(this);
		if(plus.hasClass("number_false")){
			return;
		}
		var num=txt.innerHTML-0;
		setQuantity(num+1);
	},"click");


	setQuantity();
};
iuni.goods.direct_purchase.addListener=function(){
	var that=this;

	//��������
	$bindEvent(that.dom.attrCon,function(e){
		var e=e || window.event,
			target=e.target || e.srcElement,
			elem=target,
			doc=this;

		var tagName="action_tag",
			tag;

		while(elem!==doc){
			tag=elem.getAttribute(tagName);
			if(tag){
				break;
			}else{
				elem=elem.parentNode;
			}
		}

		if(tag){
			if($(elem).hasClass(that.data.attrSelected) || $(elem).hasClass(that.data.attrDis)){
				$preventDefault(e);
			}else{
				changeAttr(elem);
			}
		}

	},"click");

	function changeAttr(elem){
		var type=elem.getAttribute("action_tag");
		var attrsObject=that.dom.attrsObject;
		var elemj=$(elem),selected=that.data.attrSelected;

		if(!attrsObject[type]){
			return;
		}

		$(attrsObject[type]).removeClass(selected);
		elemj.addClass(selected);

		//��ȡѡ�е�����
		var attrsArr=that.dom.attrsArr,
			skuArr=[];

		for(var i=0,len=attrsArr.length;i<len;i++){
			attrs=attrsArr[i];
			if($(attrs).hasClass(selected)){
				skuArr.push(attrs.getAttribute("action_data"));
			}
		}

		//��ȡѡ�е�sku��Ʒ     
		var result=that.getSKUProduct(skuArr);
		if(result){
			if(result.id!==that.data.productData.sku_id){  //��Ϊ��ǰsku
				window.location.href="/goods/"+result.id;
			}else{
				that.changeBuyStatus(true);
				that.setAttribute(skuArr);
			}
		}else{
			that.changeBuyStatus(false,"�����ڴ�");
			that.setAttribute(skuArr);
		}
	}

	//�ӱ�
	var dom_service=$id("service_con");
	$bindEvent(dom_service,function(e){
		var e=e || window.event,
			target=e.target || e.srcElement,
			elem=target,
			doc=this,
			tag,
			tagName="action_tag",
			css=that.data.attrSelected;

		while(elem!==doc && elem){
			tag=elem.getAttribute(tagName);
			if(tag){
				break;
			}else{
				elem=elem.parentNode;
			}
		}

		if(tag){
			elem=$(elem);
			if(elem.hasClass(css)){
				elem.removeClass(css);
			}else{
				elem.addClass(css);
			}
		}
	});

	//��һ��	
	$bindEvent([that.dom.btn_buy,that.dom.btn_buy2],function(e){
		var product=that.data.productData;

		if(this.getAttribute("no_goods")==="1" ||  !product.is_sale){  //�Ѿ��¼ܻ򲻴��ڴ���Ʒ
			$preventDefault(e);
			return;
		}
		if(product.stock>0){  //����
			buy(this);
		}else{
			$arrivalNotice(product.sku_id);   //����֪ͨ
		}
		$preventDefault(e);

	},"click");

	function buy(elem){
		var btn=this;

		if($(btn).hasClass(that.data.disbuy)){
			$preventDefault(e);
			return;
		}

		//����
		var num=parseInt(that.dom.quanlityNum.innerHTML) || 1;
		if(num>that.data.max_buy_num){
			num=max_buy_num;
			that.dom.quanlityNum.innerHTML=num;
		}else{
			if(num<1){
				num=1;
				that.dom.quanlityNum.innerHTML=num;
			}
		}

		//����
		var productData=that.data.productData;
		var goods={
			sku_id : productData.sku_id,
			number : num
		};

		var service=[];
		$(dom_service).find("[action_tag=spx],[action_tag=ycb]").each(function(){
			if($(this).hasClass(that.data.attrSelected)){
				service.push(this.getAttribute("action_data"));
			}
		});
		if(service.length>0){
			goods.service_skuid=service.join(",");
		}

		//����
		var request = $Request.create({
			url : "http://www.iuni.com/api/order/direct_purchase",
			target : "self",
			type : 'iframe'
		});

		request.setParam(goods);


		//�Ƿ��½
		var isLogin = iuni.common.header.userInfo.get().isLogin;

		var _top = top;


		if(isLogin){

			request.start();

		}else{

			$iuni_Login_layer.show({succ:function(){
				request.start();
				return false;	//��ֹĬ����ת
			}});

		}

	}

};

iuni.goods.direct_purchase.changeBuyStatus=function(status,hint){
	var that=this,
		dom=that.dom;
	var dom_service=$("#service_con");

	//��ȡѡ�е�������
	var attrsArr=that.dom.attrsArr,
		attrName=[],selected=that.data.attrSelected;

	for(var i=0,len=attrsArr.length,attrs;i<len;i++){
		attrs=attrsArr[i];
		if($(attrs).hasClass(selected)){
			attrName.push(attrs.title || "");
		}
	}

	var product=that.data.productData;
	//  dom.chooseResult.innerHTML="IUNI  "+attrName.join("  ");

	var dis="acc_buyBtn  acc_buyBtn_false",can="acc_buyBtn",nostock="acc_buyBtn   acc_buyBtn_oos";
	dom.btn_buy.setAttribute("no_goods",0);
	dom.btn_buy2.setAttribute("data-show",0);

	if(status){

		/* if(product.is_promote){
		 dom.goodsPrice.innerHTML="&yen;"+product.promote_price;
		 }else{
		 dom.goodsPrice.innerHTML="&yen;"+product.goods_price;
		 }*/
		dom_service.show();

		if(product.is_sale){

			if(product.stock>0){
				dom.btn_buy.innerHTML='<span>��һ��</span>';
				dom.btn_buy.className=can;
				dom.btn_buy2.innerHTML='<span>��һ��</span>';
			}else{
				dom.btn_buy.innerHTML='<span>����֪ͨ</span>';
				dom.btn_buy.className=can;
				dom.btn_buy2.innerHTML='<span>����֪ͨ</span>';
			}
			dom.btn_buy2.setAttribute("data-show",1);

		}else{

			dom.btn_buy.innerHTML='<span>��Ʒ���¼�</span>';
			dom.btn_buy.className=dis;

		}

	}else{

		dom.btn_buy.setAttribute("no_goods",1);
		dom.goodsPrice.innerHTML="&nbsp;";
		dom.btn_buy.className=dis;
		dom.btn_buy.innerHTML='<span>'+(hint || "�����ڴ�")+'</span>';
		dom_service.hide();

	}
};
iuni.goods.direct_purchase.initImage=function(){

	function Images(params){
		this.option={
			mainImg:"",
			panel:"",
			btnPre:"",
			btnNext:"",
			col:1,
			css_item:"",
			css_pre:"",
			css_next:"",
			speed:400,
			pos:0,
			width:0
		};
		$.extend(this.option,params);

		this.init();
	}
	Images.prototype={
		init:function(){
			var that=this;

			that.initDom();
			that.initData();
			that.initStatus();
			that.bindEvent();

		},
		initDom:function(){
			this.dom=this.dom || {};

			var dom=this.dom,
				option=this.option;

			dom.mainImg=$(option.mainImg);
			dom.panel=$(option.panel);
			dom.panelParent=$(option.panel).parent();
			dom.items=dom.panel.children();
			dom.pre=$(option.btnPre);
			dom.next=$(option.btnNext);
		},
		initData:function(){
			this.data=this.data || {};

			var that=this,
				data=that.data;

			data.sum=that.dom.items.length;
			if(that.option.col<1 || isNaN(that.option.col)){
				that.option.col=1;
			}
			data.sumCol=Math.ceil(data.sum/ that.option.col);

			data.width=this.option.width || that.dom.items.eq(0).outerWidth();
		},
		initStatus:function(){
			var that=this;
			var data=that.data;
			var dom=that.dom;

			dom.panelParent.css({
				"position":"relative"
			});
			dom.panel.css({
				"width":data.sum*data.width,
				"position":"relative",
				"left":0
			});
			that.setStatus();
			that.setBtnStatus(Math.floor(that.option.pos/that.option.col));
		},
		bindEvent:function(){
			var that=this,
				dom=that.dom,
				timeout,time=200;

			dom.items.bind("mouseenter",function(){
				clearTimeout(timeout);
				var item=this;

				timeout=setTimeout(function(){

					var index=dom.items.index(item);
					if(that.option.pos!==index){
						that.option.pos=index;
						that.setStatus();
					}

				},time);
			});

			dom.pre.bind("click",function(){
				var colPos=Math.floor(that.option.pos/that.option.col);
				if(colPos<1){
					return;
				}
				colPos--;
				that.dom.panel.animate({"left":-colPos*that.data.width*that.option.col},that.option.speed);
				that.option.pos=colPos*that.option.col;
				that.setStatus();
				that.setBtnStatus(colPos);
			});

			dom.next.bind("click",function(){
				var colPos=Math.floor(that.option.pos/that.option.col);
				if(colPos>=that.data.sumCol-1){
					return;
				}
				colPos++;
				that.dom.panel.animate({"left":-colPos*that.data.width*that.option.col},that.option.speed);
				that.option.pos=colPos*that.option.col;
				that.setStatus();
				that.setBtnStatus(colPos);
			});

		},
		setStatus:function(){
			var that=this,
				dom=that.dom;

			var curdom=dom.items.eq(that.option.pos);
			dom.mainImg.attr("src",curdom.attr("data_img"));
			dom.items.removeClass(that.option.css_item);
			curdom.addClass(that.option.css_item);
		},
		setBtnStatus:function(colPos){
			var pre=this.dom.pre,
				next=this.dom.next,
				option=this.option;

			if(colPos==0){
				pre.addClass(option.css_pre);
			}else{
				pre.removeClass(option.css_pre);
			}
			if(colPos==this.data.sumCol-1){
				next.addClass(option.css_next);
			}else{
				next.removeClass(option.css_next);
			}
		}
	};

	var imgsection=new Images({
		mainImg:"#img_main",
		panel:"#img_panel",
		btnPre:"#img_pre",
		btnNext:"#img_next",
		col:3,
		css_item:"acc_page_onthis",
		css_pre:"page_action_false",
		css_next:"page_action_false",
		speed:600
	});

};
iuni.goods.direct_purchase.initReco=function(){
	var that=this;

	//��ʽ������
	function formateReco(remo){
		remo=remo || [];
		var result={};

		for(var i=0,len=remo.length,item;i<len;i++){
			item=remo[i];
			if(item && item.goods_sku){
				//ȥ����ͼƬ
				if(item.imagelist){
					if(item.imagelist.length>0 && !item.imagelist[item.imagelist.length-1]){
						item.imagelist.length=item.imagelist.length-1;
					}
					if(item.imagelist.length>0){
						result[item.goods_sku]=item.imagelist;
					}
				}
			}
		}
		return result;
	}

	var recoMap=formateReco(bu_cmsReco);
	var recoList=recoMap[that.data.productData.sku_id];

	if(!recoList){ //û������
		return;
	}

	//��Ⱦ
	function getHtml(data){
		var tpl=$getTpl("remoList"),
			tpl_reco=tpl["remoList"],
			tpl_item=tpl["remoItem"];

		var htmlArr=[];
		for(var i=0,len=data.length;i<len;i++){
			htmlArr.push($formatTpl(tpl_item,data[i]));
		}
		return tpl_reco.replace(" <%=remoList%>",htmlArr.join(''));
	}

	var dom=$id("recomList");
	dom.innerHTML=getHtml(recoList);
	dom.style.display="";

	//
	function $Slide(o){
		var othis=this,undefined;
		othis.timeout=null;
		othis.constructor._newNum=(othis.constructor._newNum || 0)+1;
		othis._selfID=othis.constructor._newNum;
		othis._selfName=".$Slide"+othis._selfID;

		if(!o){return;}
		if(o.config!=undefined){
			othis.config=$.extend({},othis.config,o.config);
		}
		if(o.oslide!=undefined){
			othis.oslide=$(o.oslide);
			othis.oPanel=othis.oslide.find(othis.config.panelSelector);
			othis.oItems=othis.oPanel.find(othis.config.itemsSelector);
			othis.oNext=othis.oslide.find(othis.config.nextSelector);
			othis.oPrev=othis.oslide.find(othis.config.prevSelector);
		}
	}
	$Slide.prototype={
		config:{pos:0,speed:400,delay:4000,auto:false,moveWay:"moveWidth",itemsSelector:"li",panelSelector:"ul",nextSelector:".ui_slide_next",prevSelector:".ui_slide_prev",nextCSSDis:"dis",prevCSSDis:"dis",itemWidth:0,itemHeight:0},
		setPos:function(){
			var othis=this;
			othis.config.pos>=othis.sum?othis.config.pos=othis.config.pos-othis.sum:othis.config.pos=othis.config.pos;
		},
		init:function(){
			var othis=this,cfg=othis.config;
			var sum=othis.oItems.length;
			othis.sum=sum;

			if(sum==0){othis.oslide.hide();return false;}
			if(sum==1){
				othis.oNext.addClass(cfg.nextCSSDis);
				othis.oPrev.addClass(cfg.prevCSSDis);
				return false;
			}

			othis.setMoveWay();

			//��ť
			othis.oNext.click(function(e){
				var oself=$(this);
				e.preventDefault();
				if(cfg.pos>=sum-1){
					return;
				}
				cfg.pos++;
				othis.move();
			});
			othis.oPrev.click(function(e){
				var oself=$(this);
				e.preventDefault();
				if(cfg.pos==0){
					return;
				}
				cfg.pos--;
				othis.move();
			});

		},
		move:function(){
			this.movefunc();
		},
		setMoveWay:function(){
			var othis=this,cfg=othis.config;
			othis.oInitMoveWay[cfg.moveWay](othis);
			othis.movefunc=othis.oMoveWays[cfg.moveWay];
		},
		setStatus:function(){
			var othis=this,cfg=othis.config;

			if(cfg.pos==0){
				othis.oPrev.addClass(cfg.prevCSSDis);
			}else{
				othis.oPrev.removeClass(cfg.prevCSSDis);
			}

			if(cfg.pos>=othis.sum-1){
				othis.oNext.addClass(cfg.nextCSSDis);
			}else{
				othis.oNext.removeClass(cfg.nextCSSDis);
			}

		},
		oInitMoveWay:{

			// moveHeight �ƶ��߶�
			moveWidth:function(e){
				var othis=e,cfg=othis.config;
				othis.itemValue=othis.config.itemWidth || othis.oItems.eq(0).outerWidth(true);
				othis.oPanel.css({"width":othis.itemValue*othis.sum});
				othis.setPos();
				othis.oPanel.css({"left":0});
				othis.setStatus();
			}

		},
		oMoveWays:{

			// moveHeight �ƶ��߶�
			moveWidth:function(){
				var othis=this,cfg=othis.config;
				othis.oPanel.stop(false,true);
				othis.setPos();
				othis.oPanel.animate({"left":-cfg.pos*othis.itemValue},cfg.speed);
				othis.setStatus();
			}
		}
	};
	$Slide.prototype.constructor=$Slide;

	//����
	var slide_recom=new  $Slide({oslide:"#recomList",config:{nextSelector:"#remo_next",prevSelector:"#remo_pre"}});
	slide_recom.init();

};
iuni.goods.direct_purchase.initTab=function(){
	var tab_con=$id("accessories_main"),
		tab_options=$attr("action_tag","option",tab_con),
		tab_items=$attr("action_tag","item",tab_con);
	var btn_buy2=iuni.goods.direct_purchase.dom.btn_buy2;

	var cur="accessories_mainNavLi_onthis";

	$bindEvent(tab_options,function(e){
		if(this.className==cur){
			return;
		}

		var options=$(tab_options),
			items=$(tab_items);
		var index=options.index(this);
		options.removeClass(cur);
		this.className=cur;
		items.hide();
		items.eq(index).show();
		navFloat();

	},"click");

	//tab����
	function navFloat(){
		var winj=$(window),srch=winj.scrollTop();
		var buy2_show=btn_buy2.getAttribute("data-show")==="1"?true:false;
		btn_buy2.style.display="none";

		if(srch<fixH){
			floatFix.css({"position":"relative",top:0,"width":"auto"});
		}else{
			if($isBrowser("ie6")){
				floatFix.css({"position":"absolute",top:srch,"width":"100%"});
			}else{
				floatFix.css({"position":"fixed",top:0,"width":"100%"});
			}
			if(buy2_show){
				btn_buy2.style.display="";
			}
		}
	}
	var floatCon=$("#accessories_floatCon"),
		floatFix=$("#accessories_float"),
		fixH=floatFix.offset().top;

	$(window).bind("scroll resize",navFloat);
	navFloat();

};

iuni.goods.direct_purchase.init();