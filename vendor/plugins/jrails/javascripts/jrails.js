
﻿
(function($){$().ajaxSend(function(a,xhr,s){xhr.setRequestHeader("Accept","text/javascript, text/html, application/xml, text/xml, */*");});})(jQuery);(function($){$.extend({fieldEvent:function(el,obs){var field=el[0]||el,e='change';if(field.type=='radio'||field.type=='checkbox')e='click';else if(obs&&field.type=='text'||field.type=='textarea')e='keyup';return e;}});$.fn.extend({delayedObserver:function(delay,callback){var el=$(this);if(typeof window.delayedObserverStack=='undefined')window.delayedObserverStack=[];if(typeof window.delayedObserverCallback=='undefined'){window.delayedObserverCallback=function(stackPos){observed=window.delayedObserverStack[stackPos];if(observed.timer)clearTimeout(observed.timer);observed.timer=setTimeout(function(){observed.timer=null;observed.callback(observed.obj,observed.obj.formVal());},observed.delay*1000);observed.oldVal=observed.obj.formVal();}}
window.delayedObserverStack.push({obj:el,timer:null,delay:delay,oldVal:el.formVal(),callback:callback});var stackPos=window.delayedObserverStack.length-1;if(el[0].tagName=='FORM'){$(':input',el).each(function(){var field=$(this);field.bind($.fieldEvent(field,delay),function(){observed=window.delayedObserverStack[stackPos];if(observed.obj.formVal()==observed.obj.oldVal)return;else window.delayedObserverCallback(stackPos);});});}else{el.bind($.fieldEvent(el,delay),function(){observed=window.delayedObserverStack[stackPos];if(observed.obj.formVal()==observed.obj.oldVal)return;else window.delayedObserverCallback(stackPos);});};},formVal:function(){var el=this[0];if(el.tagName=='FORM')return this.serialize();if(el.type=='checkbox'||self.type=='radio')return this.filter('input:checked').val()||'';else return this.val();}});})(jQuery);(function($){$.fn.extend({visualEffect:function(o){return this.effect(o);},Appear:function(speed,callback){return this.fadeIn(speed,callback);},BlindDown:function(speed,callback){this.show('blind',{direction:'vertical'},speed,callback);return this;},BlindUp:function(speed,callback){this.hide('blind',{direction:'vertical'},speed,callback);return this;},BlindRight:function(speed,callback){this.show('blind',{direction:'horizontal'},speed,callback);return this;},BlindLeft:function(speed,callback){this.hide('blind',{direction:'horizontal'},speed,callback);return this;},DropOut:function(speed,callback){this.hide('drop',{direction:'down'},speed,callback);return this;},DropIn:function(speed,callback){this.show('drop',{direction:'up'},speed,callback);return this;},Fade:function(speed,callback){return this.fadeOut(speed,callback);},Fold:function(speed,callback){this.hide('fold',{},speed,callback);return this;},FoldOut:function(speed,callback){this.show('fold',{},speed,callback);return this;},Grow:function(speed,callback){this.show('scale',{},speed,callback);return this;},Highlight:function(speed,callback){this.show('highlight',{},speed,callback);return this;},Puff:function(speed,callback){this.hide('puff',{},speed,callback);return this;},Pulsate:function(speed,callback){this.show('pulsate',{},speed,callback);return this;},Shake:function(speed,callback){this.show('shake',{},speed,callback);return this;},Shrink:function(speed,callback){this.hide('scale',{},speed,callback);return this;},Squish:function(speed,callback){this.hide('scale',{origin:['top','left']},speed,callback);return this;},SlideUp:function(speed,callback){this.hide('slide',{direction:'up'},speed,callback);return this;},SlideDown:function(speed,callback){this.show('slide',{direction:'up'},speed,callback);return this;},SwitchOff:function(speed,callback){this.hide('clip',{},speed,callback);return this;},SwitchOn:function(speed,callback){this.show('clip',{},speed,callback);return this;}});})(jQuery);