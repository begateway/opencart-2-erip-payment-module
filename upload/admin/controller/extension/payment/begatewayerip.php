<?php
class ControllerExtensionPaymentBegatewayErip extends Controller {
  private $error = array();

  public function index() {
    $this->load->language('extension/payment/begatewayerip');

    $this->document->setTitle($this->language->get('heading_title'));

    $this->load->model('setting/setting');

    if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {

      $this->load->model('setting/setting');
      $this->model_setting_setting->editSetting('begatewayerip', $this->request->post);
      $this->session->data['success'] = $this->language->get('text_success');
      $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', 'SSL'));
    }

    $data['heading_title'] = $this->language->get('heading_title');
    $data['text_edit'] = $this->language->get('text_edit');

    $data['text_live_mode'] = $this->language->get('text_live_mode');
    $data['text_test_mode'] = $this->language->get('text_test_mode');
    $data['text_enabled'] = $this->language->get('text_enabled');
    $data['text_disabled'] = $this->language->get('text_disabled');
    $data['text_all_zones'] = $this->language->get('text_all_zones');

    $data['entry_email'] = $this->language->get('entry_email');
    $data['entry_order_status'] = $this->language->get('entry_order_status');
    $data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
    $data['entry_status'] = $this->language->get('entry_status');
    $data['entry_sort_order'] = $this->language->get('entry_sort_order');
    $data['entry_companyid'] = $this->language->get('entry_companyid');
    $data['entry_companyid_help'] = $this->language->get('entry_companyid_help');
    $data['entry_encryptionkey'] = $this->language->get('entry_encryptionkey');
    $data['entry_encryptionkey_help'] = $this->language->get('entry_encryptionkey_help');
    $data['entry_domain_api'] = $this->language->get('entry_domain_api');
    $data['entry_domain_api_help'] = $this->language->get('entry_domain_api_help');
    $data['entry_service_no'] = $this->language->get('entry_service_no');
    $data['entry_service_no_help'] = $this->language->get('entry_service_no_help');

    $data['button_save'] = $this->language->get('button_save');
    $data['button_cancel'] = $this->language->get('button_cancel');

    $data['tab_general'] = $this->language->get('tab_general');

    if (isset($this->error['warning'])) {
      $data['error_warning'] = $this->error['warning'];
    } else {
      $data['error_warning'] = '';
    }

    if (isset($this->error['companyid'])) {
      $data['error_companyid'] = $this->error['companyid'];
    } else {
      $data['error_companyid'] = '';
    }

    if (isset($this->error['encryptionkey'])) {
      $data['error_encryptionkey'] = $this->error['encryptionkey'];
    } else {
      $data['error_encryptionkey'] = '';
    }

    if (isset($this->error['domain_api'])) {
      $data['error_domain_api'] = $this->error['domain_api'];
    } else {
      $data['error_domain_api'] = '';
    }

    if (isset($this->error['service_no'])) {
      $data['error_service_no'] = $this->error['service_no'];
    } else {
      $data['error_service_no'] = '';
    }

    $data['breadcrumbs'] = array();

    $data['breadcrumbs'][] = array(
      'text'      => $this->language->get('text_home'),
      'href'      =>  $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
      'separator' => false
    );

    $data['breadcrumbs'][] = array(
      'text'      => $this->language->get('text_extension'),
      'href'      => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', 'SSL'),
    );

    $data['breadcrumbs'][] = array(
      'text'      => $this->language->get('heading_title'),
      'href'      => $this->url->link('extension/payment/begatewayerip', 'token=' . $this->session->data['token'], 'SSL'),
      'separator' => ' :: '
    );

    $data['action'] = $this->url->link('extension/payment/begatewayerip', 'token=' . $this->session->data['token'], 'SSL');

    $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', 'SSL');


    if (isset($this->request->post['begatewayerip_companyid'])) {
      $data['begatewayerip_companyid'] = $this->request->post['begatewayerip_companyid'];
    } else {
      $data['begatewayerip_companyid'] = $this->config->get('begatewayerip_companyid');
    }

    if (isset($this->request->post['begatewayerip_encryptionkey'])) {
      $data['begatewayerip_encryptionkey'] = $this->request->post['begatewayerip_encryptionkey'];
    } else {
      $data['begatewayerip_encryptionkey'] = $this->config->get('begatewayerip_encryptionkey');
    }

    if (isset($this->request->post['begatewayerip_domain_api'])) {
      $data['begatewayerip_domain_api'] = $this->request->post['begatewayerip_domain_api'];
    } else {
      $data['begatewayerip_domain_api'] = $this->config->get('begatewayerip_domain_api');
    }

    if (isset($this->request->post['begatewayerip_service_no'])) {
      $data['begatewayerip_service_no'] = $this->request->post['begatewayerip_service_no'];
    } else {
      $data['begatewayerip_service_no'] = $this->config->get('begatewayerip_service_no');
    }

    if (isset($this->request->post['begatewayerip_completed_status_id'])) {
      $data['begatewayerip_completed_status_id'] = $this->request->post['begatewayerip_completed_status_id'];
    } else {
      $data['begatewayerip_completed_status_id'] = $this->config->get('begatewayerip_completed_status_id');
    }

    $this->load->model('localisation/order_status');

    $data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

    if (isset($this->request->post['begatewayerip_status'])) {
      $data['begatewayerip_status'] = $this->request->post['begatewayerip_status'];
    } else {
      $data['begatewayerip_status'] = $this->config->get('begatewayerip_status');
    }

    if (isset($this->request->post['begatewayerip_geo_zone_id'])) {
      $data['begatewayerip_geo_zone_id'] = $this->request->post['begatewayerip_geo_zone_id'];
    } else {
      $data['begatewayerip_geo_zone_id'] = $this->config->get('begatewayerip_geo_zone_id');
    }

    $this->load->model('localisation/geo_zone');

    $data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

    if (isset($this->request->post['begatewayerip_sort_order'])) {
      $data['begatewayerip_sort_order'] = $this->request->post['begatewayerip_sort_order'];
    } else {
      $data['begatewayerip_sort_order'] = $this->config->get('begatewayerip_sort_order');
    }

    $data['token'] = $this->session->data['token'];
    $data['header'] = $this->load->controller('common/header');
    $data['column_left'] = $this->load->controller('common/column_left');
    $data['footer'] = $this->load->controller('common/footer');
    $this->response->setOutput($this->load->view('payment/begatewayerip.tpl', $data));
  }

  private function validate() {
    if (!$this->user->hasPermission('modify', 'extension/payment/begatewayerip')) {
      $this->error['warning'] = $this->language->get('error_permission');
    }

    if (!$this->request->post['begatewayerip_companyid']) {
      $this->error['companyid'] = $this->language->get('error_companyid');
    }

    if (!$this->request->post['begatewayerip_encryptionkey']) {
      $this->error['encryptionkey'] = $this->language->get('error_encryptionkey');
    }

    if (!$this->request->post['begatewayerip_domain_api']) {
        $this->error['domain_api'] = $this->language->get('error_domain_api');
    }
    if (!$this->request->post['begatewayerip_service_no']) {
      $this->error['service_no'] = $this->language->get('error_service_no');
    }

    if (!$this->error) {
      return TRUE;
    } else {
      return FALSE;
    }
  }
}
?>
