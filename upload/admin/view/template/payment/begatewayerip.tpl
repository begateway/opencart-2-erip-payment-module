<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-pp-express" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a> <a href="<?php echo $search; ?>" data-toggle="tooltip" title="<?php echo $button_search; ?>" class="btn btn-info"><i class="fa fa-search"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-erip" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-vendor"><span data-toggle="tooltip" title="<?php echo $entry_companyid_help; ?>"><?php echo $entry_companyid; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="begatewayerip_companyid" value="<?php echo $begatewayerip_companyid; ?>" placeholder="<?php echo $entry_companyid; ?>" id="input-vendor" class="form-control" />
              <?php if ($error_companyid) { ?>
              <div class="text-danger"><?php echo $error_companyid; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-key"><span data-toggle="tooltip" title="<?php echo $entry_encryptionkey_help; ?>"><?php echo $entry_encryptionkey; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="begatewayerip_encryptionkey" value="<?php echo $begatewayerip_encryptionkey; ?>" placeholder="<?php echo $entry_encryptionkey; ?>" id="input-key" class="form-control" />
              <?php if ($error_encryptionkey) { ?>
              <div class="text-danger"><?php echo $error_encryptionkey; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-key"><span data-toggle="tooltip" title="<?php echo $entry_domain_api_help; ?>"><?php echo $entry_domain_api; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="begatewayerip_domain_api" value="<?php echo $begatewayerip_domain_api; ?>" placeholder="<?php echo $entry_domain_api; ?>" id="input-key" class="form-control" />
              <?php if ($error_domain_api) { ?>
              <div class="text-danger"><?php echo $error_domain_api; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-key"><span data-toggle="tooltip" title="<?php echo $entry_service_no_help; ?>"><?php echo $entry_service_no; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="begatewayerip_service_no" value="<?php echo $begatewayerip_service_no; ?>" placeholder="<?php echo $entry_service_no; ?>" id="input-key" class="form-control" />
              <?php if ($error_service_no) { ?>
              <div class="text-danger"><?php echo $error_service_no; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
            <div class="col-sm-10">
              <select name="begatewayerip_completed_status_id" id="input-order-status" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $begatewayerip_completed_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
            <div class="col-sm-10">
              <select name="begatewayerip_geo_zone_id" id="input-geo-zone" class="form-control">
                <option value="0"><?php echo $text_all_zones; ?></option>
                <?php foreach ($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $begatewayerip_geo_zone_id) { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="begatewayerip_status" id="input-status" class="form-control">
                <?php $enabled_selected = '';
                      $disabled_selected = '';
                      if ($begatewayerip_status) {
                        $enabled_selected = 'selected';
                      } else {
                        $disabled_selected = 'selected';
                      }
                ?>
                <option value="1" <?php echo $enabled_selected; ?> ><?php echo $text_enabled; ?></option>
                <option value="0" <?php echo $disabled_selected; ?> ><?php echo $text_disabled; ?></option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="begatewayerip_sort_order" value="<?php echo $begatewayerip_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
