/*! Select2 4.0.0-rc.2 | https://github.com/select2/select2/blob/master/LICENSE.md */

(function(){if(jQuery&&jQuery.fn&&jQuery.fn.select2&&jQuery.fn.select2.amd)var e=jQuery.fn.select2.amd;return e.define("select2/i18n/ru",[],function(){function e(e,t,n,r){return e%10<5&&e%10>0&&e%100<5||e%100>20?e%10>1?n:t:r}return{inputTooLong:function(t){var n=t.input.length-t.maximum,r=",   "+n+" ";return r+=e(n,"","a",""),r+=" ",r},inputTooShort:function(t){var n=t.minimum-t.input.length,r=",     "+n+" ";return r+=e(n,"","a",""),r},loadingMore:function(){return" "},maximumSelected:function(t){var n="     "+t.maximum+" ";return n+=e(t.maximum,"","a",""),n},noResults:function(){return"  "},searching:function(){return""}}}),{define:e.define,require:e.require}})();