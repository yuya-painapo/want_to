// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require d3.v3
//= require chart
//= require turbolinks
//= require jquery.turbolinks
//= require introjs
//= require_tree .

(function($) {
    $.extend({
        getParameter: function getParameter() {
            /// <summary>
            /// Get Url Parameter
            /// </summery>
            var arg = new Object;
            var pair = location.search.substring(1).split('&');
            for(i = 0; pair[i]; i++) {
                var kv = pair[i].split('=');
                arg[kv[0]] = kv[1];
            }
            return arg;
        }
    });
})(jQuery);
