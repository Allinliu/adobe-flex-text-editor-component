package com.core.popup
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import mx.collections.ArrayCollection;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import spark.components.TitleWindow;

	[Bindable]
	/**
	 *
	 * @author Ihor Khomiak
	 */
	public class PopupTitleWindow extends TitleWindow
	{
		private var _isCloseButton:Boolean;

		/**
		 *
		 * @default
		 */
		public var menuItems:ArrayCollection;

		/**
		 *
		 */
		public function PopupTitleWindow()
		{
			super();
			isCloseButton=true;
			addEventListener(CloseEvent.CLOSE, onCloseHandler);
			addEventListener(KeyboardEvent.KEY_DOWN, pressEscape_Handler);
		}


		/**
		 *
		 * @return
		 */
		public function get isCloseButton():Boolean
		{
			return _isCloseButton;
		}

		private var _closeButtonChanged:Boolean;

		override protected function commitProperties():void
		{
			super.commitProperties();
			if (_closeButtonChanged && this.closeButton)
			{
				_closeButtonChanged = false;
				this.closeButton.visible = isCloseButton;
			}
		}

		/**
		 *
		 * @param value
		 */
		public function set isCloseButton(value:Boolean):void
		{
			_isCloseButton=value;
			_closeButtonChanged=true;
			this.invalidateProperties();
		}

		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		}

		/**
		 *
		 * @param event
		 */
		protected function onHelp(event:MouseEvent):void
		{

		}

		/**
		 *
		 * @param event
		 */
		protected function onOk(event:MouseEvent):void
		{

		}

		private function onCloseHandler(event:Event):void
		{
			PopUpManager.removePopUp(this);
		}

		private function pressEscape_Handler(evt:KeyboardEvent):void
		{
			if (evt.charCode == Keyboard.ESCAPE)
				PopUpManager.removePopUp(this);
		}

		private function tabbarLabelFunction(item:Object):String
		{
			var label:String=item.hasOwnProperty('label') ? item.label : '';
			return label;
		}

	}
}
