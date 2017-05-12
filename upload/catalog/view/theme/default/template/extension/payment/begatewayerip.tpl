<p id="instruction" class="pull-left"></p>
<div class="buttons" id="checkout-success">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_confirm; ?>" data-loading-text="<?php echo $text_loading; ?>" id="button-confirm" class="btn btn-primary" />
  </div>
</div>
<script type="text/javascript"><!--

var ajax_handler = function() {
	jQuery.ajax({
		url: 'index.php?route=extension/payment/begatewayerip/send',
		type: 'post',
    dataType: 'json',
    cache: false,
		beforeSend: function() {
			jQuery('#button-confirm').attr('disabled', true);
      jQuery('#button-confirm').button('loading');
      jQuery('#instruction').empty();
			jQuery('#instruction').before('<div class="alert alert-info" id="erip-progress"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $text_wait; ?></div>');
		},
		complete: function() {
			jQuery('#button-confirm').attr('disabled', false);
      jQuery('#button-confirm').button('reset');
			jQuery('#erip-progress').remove();
		},
		success: function(json) {
      if (json['error']) {
        jQuery('#instruction').before('<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
      } else {
        jQuery('#instruction').before('<div class="alert alert-info">' + json['text_thankyou'] + '</div>' +
          '<div>' + json['instruction'] + '</div>');
        jQuery('#button-confirm').unbind('click');
        jQuery('#button-confirm').bind('click', function() { location.href = json['success_url'] } );
        jQuery('#button-confirm').attr('value', json['button_continue']);
      }
		}
	});
}

jQuery('#button-confirm').bind('click', ajax_handler);

// simple checkout hack
if (jQuery('#payment-form').length > 0) {
  jQuery('#payment-form').css('display', 'block');
  jQuery('#button-confirm').click();
}
//--></script>
