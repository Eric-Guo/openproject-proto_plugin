/**
 * Global scripts that will be executed on every page load
 * We recommend to use angular pages / components instead
 */

import * as jQuery from 'jquery';

(function($) {
  $(document).ready(function() {
    // Widget box emphasized by giving it a nice red border.
    $('#proto-plugin-block').parent().addClass('proto-plugin-widget-box');
  });
})(jQuery);