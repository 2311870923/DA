/******************************
 app��ʼ������

 2013-12-10 11:00:36 svenzeng ����
 *******************************/
$namespace("iuni.app");



/******************************
 ��ȫ�ֲ�������
 *******************************/

/******************************
 ����ʼ������
 *******************************/



iuni.app.getSingle = function ( fn ) {
	var ret;
	return function () {
		return ret || ( ret = fn.apply(this, arguments) );
	};
};



iuni.app.dispatch = function( data ){

	var sso = data.sso || [];

	$.each( sso, function( i, n ){
		var img = new Image();
		img.src = n;
	});

};

/******************************
 ����������¼
 *******************************/


iuni.app.bind_login_href = function( parent ){

	// var a = parent.find( 'a[href="'+ location.href +'"]' );

	// if ( a.length === 0 ){
	// 	a = parent.find( 'a[href="http://www.iuni.com/index.shtml"]' )
	// }

	// a.css( 'color', '#019c74' );


	var needLogin = parent.find( '[data-needLogin="true"]' );

	$.each( needLogin, function( i, n ){

		var $n = $( n );
		var href = $n.attr( 'href' );

		name = href.split( '/' ).pop().split( '.' )[0],

			$n.attr( 'data-name', name ).attr( 'href', 'javascript:void 0' ).off().on( 'click', function(){

				var isLogin;

				try{
					isLogin = iuni.common.header.userInfo.get().isLogin;
				}catch(e){
					isLogin = false;
				}

				if ( !isLogin ){
					return $iuni_Login_layer.show( href );
				}

				location.href = href;
				return false;

			});

	});

};




iuni.app.init = function(){

	/*����*/
	document.domain = 'iuni.com';

	/*����ajax���صĴ��󴥷�����*/
	$Request.setErrorFilter( function( data, url ){

		if ( data.code === 0 || data.returnCode === 0 ){
			return true;
		}

		if ( ( data.returnCode === -1 || data.code === 6000 ) && url.indexOf( '/getinfo' ) < 0 ){
			//ʧȥ��½̬�����������error�ص��� ���Զ�������½��
			return true;
		}

		return false;

	});


	/*���õȴ����·��͵�cgi�Ĵ�������*/

	$Request.setReStartFilter( function( data, url ){
		if ( ( data.returnCode === -1 || data.code === 6000 ) && url.indexOf( '/getinfo' ) < 0 ){
			//$iuni_Login_layer.show( top.location.href );
			location.href = 'http://passport.iuni.com/login.shtml?reurl=' + encodeURIComponent( top.location.href );
			return true;
		}

		return false;

	});



	/*����ajax��·��*/

	$Request.setUrlRoot( 'http://passport.iuni.com' );


	/*��ajax�������token*/

	var token = $getToken();
	var prototype = $Request.getPrototype();

	prototype.start = $before( prototype.start, function(){
		this.param = this.param || {};
		this.param.tk = token;
		this.url = $addToken( this.url );
	});


	var userlogged = (function(){

		var img = new Image;

		return function(){
			img.src = 'http://www.iuni.com/api/cart/userlogged';
		}

	})();


	$Event.listen( 'login_succ', userlogged );

};



$Event.listen( 'requestDone', function( request ){
	var nowDate = +new Date();
	var url = encodeURIComponent( request.url );
	var time = nowDate - request.startTime;
	var img = new Image;
	img.src = 'http://rd.iuni.com/ws/page?type=cgi&state=succ&url='+ url +'&time=' + time;
});


$Event.listen( 'requestTimeout', function( request ){
	var nowDate = +new Date();
	var url = encodeURIComponent( request.url );
	var time = nowDate - request.startTime;
	var img = new Image;
	img.src = 'http://rd.iuni.com/ws/page?type=cgi&state=fail&url='+ url +'&time=' + time;
});


/******************************
 ������ʵ����
 *******************************/

iuni.app.init();