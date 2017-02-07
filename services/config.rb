coreo_uni_util_variables "cloudwatch-vars" do
  action :set
  variables([
                {'COMPOSITE::coreo_uni_util_variables.cloudwatch-vars.readme' => 'Cloudwatch rules are coming soon.'}
            ])
end
