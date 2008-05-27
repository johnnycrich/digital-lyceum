package comps.timestepper
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextLineMetrics;
	import flash.ui.Keyboard;
	
	import mx.controls.Button;
	import mx.controls.TextInput;
	import mx.controls.listClasses.BaseListData;
	import mx.controls.listClasses.IDropInListItemRenderer;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.core.FlexVersion;
	import mx.core.IDataRenderer;
	import mx.core.IIMESupport;
	import mx.core.UIComponent;
	import mx.core.UITextField;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.managers.IFocusManager;
	import mx.managers.IFocusManagerComponent;
	import mx.styles.StyleProxy;
    
    use namespace mx_internal;
    /*EVENTS */
    [Event(name="change", type="ro.badu.events.HMNSEvent")]
    [Event(name="dataChange", type="mx.events.FlexEvent")]
    /*PADDING STYLES*/
    [Style(name="paddingLeft", type="Number", format="Length", inherit="no")]
    [Style(name="paddingRight", type="Number", format="Length", inherit="no")]
    /*LEADING STYLES*/
    [Style(name="leading", type="Number", format="Length", inherit="yes")]
    /*TEXT STYLES*/
    [Style(name="color", type="uint", format="Color", inherit="yes")]
    [Style(name="disabledColor", type="uint", format="Color", inherit="yes")]
    [Style(name="fontAntiAliasType", type="String", enumeration="normal,advanced", inherit="yes")]
    [Style(name="fontFamily", type="String", inherit="yes")]
    [Style(name="fontGridFitType", type="String", enumeration="none,pixel,subpixel", inherit="yes")]
    [Style(name="fontSharpness", type="Number", inherit="yes")]
    [Style(name="fontSize", type="Number", format="Length", inherit="yes")]
    [Style(name="fontStyle", type="String", enumeration="normal,italic", inherit="yes")]
    [Style(name="fontThickness", type="Number", inherit="yes")]
    [Style(name="fontWeight", type="String", enumeration="normal,bold", inherit="yes")]
    [Style(name="kerning", type="Boolean", inherit="yes")]
    [Style(name="letterSpacing", type="Number", inherit="yes")]
    [Style(name="textAlign", type="String", enumeration="left,center,right", inherit="yes")]
    [Style(name="textDecoration", type="String", enumeration="none,underline", inherit="yes")]
    [Style(name="textIndent", type="Number", format="Length", inherit="yes")]
    /*FOCUS STYLES*/
    [Style(name="focusAlpha", type="Number", inherit="no")]
    [Style(name="focusRoundedCorners", type="String", inherit="no")]
    /*BORDER STYLES*/
    [Style(name="backgroundAlpha", type="Number", inherit="no")]
    [Style(name="backgroundColor", type="uint", format="Color", inherit="no")]
    [Style(name="backgroundDisabledColor", type="uint", format="Color", inherit="yes")]
    [Style(name="backgroundImage", type="Object", format="File", inherit="no")]
    [Style(name="backgroundSize", type="String", inherit="no")]
    [Style(name="borderColor", type="uint", format="Color", inherit="no")]
    [Style(name="borderSides", type="String", inherit="no")]
    [Style(name="borderSkin", type="Class", inherit="no")]
    [Style(name="borderStyle", type="String", enumeration="inset,outset,solid,none", inherit="no")]
    [Style(name="borderThickness", type="Number", format="Length", inherit="no")]
    [Style(name="cornerRadius", type="Number", format="Length", inherit="no")]
    [Style(name="dropShadowEnabled", type="Boolean", inherit="no")]
    [Style(name="dropShadowColor", type="uint", format="Color", inherit="yes")]
    [Style(name="shadowDirection", type="String", enumeration="left,center,right", inherit="no")]
    [Style(name="shadowDistance", type="Number", format="Length", inherit="no")]
    /*SKINNING*/
    [Style(name="highlightAlphas", type="Array", arrayType="Number", inherit="no")]
    
    [Style(name="upArrowSkin", type="Class", inherit="no", states="up, over, down, disabled")]
    [Style(name="upArrowDisabledSkin", type="Class", inherit="no")]
    [Style(name="upArrowDownSkin", type="Class", inherit="no")]
    [Style(name="upArrowOverSkin", type="Class", inherit="no")]
    [Style(name="upArrowUpSkin", type="Class", inherit="no")]
    
    [Style(name="downArrowSkin", type="Class", inherit="no", states="up, over, down, disabled")]
    [Style(name="downArrowDisabledSkin", type="Class", inherit="no")]    
    [Style(name="downArrowDownSkin", type="Class", inherit="no")]
    [Style(name="downArrowOverSkin", type="Class", inherit="no")]
    [Style(name="downArrowUpSkin", type="Class", inherit="no")]
    
    [DefaultBindingProperty(source="value", destination="value")]
    [DefaultTriggerEvent("change")]

	public class Timestepper extends UIComponent implements IDataRenderer, IDropInListItemRenderer, IFocusManagerComponent, IIMESupport, IListItemRenderer
	{
        
        mx_internal var hourInputField:TextInput;
        mx_internal var nextHourButton:Button;
        mx_internal var prevHourButton:Button;
        mx_internal var nextMinuteButton:Button;
        mx_internal var prevMinuteButton:Button;
        
        /* setter-getter-ul lui maxChars lipseste: textInputul nu poate avea mai mult de 5 caractere (inclusiv ':')*/
        private var _maxChars:int = 5;
        /*setter getter lipsa: nu e necesar*/
        private var _maximum:Number = 24.00;
        /*setter getter lipsa: nu e necesar*/      
        private var _minimum:Number = 0.00;
        /*lipsesc si nextValue - previousValue - nu sunt necesare*/
        
        private var _nextHourFlag:Boolean = false;
        private var _prevHourFlag:Boolean = false;
        private var _nextMinuteFlag:Boolean = false;
        private var _prevMinuteFlag:Boolean = false;
       
        private var _hour:int = 0;
        private var _minute:int = 0;
        
        private var valueSet:Boolean;
        private var _tabIndex:int = -1;
        
        public function Timestepper(){
            super();
            tabChildren = true;
        }        
        /*
            
         */
        override protected function createChildren():void {
            super.createChildren();
            
            if (!hourInputField){
                hourInputField = new TextInput();                
                hourInputField.styleName = new StyleProxy(this, inputFieldStyleFilters);
                hourInputField.focusEnabled = false;            
                hourInputField.restrict = "0-9:";// restrict to numbers 
                hourInputField.maxChars = _maxChars;
                hourInputField.text = String(_value);
                hourInputField.parentDrawsFocus = false; //this is causing some errors if set to true
                hourInputField.imeMode = _imeMode;
                hourInputField.addEventListener(FocusEvent.FOCUS_IN, inputField_focusInHandler);
                hourInputField.addEventListener(FocusEvent.FOCUS_OUT, inputField_focusOutHandler);
                hourInputField.addEventListener(KeyboardEvent.KEY_DOWN, inputField_keyDownHandler);
                hourInputField.addEventListener(Event.CHANGE, inputField_changeHandler);
                addChild(hourInputField);
            }
            
            if (!nextHourButton) {       
                nextHourButton = new Button();
                nextHourButton.styleName = new StyleProxy(this, downArrowStyleFilters);
                nextHourButton.upSkinName = "downArrowUpSkin";
                nextHourButton.overSkinName = "downArrowOverSkin";
                nextHourButton.downSkinName = "downArrowDownSkin";
                nextHourButton.disabledSkinName = "downArrowDisabledSkin";
                nextHourButton.skinName = "downArrowSkin";
                nextHourButton.upIconName = "";
                nextHourButton.overIconName = "";
                nextHourButton.downIconName = "";
                nextHourButton.disabledIconName = "";
    
                nextHourButton.focusEnabled = false;
                nextHourButton.autoRepeat = true;
                nextHourButton.rotation = 180;
                nextHourButton.addEventListener(MouseEvent.CLICK, buttonClickHandler);
                nextHourButton.addEventListener(FlexEvent.BUTTON_DOWN, buttonDownHandler);
    
                addChild(nextHourButton);
            }
    
            if (!prevHourButton){
                prevHourButton = new Button();
                prevHourButton.styleName = new StyleProxy(this, upArrowStyleFilters);
                prevHourButton.upSkinName = "upArrowUpSkin";
                prevHourButton.overSkinName = "upArrowOverSkin";
                prevHourButton.downSkinName = "upArrowDownSkin";
                prevHourButton.disabledSkinName = "upArrowDisabledSkin";
                prevHourButton.skinName = "upArrowSkin";
                prevHourButton.upIconName = "";
                prevHourButton.overIconName = "";
                prevHourButton.downIconName = "";
                prevHourButton.disabledIconName = "";
    
                prevHourButton.focusEnabled = false;
                prevHourButton.autoRepeat = true;
                prevHourButton.rotation = 180;
                prevHourButton.addEventListener(MouseEvent.CLICK, buttonClickHandler);
                prevHourButton.addEventListener(FlexEvent.BUTTON_DOWN, buttonDownHandler);
    
                addChild(prevHourButton);
            }
                
                if (!nextMinuteButton){       
                nextMinuteButton = new Button();
                nextMinuteButton.styleName = new StyleProxy(this, upArrowStyleFilters);
                nextMinuteButton.upSkinName = "upArrowUpSkin";
                nextMinuteButton.overSkinName = "upArrowOverSkin";
                nextMinuteButton.downSkinName = "upArrowDownSkin";
                nextMinuteButton.disabledSkinName = "upArrowDisabledSkin";
                nextMinuteButton.skinName = "upArrowSkin";
                nextMinuteButton.upIconName = "";
                nextMinuteButton.overIconName = "";
                nextMinuteButton.downIconName = "";
                nextMinuteButton.disabledIconName = "";
    
                nextMinuteButton.focusEnabled = false;
                nextMinuteButton.autoRepeat = true;
    
                nextMinuteButton.addEventListener(MouseEvent.CLICK, buttonClickHandler);
                nextMinuteButton.addEventListener(FlexEvent.BUTTON_DOWN, buttonDownHandler);
    
                addChild(nextMinuteButton);
            }
    
            if (!prevMinuteButton) {
                prevMinuteButton = new Button();
                prevMinuteButton.styleName = new StyleProxy(this, downArrowStyleFilters);
                prevMinuteButton.upSkinName = "downArrowUpSkin";
                prevMinuteButton.overSkinName = "downArrowOverSkin";
                prevMinuteButton.downSkinName = "downArrowDownSkin";
                prevMinuteButton.disabledSkinName = "downArrowDisabledSkin";
                prevMinuteButton.skinName = "downArrowSkin";
                prevMinuteButton.upIconName = "";
                prevMinuteButton.overIconName = "";
                prevMinuteButton.downIconName = "";
                prevMinuteButton.disabledIconName = "";
    
                prevMinuteButton.focusEnabled = false;
                prevMinuteButton.autoRepeat = true;
    
                prevMinuteButton.addEventListener(MouseEvent.CLICK, buttonClickHandler);
                prevMinuteButton.addEventListener(FlexEvent.BUTTON_DOWN, buttonDownHandler);
    
                addChild(prevMinuteButton);
            }                        
        }    

        override public function get baselinePosition():Number {
            if (FlexVersion.compatibilityVersion < FlexVersion.VERSION_3_0) return hourInputField ? hourInputField.baselinePosition : NaN;
            if (!validateBaselinePosition()) return NaN;
            return hourInputField.y + hourInputField.baselinePosition;
        }
        
        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            var w:Number = nextHourButton.getExplicitOrMeasuredWidth();
            var h:Number = Math.round(unscaledHeight / 2);
            var h2:Number = unscaledHeight - h;
            
            nextMinuteButton.x = unscaledWidth-w;
            nextMinuteButton.y = 0;
            nextMinuteButton.setActualSize(w, h2);
            
            prevMinuteButton.x = unscaledWidth-w;
            prevMinuteButton.y = unscaledHeight-h;
            prevMinuteButton.setActualSize(w, h);
            
            prevHourButton.x = w;
            prevHourButton.y = unscaledHeight ;
            prevHourButton.setActualSize(w, h2);
            
            nextHourButton.x = w;
            nextHourButton.y = unscaledHeight - h;
            nextHourButton.setActualSize(w, h);
            
            hourInputField.x = w;
            hourInputField.y = 0;
            hourInputField.setActualSize(unscaledWidth - w*2, unscaledHeight);            
                        
        }
        
        override protected function commitProperties():void {
            super.commitProperties();        
            if (valueChanged) {                
                valueChanged = false;
                setValue(isNaN(proposedValue) ? 0 : proposedValue, false);
            }
            if (enabledChanged) {
                enabledChanged = false;
                prevHourButton.enabled = enabled;
                nextHourButton.enabled = enabled;
                hourInputField.enabled = enabled;
                prevMinuteButton.enabled = enabled;
                nextMinuteButton.enabled = enabled;
            }
        }
        
        override protected function measure():void{
            super.measure();
            var lineMetrics:TextLineMetrics = measureText(_maximum.toString());
            var textHeight:Number = hourInputField.getExplicitOrMeasuredHeight();
            var buttonHeight:Number = prevMinuteButton.getExplicitOrMeasuredHeight() + nextMinuteButton.getExplicitOrMeasuredHeight();
            var h:Number = Math.max(textHeight, buttonHeight);
            h = Math.max(DEFAULT_MEASURED_MIN_HEIGHT, h);
            var textWidth:Number = lineMetrics.width + UITextField.TEXT_WIDTH_PADDING;
            var buttonWidth:Number = Math.max(prevHourButton.getExplicitOrMeasuredWidth()+prevMinuteButton.getExplicitOrMeasuredWidth(),nextMinuteButton.getExplicitOrMeasuredWidth()+nextHourButton.getExplicitOrMeasuredWidth());
            var w:Number = textWidth +buttonWidth;
            w = Math.max(DEFAULT_MEASURED_MIN_WIDTH, w);
            measuredMinWidth = DEFAULT_MEASURED_MIN_WIDTH;
            measuredMinHeight = DEFAULT_MEASURED_MIN_HEIGHT;
            measuredWidth = w;
            measuredHeight = h;
        } 
        /*Focus*/
        override public function setFocus():void{
            if (stage) stage.focus = TextField(hourInputField.getTextField());
        }
    
        override protected function isOurFocus(target:DisplayObject):Boolean {
            return target == hourInputField || super.isOurFocus(target);
        }
        
        override protected function focusInHandler(event:FocusEvent):void{
            super.focusInHandler(event);
            var fm:IFocusManager = focusManager;
            if (fm) fm.defaultButtonEnabled = false;
        }
            
        override protected function focusOutHandler(event:FocusEvent):void {
            var fm:IFocusManager = focusManager;
            if (fm) fm.defaultButtonEnabled = true;
            super.focusOutHandler(event);
            takeValueFromTextField(event);
        }
        /*clickHandler*/
        private function buttonDownHandler(event:FlexEvent):void {
            buttonPress(Button(event.currentTarget), event);
        }

        private function buttonClickHandler(event:MouseEvent):void {
            hourInputField.setFocus();
            hourInputField.getTextField().setSelection(0, 0);            
        }

        private function inputField_focusInHandler(event:FocusEvent):void {
            focusInHandler(event);
            dispatchEvent(new FocusEvent(event.type, false, false, event.relatedObject, event.shiftKey, event.keyCode));
        }
        private function inputField_focusOutHandler(event:FocusEvent):void {
            focusOutHandler(event);
            dispatchEvent(new FocusEvent(event.type, false, false, event.relatedObject, event.shiftKey,event.keyCode));
        }        
    
        private function inputField_changeHandler(event:Event):void {
            event.stopImmediatePropagation();
            var inputValue:Number = Number(hourInputField.text);
            if ((inputValue != value && (Math.abs(inputValue - value) >= 0.000001 || isNaN(inputValue))) || hourInputField.text == ""){
                _value = checkValidValue(inputValue);
                }
        }   
        
       private function checkValidValue(value:Number):Number{             
             if (isNaN(value)) return this.value;         
            var fromBtns:Boolean = false;
             var s:Number = 0;
            //tratament butoane
            if (_nextHourFlag){
                fromBtns = true;
                if (_hour!=23){
                    _hour++;
                }else{
                    _hour=0;
                }
                _nextHourFlag = false;
            }    
            if (_prevHourFlag){
                fromBtns = true;
                if (_hour!=0){
                    _hour--;
                }else{
                    _hour=23;
                }
                _prevHourFlag = false;
            }
            if (_nextMinuteFlag){
                fromBtns = true;
                if (_minute!=59){
                    _minute++;
                }else{
                    _minute=0;
                    if (_hour!=23){
                        _hour++;
                    }else{
                        _hour = 0;
                    }
                }
                _nextMinuteFlag = false;
            }        
            if (_prevMinuteFlag){
                fromBtns = true;
                if (_minute!=0){
                    _minute--;
                }else{
                    _minute = 59;
                    if (_hour!=0){
                        _hour--;
                    }else{
                        _hour = 23;
                    }
                }
                _prevMinuteFlag = false;
            }
            //setam valoarea prin analiza (nu e venita prin buton)
            if (!fromBtns){                        
                var parts:Array = value.toFixed(2).split(".");
                var _newHour:Number = Number(parts[0]);
                var _newMinute:Number = Number(parts[1]);
                if (_hour == _newHour && _minute == _newMinute) return value;
                else{
                    _hour =  _newHour;
                    _minute = _newMinute;
                    if (_hour<0 || _hour>23) _hour = 0;
                    if (_minute<0 || _minute>59) _minute = 0;
                }                
            }
            hourInputField.text = (_hour>9 ? _hour.toString() :'0'+_hour.toString()) +':'+(_minute>9 ? _minute.toString() : '0'+_minute.toString());            
            s = _hour + Number((_minute/100).toFixed(2));            
            return s;
        }
        //===========================================================================================================
        // GETTERS - SETTERS
        //===========================================================================================================
        /*enabled*/
        private var enabledChanged:Boolean = false;    
        [Inspectable(category="General", enumeration="true,false", defaultValue="true")]
    
        override public function set enabled(value:Boolean):void{
            super.enabled = value;
            enabledChanged = true;
            invalidateProperties();
        }
        override public function get enabled():Boolean {
            return super.enabled;
        }
        //===========================================================================================================
        /*tabIndex prin interfata IFocusManagerComponent*/
        override public function get tabIndex():int {
            return hourInputField ? hourInputField.tabIndex : -1;
        }
    
        override public function set tabIndex(value:int):void {
            if (hourInputField) hourInputField.tabIndex = value;
        }
        //===========================================================================================================
        /*data pentru interfata IDataRenderer*/
        private var _data:Object;
        [Bindable("dataChange")] [Inspectable(environment="none")]

        public function get data():Object {
            if (!_listData) data = this.value;
            return _data;
        }
        
        public function set data(value:Object):void {            
            _data = value;
            if (!valueSet){
                this.value = _listData ? parseFloat(_listData.label) : Number(_data);
                valueSet = false;
            }
            dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
        }
        //===========================================================================================================
        /*PRIVATE imeMode pentru interfata IIMESupport*/
        private var _imeMode:String = null; [Inspectable(defaultValue="")]    
        public function get imeMode():String {
            return _imeMode;
        }
    
        public function set imeMode(value:String):void {
            _imeMode = value;
            if (hourInputField) hourInputField.imeMode = _imeMode;
        }
        //===========================================================================================================
        /*PRIVATE listData pentru interfata IDropInListItemRenderer*/
        private var _listData:BaseListData;
        [Bindable("dataChange")] [Inspectable(environment="none")]

        public function get listData():BaseListData {
            return _listData;
        }
        
        public function set listData(value:BaseListData):void {
            _listData = value;
        }       
        //===========================================================================================================
        /*stepSize & hourStepSize*/      
        private var _minuteStepSize:Number = 0.01;
        [Bindable("stepSizeChanged")]
        [Inspectable(category="General", defaultValue="0.01")]

        public function get stepSize():Number {
            return _minuteStepSize;
        }
    
        public function set stepSize(value:Number):void{
            _minuteStepSize = value;            
            if (!valueChanged){
                this.value = this.value;
                valueSet = false;
            }
            dispatchEvent(new Event("stepSizeChanged"));
        }
        //===========================================================================================================
        /*value*/
        private var _value:Number = 0;
        private var proposedValue:Number = 0;            
        private var valueChanged:Boolean = false;

        [Bindable("change")]
        [Bindable("valueCommit")]
        [Inspectable(category="General", defaultValue="0")]    

        public function get value():Number{
            return valueChanged ? proposedValue : _value;
        }

        public function set value(value:Number):void{            
            valueSet = true;
            proposedValue = value;
            valueChanged = true;
            invalidateProperties();
            invalidateSize();
        }
         //===========================================================================================================        
        private function setValue(value:Number, sendEvent:Boolean = true, trigger:Event = null):void {                        
            var v:Number = checkValidValue(value);
            if (v == _value) return;
            _value = v;
            if (sendEvent) {
                var event:TimestepperEvent = new TimestepperEvent(TimestepperEvent.CHANGE);
                event.value = _value;
                event.triggerEvent = trigger;
                dispatchEvent(event);
            }
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
        }
        //===========================================================================================================
        private function takeValueFromTextField(trigger:Event = null):Number {            
            var a:Array = hourInputField.text.split(':');
            if (a.length != 2){ inputValue = 0; hourInputField.text='00:00'; return 0;}
            var inputValue:Number = Number(a[0]) + Number((Number(a[1])/100).toFixed(2));
            var newValue:Number = checkValidValue(inputValue);            
            setValue(newValue, trigger != null, trigger);
            return newValue;            
        }    
        //===========================================================================================================
        private function buttonPress(button:Button, trigger:Event = null):void {
            if (enabled) {                                        
                    switch (button){
                        case nextHourButton:
                            _nextHourFlag = true;
                            setValue(_value, true, trigger);
                        break;
                        case prevHourButton:                        
                            _prevHourFlag = true;
                            setValue(_value, true, trigger);
                        break;
                        case nextMinuteButton:
                            _nextMinuteFlag = true;
                            setValue(_value, true, trigger);
                        break;
                        case prevMinuteButton:
                            _prevMinuteFlag = true;                        
                            setValue(_value, true, trigger);
                        break;
                    }                    
            }
        }    
        //===========================================================================================================
        private function inputField_keyDownHandler(event:KeyboardEvent):void {
            var oldValue:Number = value;
            var tmpV:Number;
            switch (event.keyCode){
                case Keyboard.DOWN: {
                    tmpV = value - stepSize;
                    setValue(tmpV, true);
                break;}
    
                case Keyboard.UP: {
                    tmpV = stepSize + value;
                    setValue(tmpV, true);
                break; }
    
                case Keyboard.HOME: {
                    hourInputField.text = _minimum.toString();
                    setValue(_minimum, true);
                break; }
    
                case Keyboard.END: {
                    hourInputField.text = _maximum.toString();
                    setValue(_maximum, true);
                break; }
    
                case Keyboard.ENTER: case Keyboard.TAB: {                    
                    var n : Number = takeValueFromTextField();
                    setValue ( n, true, null);    
                    event.stopImmediatePropagation();
                break; }
            }
            dispatchEvent(event);
        }
        //
        // Styles
        //
        protected function get downArrowStyleFilters():Object {
            return _downArrowStyleFilters;
        }
    
        private static var _downArrowStyleFilters:Object = {      
            "cornerRadius" : "cornerRadius",        
            "highlightAlphas" : "highlightAlphas",
            "downArrowUpSkin" : "downArrowUpSkin",
            "downArrowOverSkin" : "downArrowOverSkin",
            "downArrowDownSkin" : "downArrowDownSkin",
            "downArrowDisabledSkin" : "downArrowDisabledSkin",
            "downArrowSkin" : "downArrowSkin",
            "repeatDelay" : "repeatDelay",
            "repeatInterval" : "repeatInterval"
        }

        protected function get inputFieldStyleFilters():Object {
            return _inputFieldStyleFilters;
        }
    
        private static var _inputFieldStyleFilters:Object = {
            "backgroundAlpha" : "backgroundAlpha",
            "backgroundColor" : "backgroundColor",
            "backgroundImage" : "backgroundImage",
            "backgroundDisabledColor" : "backgroundDisabledColor",
            "backgroundSize" : "backgroundSize",
            "borderAlpha" : "borderAlpha", 
            "borderColor" : "borderColor",
            "borderSides" : "borderSides", 
            "borderSkin" : "borderSkin",
            "borderStyle" : "borderStyle",
            "borderThickness" : "borderThickness",
            "dropShadowColor" : "dropShadowColor",
            "dropShadowEnabled" : "dropShadowEnabled",
            "embedFonts" : "embedFonts",
            "focusAlpha" : "focusAlpha",
            "focusBlendMode" : "focusBlendMode",
            "focusRoundedCorners" : "focusRoundedCorners", 
            "focusThickness" : "focusThickness",
            "paddingLeft" : "paddingLeft", 
            "paddingRight" : "paddingRight",
            "shadowDirection" : "shadowDirection",
            "shadowDistance" : "shadowDistance",
            "textDecoration" : "textDecoration"
        } 
        
        protected function get upArrowStyleFilters():Object {
            return _upArrowStyleFilters;
        }
    
        private static var _upArrowStyleFilters:Object = {
            "cornerRadius" : "cornerRadius",        
            "highlightAlphas" : "highlightAlphas",
            "upArrowUpSkin" : "upArrowUpSkin",
            "upArrowOverSkin" : "upArrowOverSkin",
            "upArrowDownSkin" : "upArrowDownSkin",
            "upArrowDisabledSkin" : "upArrowDisabledSkin",
            "upArrowSkin" : "upArrowSkin",
            "repeatDelay" : "repeatDelay",
            "repeatInterval" : "repeatInterval"
        }
	}
}