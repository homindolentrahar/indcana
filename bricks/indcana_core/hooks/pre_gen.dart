import 'package:indcana_core_hooks/utils/hook_utils.dart';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final name = context.vars['name'] as String;
  final organization = context.vars['organization'] as String;
  final applicationId = context.vars['application_id'] as String;
  final routing = context.vars['routing'] as String;

  final organizationDomain = organization.split('.').first;
  final organizationName = organization.split('.').last;

  context.vars['organization_domain'] = organizationDomain;
  context.vars['organization_name'] = organizationName;

  if (applicationId.isEmpty)
    context.vars['application_id'] = HookUtils.getApplicationId(
      organization: organization,
      name: name,
    );

  if (routing == 'go_router') {
    context.vars['routing_go_router'] = true;
  }
}
