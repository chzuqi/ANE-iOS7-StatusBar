﻿package cc.czq.anes{	import flash.events.EventDispatcher;	import flash.external.ExtensionContext;
		/**	 * 修改iOS7的状态栏样式 	 * @author czq	 * 	 */		public class iOSStatusBarStyle extends EventDispatcher	{		private static var _extContext:ExtensionContext;				private static var EXTENSION_ID:String = 'cc.czq.anes.iosstatusbar';		public function iOSStatusBarStyle()		{					}				private static var _instance:iOSStatusBarStyle;				private static function getInstance():iOSStatusBarStyle		{			if (!_instance)			{				_instance = new iOSStatusBarStyle();				_extContext=ExtensionContext.createExtensionContext(EXTENSION_ID, null);			}			return _instance;		}				/**		 * 设置为白字 		 * 		 */						public static function setStyleLightContent():void		{			getInstance();			if (_extContext){				_extContext.call("setStyleLightContent");			}		}		/**		 * 设置为黑字 		 * 		 */						public static function setStyleDefault():void		{			getInstance();			if (_extContext){				_extContext.call("setStyleDefault");			}		}						/**		 * 隐藏状态栏 		 * 		 */				public static function setHiddenOn():void		{			getInstance();			if (_extContext){				_extContext.call("setHiddenOn");			}		}				/**		 * 显示状态栏 		 * 		 */				public static function setHiddenOff():void		{			getInstance();			if (_extContext){				_extContext.call("setHiddenOff");			}		}			}}