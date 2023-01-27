resource "azure_public_ip" "publicip1"
{
  name = "testpublicip"
  resource_group_name = azure_resource_group.testRG.name
  location = azure_resource_group.testRG.location
  allocation_method = "Static"
  sku = "Standard"
  ip_version = "IPv4"
  
  tag = {
  EnvironmentType = var.tag_environment_type
  }

  
  resource "zurerm_application_gateway" "appgw1" {
    name = "testappgw"
    resource_group_name = azure_resource_group.testRG.name
    location = azure_resource_group.testRG.location
    enable_http2 = "true"
    
    probe {
      name = "test-probe-80"
      host = "test.com"
      interval = "30"
      path = "/"
      protocol = "HTTP"
      timeout = "30"
      unhealthy_threshold = "5"
      match {
        body = ""
        status_code = [
          "200-401",
          ]
      }
    }
    
    backend_http_settings {
      name = "test-backend-http"
      cookie_based_affinity = "Enabled"
      affinity_cookie_name = "ApplicationgatewayAffinity"
      port = "80"
      probe_name = "test-probe-80"
      protocol = "HTTP"
      request_timeout = "180"
      host_name = "test.com"
    }
    
    backend_address_pool {
      name = "test-backend-pool"
      fqdns = "test.com.prod.cloud"
    }
    
    frontend_ip__configuration {
      name = "test-ip-config"
      public_ip_address_id = azure_public_ip.publicip1.id
    }
    
    frontend_port {
      name = "test-port-443"
      port = "443"
    }
    gateway_ip_configuration {
      name = "test-gw-config"
      subnet_id = local.subent_id
    }
    http_listener {
      name =  "test-listener"
      frontend_ip_configuration_name = "test-public-config"
      frontend_port_name = "test-port-443"
      protocol = "HTTPS"
      ssl_certificate_name = "test.com"
    }
    ssl_certificate {
      name = "test.com"
      key_vault_secret_id = local.appgw_key_vault_cert_secret
    }
    ssl_policy {
      min_protocol_version = "TLSv1_2"
      policy_type = "custom"
      cipher_suites = var.test_cipher
    }
    
    request_routing_rule {
      name = "test-routing-rule"
      rule_type = "PathBasedRouting"
      http_listener_name = "test-listener"
      backend_http_settings_name = "test-backend-http"
      url_path_map_name = "test-url-path"
      
     
    
