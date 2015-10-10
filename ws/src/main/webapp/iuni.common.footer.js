/******************************
 �Ų��ļ�

 2013-11-28 10:06:35 wubocao ����
 *******************************/
$namespace("iuni.common.footer");
/******************************
 ��ȫ�ֲ�������
 *******************************/
iuni.common.footer.data={

};
iuni.common.footer.dom={

};
/******************************
 ����ʼ������
 *******************************/
iuni.common.footer.init=function(){

	//��¼��Դ
	this.recoOrign();

	//�����ϱ�
	this.initReport();

	//��¼������
	this.initInviteCode();
};
/******************************
 ������ʵ����
 *******************************/

/**
 * �����ϱ�
 */
iuni.common.footer.initReport = function() {

	var hn2 = location.hostname.split('.');
	hn2.reverse();
	hn2.length = 2;
	hn2.push( 'rd2' );
	hn2.reverse();
	hn2 = hn2.join('.');

	//����

	function encode(str) {
		if (str && str.replace) {
			return encodeURIComponent(str.replace(/\|/g, '_'));
		}
		return '';
	}
	//ҳ������ϱ�
	function reportLoad(pageId, referId, referer, fromId) {

		var url = encode(location.href);
		var uid = encode($getCookie('uid'));
		var sid = encode($getCookie('sid'));
		var adId = encode( $getQuery( 'adId' ) );
		var execTime;

		try{
			execTime = ( +new Date ) - pageExecStart;
		}catch(e){

		}

		$report('http://' + hn + '/dp/rptData', {
			id : pageId,
			type : 'pv',
			data : url + '|' + referId + '|' + referer + '|' + fromId,
			uid : uid,
			sid : sid
		});

		var reportObj = {
			type : 'pv',
			s1: pageId,
			s2: adId,
			s3: referer
		}

		if ( !isNaN( execTime ) ){
			reportObj.s4 = execTime;
		}

		$report( 'http://' + hn2 + '/log/report', reportObj );

	}
	//ҳ���أ�����ϱ�
	function startRtagMonitor(pageId) {
		//����ϱ�
		$bindEvent(document.body, function(e) {

			var dom = $getTarget(e), t, b = document.body;
			//���rtag���
			while (dom && dom != this && !( t = dom.getAttribute('rtag'))) {
				dom = dom.parentNode;
			}

			if (t) {
				//�ϱ�
				var uid = encode($getCookie('uid'));
				var sid = encode($getCookie('sid'));
				$report('http://' + hn + '/dp/rptData', {
					id : pageId,
					type : 'rtag',
					data : encode(t),
					uid : uid,
					sid : sid
				});

				$report('http://rd2.iuni.com/log/report', {
					type : 'click',
					s1: t,	//rtag
					s2: pageId,	//url
				});

			}
		});
		//ҳ���ʼ���ж��ϱ�
		if ( t = $getQuery('rtag')) {
			var uid = encode($getCookie('uid'));
			var sid = encode($getCookie('sid'));
			$report('http://' + hn + '/dp/rptData', {
				id : pageId,
				type : 'rtag',
				data : encode(t),
				uid : uid,
				sid : sid
			});
		}
	}
	//window������д�������ϱ�����
	var w = window, hn = location.hostname.split('.');
	hn.reverse();
	hn.length = 2;
	hn.push('rd');
	hn.reverse();
	hn = hn.join('.');
	//ҳ��ID�����ڱ�ʶҳ��
	var pageId = encode(w['__PAGEID'] || (location.protocol + '//' + location.host + location.pathname));
	//��ԴID���Զ�������
	var referId = encode(w['__REFERID'] || $getQuery('REF'));
	//referer��ǣ���ʶ��Դ
	var referer = encode(document.referrer);
	//ҳ���ǣ�fromID���ƹ���
	var fromId = encode(w['__FROMID']);
	//�����ϱ�
	reportLoad(pageId, referId, referer, fromId);
	//����ҳ���أ�����ϱ�
	startRtagMonitor(pageId);


};

/**
 *  ��¼������
 */
iuni.common.footer.initInviteCode=function(){
	var url=window.location.search;
	var invite_code=$getQuery("invite_code",url),   //�û�id
		zt_remark;    //�id

	if(invite_code){

		$setCookie("invite_code",invite_code,null,"/","iuni.com");

		zt_remark=$getQuery("zt_remark",url);
		if(zt_remark){
			$setCookie("zt_remark",zt_remark,null,"/","iuni.com");
		}

	}
};
/**
 * ��¼��Դ
 */
iuni.common.footer.recoOrign=function(){
	var url=decodeURIComponent(window.location.search).toLowerCase();
	var ad_id=$getQuery("ad_id",url);   //��Դad_id

	if(ad_id){
		var u = navigator.userAgent;
		var exp=null;
		if(u.indexOf('iPhone') > -1 || (!!/.*Android.*Mobile.*/.test(u) && (u.indexOf('FROYO')=== -1)) || (!!/'.*Touch.*Mobile.*'/.test(u)) || !!/nokia/i.test(u)){
			exp=60*24;
		}
		$setCookie("ad_id",ad_id,exp,"/","iuni.com");

	}
}

iuni.common.footer.init();