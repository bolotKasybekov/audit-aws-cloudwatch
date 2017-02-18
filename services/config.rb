coreo_uni_util_variables "cloudwatch-vars" do
  action :set
  variables([
                {'COMPOSITE::coreo_uni_util_variables.cloudwatch-vars.readme' => 'Cloudwatch rules are coming soon.'}
            ])
end

coreo_aws_rule "cloudwatch-inventory" do
  action :define
  service :cloudwatch
  link "http://kb.cloudcoreo.com/mydoc-inventory.html"
  include_violations_in_count false
  display_name "Cloudwatch Inventory"
  description "This rule performs an inventory on all cloudwatch objects in the target AWS account."
  category "Inventory"
  suggested_action "None."
  level "Informational"
  meta_cis_id "99.999"
  objectives ["alarms"]
  audit_objects ["object.metric_alarms.alarm_name"]
  operators ["=~"]
  raise_when [//]
  id_map "object.metric_alarms.alarm_name"
end

coreo_aws_rule_runner "advise-cloudwatch" do
  rules ${AUDIT_AWS_CLOUDWATCH_ALERT_LIST}
  action :run
  service :cloudwatch
  regions ${AUDIT_AWS_CLOUDWATCH_REGIONS}
end

