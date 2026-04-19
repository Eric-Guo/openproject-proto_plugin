/**
 * Global scripts that will be executed on every page load
 * We recommend to use angular pages / components instead
 */

import jQuery from 'jquery';

jQuery(() => {
  // Widget box emphasized by giving it a nice red border.
  jQuery('#proto-plugin-block').parent().addClass('proto-plugin-widget-box');
});
