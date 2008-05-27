package comps.timestepper
{
	import flash.events.Event;
	
	public class TimestepperEvent extends Event
	{   
        public static const CHANGE:String = "change";

        public function TimestepperEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false, value:Number = NaN, triggerEvent:Event = null){
            super(type, bubbles, cancelable);
            this.value = value;
            this.triggerEvent = triggerEvent;
        }
        
        public var value:Number;    
        public var triggerEvent:Event;
            
        override public function clone():Event{
            return new TimestepperEvent(type, bubbles, cancelable, value);
        }
    }
}