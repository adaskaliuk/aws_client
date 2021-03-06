// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

import 'elasticloadbalancingv2-2015-12-01.meta.dart';
export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'elasticloadbalancingv2-2015-12-01.g.dart';

/// A load balancer distributes incoming traffic across targets, such as your
/// EC2 instances. This enables you to increase the availability of your
/// application. The load balancer also monitors the health of its registered
/// targets and ensures that it routes traffic only to healthy targets. You
/// configure your load balancer to accept incoming traffic by specifying one or
/// more listeners, which are configured with a protocol and port number for
/// connections from clients to the load balancer. You configure a target group
/// with a protocol and port number for connections from the load balancer to
/// the targets, and with health check settings to be used when checking the
/// health status of the targets.
class ElasticLoadBalancingv2 {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  ElasticLoadBalancingv2({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: 'elasticloadbalancing',
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Adds the specified SSL server certificate to the certificate list for the
  /// specified HTTPS or TLS listener.
  ///
  /// If the certificate in already in the certificate list, the call is
  /// successful but the certificate is not added again.
  ///
  /// To get the certificate list for a listener, use
  /// <a>DescribeListenerCertificates</a>. To remove certificates from the
  /// certificate list for a listener, use <a>RemoveListenerCertificates</a>. To
  /// replace the default certificate for a listener, use <a>ModifyListener</a>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#https-listener-certificates">SSL
  /// Certificates</a> in the <i>Application Load Balancers Guide</i>.
  ///
  /// May throw [ListenerNotFoundException].
  /// May throw [TooManyCertificatesException].
  /// May throw [CertificateNotFoundException].
  ///
  /// Parameter [certificates] :
  /// The certificate to add. You can specify one certificate per call. Set
  /// <code>CertificateArn</code> to the certificate ARN but do not set
  /// <code>IsDefault</code>.
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener.
  Future<AddListenerCertificatesOutput> addListenerCertificates({
    @_s.required List<Certificate> certificates,
    @_s.required String listenerArn,
  }) async {
    ArgumentError.checkNotNull(certificates, 'certificates');
    ArgumentError.checkNotNull(listenerArn, 'listenerArn');
    final $request = <String, dynamic>{};
    $request['Certificates'] = certificates;
    $request['ListenerArn'] = listenerArn;
    final $result = await _protocol.send(
      $request,
      action: 'AddListenerCertificates',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddListenerCertificatesInput'],
      shapes: shapes,
      resultWrapper: 'AddListenerCertificatesResult',
    );
    return AddListenerCertificatesOutput.fromXml($result);
  }

  /// Adds the specified tags to the specified Elastic Load Balancing resource.
  /// You can tag your Application Load Balancers, Network Load Balancers, and
  /// your target groups.
  ///
  /// Each tag consists of a key and an optional value. If a resource already
  /// has a tag with the same key, <code>AddTags</code> updates its value.
  ///
  /// To list the current tags for your resources, use <a>DescribeTags</a>. To
  /// remove tags from your resources, use <a>RemoveTags</a>.
  ///
  /// May throw [DuplicateTagKeysException].
  /// May throw [TooManyTagsException].
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [TargetGroupNotFoundException].
  ///
  /// Parameter [resourceArns] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags.
  Future<void> addTags({
    @_s.required List<String> resourceArns,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArns, 'resourceArns');
    ArgumentError.checkNotNull(tags, 'tags');
    final $request = <String, dynamic>{};
    $request['ResourceArns'] = resourceArns;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'AddTags',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddTagsInput'],
      shapes: shapes,
      resultWrapper: 'AddTagsResult',
    );
  }

  /// Creates a listener for the specified Application Load Balancer or Network
  /// Load Balancer.
  ///
  /// To update a listener, use <a>ModifyListener</a>. When you are finished
  /// with a listener, you can delete it using <a>DeleteListener</a>. If you are
  /// finished with both the listener and the load balancer, you can delete them
  /// both using <a>DeleteLoadBalancer</a>.
  ///
  /// This operation is idempotent, which means that it completes at most one
  /// time. If you attempt to create multiple listeners with the same settings,
  /// each call succeeds.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html">Listeners
  /// for Your Application Load Balancers</a> in the <i>Application Load
  /// Balancers Guide</i> and <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-listeners.html">Listeners
  /// for Your Network Load Balancers</a> in the <i>Network Load Balancers
  /// Guide</i>.
  ///
  /// May throw [DuplicateListenerException].
  /// May throw [TooManyListenersException].
  /// May throw [TooManyCertificatesException].
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [TargetGroupNotFoundException].
  /// May throw [TargetGroupAssociationLimitException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [IncompatibleProtocolsException].
  /// May throw [SSLPolicyNotFoundException].
  /// May throw [CertificateNotFoundException].
  /// May throw [UnsupportedProtocolException].
  /// May throw [TooManyRegistrationsForTargetIdException].
  /// May throw [TooManyTargetsException].
  /// May throw [TooManyActionsException].
  /// May throw [InvalidLoadBalancerActionException].
  /// May throw [TooManyUniqueTargetGroupsPerLoadBalancerException].
  ///
  /// Parameter [defaultActions] :
  /// The actions for the default rule. The rule must include one forward action
  /// or one or more fixed-response actions.
  ///
  /// If the action type is <code>forward</code>, you specify one or more target
  /// groups. The protocol of the target group must be HTTP or HTTPS for an
  /// Application Load Balancer. The protocol of the target group must be TCP,
  /// TLS, UDP, or TCP_UDP for a Network Load Balancer.
  ///
  /// [HTTPS listeners] If the action type is <code>authenticate-oidc</code>,
  /// you authenticate users through an identity provider that is OpenID Connect
  /// (OIDC) compliant.
  ///
  /// [HTTPS listeners] If the action type is <code>authenticate-cognito</code>,
  /// you authenticate users through the user pools supported by Amazon Cognito.
  ///
  /// [Application Load Balancer] If the action type is <code>redirect</code>,
  /// you redirect specified client requests from one URL to another.
  ///
  /// [Application Load Balancer] If the action type is
  /// <code>fixed-response</code>, you drop specified client requests and return
  /// a custom HTTP response.
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// Parameter [port] :
  /// The port on which the load balancer is listening.
  ///
  /// Parameter [protocol] :
  /// The protocol for connections from clients to the load balancer. For
  /// Application Load Balancers, the supported protocols are HTTP and HTTPS.
  /// For Network Load Balancers, the supported protocols are TCP, TLS, UDP, and
  /// TCP_UDP.
  ///
  /// Parameter [certificates] :
  /// [HTTPS and TLS listeners] The default certificate for the listener. You
  /// must provide exactly one certificate. Set <code>CertificateArn</code> to
  /// the certificate ARN but do not set <code>IsDefault</code>.
  ///
  /// To create a certificate list for the listener, use
  /// <a>AddListenerCertificates</a>.
  ///
  /// Parameter [sslPolicy] :
  /// [HTTPS and TLS listeners] The security policy that defines which protocols
  /// and ciphers are supported. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>ELBSecurityPolicy-2016-08</code>
  /// </li>
  /// <li>
  /// <code>ELBSecurityPolicy-TLS-1-0-2015-04</code>
  /// </li>
  /// <li>
  /// <code>ELBSecurityPolicy-TLS-1-1-2017-01</code>
  /// </li>
  /// <li>
  /// <code>ELBSecurityPolicy-TLS-1-2-2017-01</code>
  /// </li>
  /// <li>
  /// <code>ELBSecurityPolicy-TLS-1-2-Ext-2018-06</code>
  /// </li>
  /// <li>
  /// <code>ELBSecurityPolicy-FS-2018-06</code>
  /// </li>
  /// <li>
  /// <code>ELBSecurityPolicy-FS-1-1-2019-08</code>
  /// </li>
  /// <li>
  /// <code>ELBSecurityPolicy-FS-1-2-2019-08</code>
  /// </li>
  /// <li>
  /// <code>ELBSecurityPolicy-FS-1-2-Res-2019-08</code>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies">Security
  /// Policies</a> in the <i>Application Load Balancers Guide</i> and <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#describe-ssl-policies">Security
  /// Policies</a> in the <i>Network Load Balancers Guide</i>.
  Future<CreateListenerOutput> createListener({
    @_s.required List<Action> defaultActions,
    @_s.required String loadBalancerArn,
    @_s.required int port,
    @_s.required ProtocolEnum protocol,
    List<Certificate> certificates,
    String sslPolicy,
  }) async {
    ArgumentError.checkNotNull(defaultActions, 'defaultActions');
    ArgumentError.checkNotNull(loadBalancerArn, 'loadBalancerArn');
    ArgumentError.checkNotNull(port, 'port');
    _s.validateNumRange(
      'port',
      port,
      1,
      65535,
      isRequired: true,
    );
    ArgumentError.checkNotNull(protocol, 'protocol');
    final $request = <String, dynamic>{};
    $request['DefaultActions'] = defaultActions;
    $request['LoadBalancerArn'] = loadBalancerArn;
    $request['Port'] = port;
    $request['Protocol'] = protocol.toValue();
    certificates?.also((arg) => $request['Certificates'] = arg);
    sslPolicy?.also((arg) => $request['SslPolicy'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateListener',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateListenerInput'],
      shapes: shapes,
      resultWrapper: 'CreateListenerResult',
    );
    return CreateListenerOutput.fromXml($result);
  }

  /// Creates an Application Load Balancer or a Network Load Balancer.
  ///
  /// When you create a load balancer, you can specify security groups, public
  /// subnets, IP address type, and tags. Otherwise, you could do so later using
  /// <a>SetSecurityGroups</a>, <a>SetSubnets</a>, <a>SetIpAddressType</a>, and
  /// <a>AddTags</a>.
  ///
  /// To create listeners for your load balancer, use <a>CreateListener</a>. To
  /// describe your current load balancers, see <a>DescribeLoadBalancers</a>.
  /// When you are finished with a load balancer, you can delete it using
  /// <a>DeleteLoadBalancer</a>.
  ///
  /// For limit information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html">Limits
  /// for Your Application Load Balancer</a> in the <i>Application Load
  /// Balancers Guide</i> and <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-limits.html">Limits
  /// for Your Network Load Balancer</a> in the <i>Network Load Balancers
  /// Guide</i>.
  ///
  /// This operation is idempotent, which means that it completes at most one
  /// time. If you attempt to create multiple load balancers with the same
  /// settings, each call succeeds.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html">Application
  /// Load Balancers</a> in the <i>Application Load Balancers Guide</i> and <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html">Network
  /// Load Balancers</a> in the <i>Network Load Balancers Guide</i>.
  ///
  /// May throw [DuplicateLoadBalancerNameException].
  /// May throw [TooManyLoadBalancersException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [SubnetNotFoundException].
  /// May throw [InvalidSubnetException].
  /// May throw [InvalidSecurityGroupException].
  /// May throw [InvalidSchemeException].
  /// May throw [TooManyTagsException].
  /// May throw [DuplicateTagKeysException].
  /// May throw [ResourceInUseException].
  /// May throw [AllocationIdNotFoundException].
  /// May throw [AvailabilityZoneNotSupportedException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [name] :
  /// The name of the load balancer.
  ///
  /// This name must be unique per region per account, can have a maximum of 32
  /// characters, must contain only alphanumeric characters or hyphens, must not
  /// begin or end with a hyphen, and must not begin with "internal-".
  ///
  /// Parameter [ipAddressType] :
  /// [Application Load Balancers] The type of IP addresses used by the subnets
  /// for your load balancer. The possible values are <code>ipv4</code> (for
  /// IPv4 addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses).
  /// Internal load balancers must use <code>ipv4</code>.
  ///
  /// Parameter [scheme] :
  /// The nodes of an Internet-facing load balancer have public IP addresses.
  /// The DNS name of an Internet-facing load balancer is publicly resolvable to
  /// the public IP addresses of the nodes. Therefore, Internet-facing load
  /// balancers can route requests from clients over the internet.
  ///
  /// The nodes of an internal load balancer have only private IP addresses. The
  /// DNS name of an internal load balancer is publicly resolvable to the
  /// private IP addresses of the nodes. Therefore, internal load balancers can
  /// route requests only from clients with access to the VPC for the load
  /// balancer.
  ///
  /// The default is an Internet-facing load balancer.
  ///
  /// Parameter [securityGroups] :
  /// [Application Load Balancers] The IDs of the security groups for the load
  /// balancer.
  ///
  /// Parameter [subnetMappings] :
  /// The IDs of the public subnets. You can specify only one subnet per
  /// Availability Zone. You must specify either subnets or subnet mappings.
  ///
  /// [Application Load Balancers] You must specify subnets from at least two
  /// Availability Zones. You cannot specify Elastic IP addresses for your
  /// subnets.
  ///
  /// [Network Load Balancers] You can specify subnets from one or more
  /// Availability Zones. You can specify one Elastic IP address per subnet if
  /// you need static IP addresses for your internet-facing load balancer. For
  /// internal load balancers, you can specify one private IP address per subnet
  /// from the IPv4 range of the subnet.
  ///
  /// Parameter [subnets] :
  /// The IDs of the public subnets. You can specify only one subnet per
  /// Availability Zone. You must specify either subnets or subnet mappings.
  ///
  /// [Application Load Balancers] You must specify subnets from at least two
  /// Availability Zones.
  ///
  /// [Network Load Balancers] You can specify subnets from one or more
  /// Availability Zones.
  ///
  /// Parameter [tags] :
  /// One or more tags to assign to the load balancer.
  ///
  /// Parameter [type] :
  /// The type of load balancer. The default is <code>application</code>.
  Future<CreateLoadBalancerOutput> createLoadBalancer({
    @_s.required String name,
    IpAddressType ipAddressType,
    LoadBalancerSchemeEnum scheme,
    List<String> securityGroups,
    List<SubnetMapping> subnetMappings,
    List<String> subnets,
    List<Tag> tags,
    LoadBalancerTypeEnum type,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final $request = <String, dynamic>{};
    $request['Name'] = name;
    ipAddressType?.also((arg) => $request['IpAddressType'] = arg.toValue());
    scheme?.also((arg) => $request['Scheme'] = arg.toValue());
    securityGroups?.also((arg) => $request['SecurityGroups'] = arg);
    subnetMappings?.also((arg) => $request['SubnetMappings'] = arg);
    subnets?.also((arg) => $request['Subnets'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    type?.also((arg) => $request['Type'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'CreateLoadBalancer',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateLoadBalancerInput'],
      shapes: shapes,
      resultWrapper: 'CreateLoadBalancerResult',
    );
    return CreateLoadBalancerOutput.fromXml($result);
  }

  /// Creates a rule for the specified listener. The listener must be associated
  /// with an Application Load Balancer.
  ///
  /// Rules are evaluated in priority order, from the lowest value to the
  /// highest value. When the conditions for a rule are met, its actions are
  /// performed. If the conditions for no rules are met, the actions for the
  /// default rule are performed. For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#listener-rules">Listener
  /// Rules</a> in the <i>Application Load Balancers Guide</i>.
  ///
  /// To view your current rules, use <a>DescribeRules</a>. To update a rule,
  /// use <a>ModifyRule</a>. To set the priorities of your rules, use
  /// <a>SetRulePriorities</a>. To delete a rule, use <a>DeleteRule</a>.
  ///
  /// May throw [PriorityInUseException].
  /// May throw [TooManyTargetGroupsException].
  /// May throw [TooManyRulesException].
  /// May throw [TargetGroupAssociationLimitException].
  /// May throw [IncompatibleProtocolsException].
  /// May throw [ListenerNotFoundException].
  /// May throw [TargetGroupNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [TooManyRegistrationsForTargetIdException].
  /// May throw [TooManyTargetsException].
  /// May throw [UnsupportedProtocolException].
  /// May throw [TooManyActionsException].
  /// May throw [InvalidLoadBalancerActionException].
  /// May throw [TooManyUniqueTargetGroupsPerLoadBalancerException].
  ///
  /// Parameter [actions] :
  /// The actions. Each rule must include exactly one of the following types of
  /// actions: <code>forward</code>, <code>fixed-response</code>, or
  /// <code>redirect</code>, and it must be the last action to be performed.
  ///
  /// If the action type is <code>forward</code>, you specify one or more target
  /// groups. The protocol of the target group must be HTTP or HTTPS for an
  /// Application Load Balancer. The protocol of the target group must be TCP,
  /// TLS, UDP, or TCP_UDP for a Network Load Balancer.
  ///
  /// [HTTPS listeners] If the action type is <code>authenticate-oidc</code>,
  /// you authenticate users through an identity provider that is OpenID Connect
  /// (OIDC) compliant.
  ///
  /// [HTTPS listeners] If the action type is <code>authenticate-cognito</code>,
  /// you authenticate users through the user pools supported by Amazon Cognito.
  ///
  /// [Application Load Balancer] If the action type is <code>redirect</code>,
  /// you redirect specified client requests from one URL to another.
  ///
  /// [Application Load Balancer] If the action type is
  /// <code>fixed-response</code>, you drop specified client requests and return
  /// a custom HTTP response.
  ///
  /// Parameter [conditions] :
  /// The conditions. Each rule can include zero or one of the following
  /// conditions: <code>http-request-method</code>, <code>host-header</code>,
  /// <code>path-pattern</code>, and <code>source-ip</code>, and zero or more of
  /// the following conditions: <code>http-header</code> and
  /// <code>query-string</code>.
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener.
  ///
  /// Parameter [priority] :
  /// The rule priority. A listener can't have multiple rules with the same
  /// priority.
  Future<CreateRuleOutput> createRule({
    @_s.required List<Action> actions,
    @_s.required List<RuleCondition> conditions,
    @_s.required String listenerArn,
    @_s.required int priority,
  }) async {
    ArgumentError.checkNotNull(actions, 'actions');
    ArgumentError.checkNotNull(conditions, 'conditions');
    ArgumentError.checkNotNull(listenerArn, 'listenerArn');
    ArgumentError.checkNotNull(priority, 'priority');
    _s.validateNumRange(
      'priority',
      priority,
      1,
      50000,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['Actions'] = actions;
    $request['Conditions'] = conditions;
    $request['ListenerArn'] = listenerArn;
    $request['Priority'] = priority;
    final $result = await _protocol.send(
      $request,
      action: 'CreateRule',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateRuleInput'],
      shapes: shapes,
      resultWrapper: 'CreateRuleResult',
    );
    return CreateRuleOutput.fromXml($result);
  }

  /// Creates a target group.
  ///
  /// To register targets with the target group, use <a>RegisterTargets</a>. To
  /// update the health check settings for the target group, use
  /// <a>ModifyTargetGroup</a>. To monitor the health of targets in the target
  /// group, use <a>DescribeTargetHealth</a>.
  ///
  /// To route traffic to the targets in a target group, specify the target
  /// group in an action using <a>CreateListener</a> or <a>CreateRule</a>.
  ///
  /// To delete a target group, use <a>DeleteTargetGroup</a>.
  ///
  /// This operation is idempotent, which means that it completes at most one
  /// time. If you attempt to create multiple target groups with the same
  /// settings, each call succeeds.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html">Target
  /// Groups for Your Application Load Balancers</a> in the <i>Application Load
  /// Balancers Guide</i> or <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html">Target
  /// Groups for Your Network Load Balancers</a> in the <i>Network Load
  /// Balancers Guide</i>.
  ///
  /// May throw [DuplicateTargetGroupNameException].
  /// May throw [TooManyTargetGroupsException].
  /// May throw [InvalidConfigurationRequestException].
  ///
  /// Parameter [name] :
  /// The name of the target group.
  ///
  /// This name must be unique per region per account, can have a maximum of 32
  /// characters, must contain only alphanumeric characters or hyphens, and must
  /// not begin or end with a hyphen.
  ///
  /// Parameter [healthCheckEnabled] :
  /// Indicates whether health checks are enabled. If the target type is
  /// <code>lambda</code>, health checks are disabled by default but can be
  /// enabled. If the target type is <code>instance</code> or <code>ip</code>,
  /// health checks are always enabled and cannot be disabled.
  ///
  /// Parameter [healthCheckIntervalSeconds] :
  /// The approximate amount of time, in seconds, between health checks of an
  /// individual target. For HTTP and HTTPS health checks, the range is 5–300
  /// seconds. For TCP health checks, the supported values are 10 and 30
  /// seconds. If the target type is <code>instance</code> or <code>ip</code>,
  /// the default is 30 seconds. If the target type is <code>lambda</code>, the
  /// default is 35 seconds.
  ///
  /// Parameter [healthCheckPath] :
  /// [HTTP/HTTPS health checks] The ping path that is the destination on the
  /// targets for health checks. The default is /.
  ///
  /// Parameter [healthCheckPort] :
  /// The port the load balancer uses when performing health checks on targets.
  /// The default is <code>traffic-port</code>, which is the port on which each
  /// target receives traffic from the load balancer.
  ///
  /// Parameter [healthCheckProtocol] :
  /// The protocol the load balancer uses when performing health checks on
  /// targets. For Application Load Balancers, the default is HTTP. For Network
  /// Load Balancers, the default is TCP. The TCP protocol is supported for
  /// health checks only if the protocol of the target group is TCP, TLS, UDP,
  /// or TCP_UDP. The TLS, UDP, and TCP_UDP protocols are not supported for
  /// health checks.
  ///
  /// Parameter [healthCheckTimeoutSeconds] :
  /// The amount of time, in seconds, during which no response from a target
  /// means a failed health check. For target groups with a protocol of HTTP or
  /// HTTPS, the default is 5 seconds. For target groups with a protocol of TCP
  /// or TLS, this value must be 6 seconds for HTTP health checks and 10 seconds
  /// for TCP and HTTPS health checks. If the target type is
  /// <code>lambda</code>, the default is 30 seconds.
  ///
  /// Parameter [healthyThresholdCount] :
  /// The number of consecutive health checks successes required before
  /// considering an unhealthy target healthy. For target groups with a protocol
  /// of HTTP or HTTPS, the default is 5. For target groups with a protocol of
  /// TCP or TLS, the default is 3. If the target type is <code>lambda</code>,
  /// the default is 5.
  ///
  /// Parameter [matcher] :
  /// [HTTP/HTTPS health checks] The HTTP codes to use when checking for a
  /// successful response from a target.
  ///
  /// Parameter [port] :
  /// The port on which the targets receive traffic. This port is used unless
  /// you specify a port override when registering the target. If the target is
  /// a Lambda function, this parameter does not apply.
  ///
  /// Parameter [protocol] :
  /// The protocol to use for routing traffic to the targets. For Application
  /// Load Balancers, the supported protocols are HTTP and HTTPS. For Network
  /// Load Balancers, the supported protocols are TCP, TLS, UDP, or TCP_UDP. A
  /// TCP_UDP listener must be associated with a TCP_UDP target group. If the
  /// target is a Lambda function, this parameter does not apply.
  ///
  /// Parameter [targetType] :
  /// The type of target that you must specify when registering targets with
  /// this target group. You can't specify targets for a target group using more
  /// than one target type.
  ///
  /// <ul>
  /// <li>
  /// <code>instance</code> - Targets are specified by instance ID. This is the
  /// default value. If the target group protocol is UDP or TCP_UDP, the target
  /// type must be <code>instance</code>.
  /// </li>
  /// <li>
  /// <code>ip</code> - Targets are specified by IP address. You can specify IP
  /// addresses from the subnets of the virtual private cloud (VPC) for the
  /// target group, the RFC 1918 range (10.0.0.0/8, 172.16.0.0/12, and
  /// 192.168.0.0/16), and the RFC 6598 range (100.64.0.0/10). You can't specify
  /// publicly routable IP addresses.
  /// </li>
  /// <li>
  /// <code>lambda</code> - The target groups contains a single Lambda function.
  /// </li>
  /// </ul>
  ///
  /// Parameter [unhealthyThresholdCount] :
  /// The number of consecutive health check failures required before
  /// considering a target unhealthy. For target groups with a protocol of HTTP
  /// or HTTPS, the default is 2. For target groups with a protocol of TCP or
  /// TLS, this value must be the same as the healthy threshold count. If the
  /// target type is <code>lambda</code>, the default is 2.
  ///
  /// Parameter [vpcId] :
  /// The identifier of the virtual private cloud (VPC). If the target is a
  /// Lambda function, this parameter does not apply. Otherwise, this parameter
  /// is required.
  Future<CreateTargetGroupOutput> createTargetGroup({
    @_s.required String name,
    bool healthCheckEnabled,
    int healthCheckIntervalSeconds,
    String healthCheckPath,
    String healthCheckPort,
    ProtocolEnum healthCheckProtocol,
    int healthCheckTimeoutSeconds,
    int healthyThresholdCount,
    Matcher matcher,
    int port,
    ProtocolEnum protocol,
    TargetTypeEnum targetType,
    int unhealthyThresholdCount,
    String vpcId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateNumRange(
      'healthCheckIntervalSeconds',
      healthCheckIntervalSeconds,
      5,
      300,
    );
    _s.validateStringLength(
      'healthCheckPath',
      healthCheckPath,
      1,
      1024,
    );
    _s.validateNumRange(
      'healthCheckTimeoutSeconds',
      healthCheckTimeoutSeconds,
      2,
      120,
    );
    _s.validateNumRange(
      'healthyThresholdCount',
      healthyThresholdCount,
      2,
      10,
    );
    _s.validateNumRange(
      'port',
      port,
      1,
      65535,
    );
    _s.validateNumRange(
      'unhealthyThresholdCount',
      unhealthyThresholdCount,
      2,
      10,
    );
    final $request = <String, dynamic>{};
    $request['Name'] = name;
    healthCheckEnabled?.also((arg) => $request['HealthCheckEnabled'] = arg);
    healthCheckIntervalSeconds
        ?.also((arg) => $request['HealthCheckIntervalSeconds'] = arg);
    healthCheckPath?.also((arg) => $request['HealthCheckPath'] = arg);
    healthCheckPort?.also((arg) => $request['HealthCheckPort'] = arg);
    healthCheckProtocol
        ?.also((arg) => $request['HealthCheckProtocol'] = arg.toValue());
    healthCheckTimeoutSeconds
        ?.also((arg) => $request['HealthCheckTimeoutSeconds'] = arg);
    healthyThresholdCount
        ?.also((arg) => $request['HealthyThresholdCount'] = arg);
    matcher?.also((arg) => $request['Matcher'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    protocol?.also((arg) => $request['Protocol'] = arg.toValue());
    targetType?.also((arg) => $request['TargetType'] = arg.toValue());
    unhealthyThresholdCount
        ?.also((arg) => $request['UnhealthyThresholdCount'] = arg);
    vpcId?.also((arg) => $request['VpcId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateTargetGroup',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateTargetGroupInput'],
      shapes: shapes,
      resultWrapper: 'CreateTargetGroupResult',
    );
    return CreateTargetGroupOutput.fromXml($result);
  }

  /// Deletes the specified listener.
  ///
  /// Alternatively, your listener is deleted when you delete the load balancer
  /// to which it is attached, using <a>DeleteLoadBalancer</a>.
  ///
  /// May throw [ListenerNotFoundException].
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener.
  Future<void> deleteListener({
    @_s.required String listenerArn,
  }) async {
    ArgumentError.checkNotNull(listenerArn, 'listenerArn');
    final $request = <String, dynamic>{};
    $request['ListenerArn'] = listenerArn;
    await _protocol.send(
      $request,
      action: 'DeleteListener',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteListenerInput'],
      shapes: shapes,
      resultWrapper: 'DeleteListenerResult',
    );
  }

  /// Deletes the specified Application Load Balancer or Network Load Balancer
  /// and its attached listeners.
  ///
  /// You can't delete a load balancer if deletion protection is enabled. If the
  /// load balancer does not exist or has already been deleted, the call
  /// succeeds.
  ///
  /// Deleting a load balancer does not affect its registered targets. For
  /// example, your EC2 instances continue to run and are still registered to
  /// their target groups. If you no longer need these EC2 instances, you can
  /// stop or terminate them.
  ///
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  Future<void> deleteLoadBalancer({
    @_s.required String loadBalancerArn,
  }) async {
    ArgumentError.checkNotNull(loadBalancerArn, 'loadBalancerArn');
    final $request = <String, dynamic>{};
    $request['LoadBalancerArn'] = loadBalancerArn;
    await _protocol.send(
      $request,
      action: 'DeleteLoadBalancer',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteLoadBalancerInput'],
      shapes: shapes,
      resultWrapper: 'DeleteLoadBalancerResult',
    );
  }

  /// Deletes the specified rule.
  ///
  /// May throw [RuleNotFoundException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [ruleArn] :
  /// The Amazon Resource Name (ARN) of the rule.
  Future<void> deleteRule({
    @_s.required String ruleArn,
  }) async {
    ArgumentError.checkNotNull(ruleArn, 'ruleArn');
    final $request = <String, dynamic>{};
    $request['RuleArn'] = ruleArn;
    await _protocol.send(
      $request,
      action: 'DeleteRule',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteRuleInput'],
      shapes: shapes,
      resultWrapper: 'DeleteRuleResult',
    );
  }

  /// Deletes the specified target group.
  ///
  /// You can delete a target group if it is not referenced by any actions.
  /// Deleting a target group also deletes any associated health checks.
  ///
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [targetGroupArn] :
  /// The Amazon Resource Name (ARN) of the target group.
  Future<void> deleteTargetGroup({
    @_s.required String targetGroupArn,
  }) async {
    ArgumentError.checkNotNull(targetGroupArn, 'targetGroupArn');
    final $request = <String, dynamic>{};
    $request['TargetGroupArn'] = targetGroupArn;
    await _protocol.send(
      $request,
      action: 'DeleteTargetGroup',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteTargetGroupInput'],
      shapes: shapes,
      resultWrapper: 'DeleteTargetGroupResult',
    );
  }

  /// Deregisters the specified targets from the specified target group. After
  /// the targets are deregistered, they no longer receive traffic from the load
  /// balancer.
  ///
  /// May throw [TargetGroupNotFoundException].
  /// May throw [InvalidTargetException].
  ///
  /// Parameter [targetGroupArn] :
  /// The Amazon Resource Name (ARN) of the target group.
  ///
  /// Parameter [targets] :
  /// The targets. If you specified a port override when you registered a
  /// target, you must specify both the target ID and the port when you
  /// deregister it.
  Future<void> deregisterTargets({
    @_s.required String targetGroupArn,
    @_s.required List<TargetDescription> targets,
  }) async {
    ArgumentError.checkNotNull(targetGroupArn, 'targetGroupArn');
    ArgumentError.checkNotNull(targets, 'targets');
    final $request = <String, dynamic>{};
    $request['TargetGroupArn'] = targetGroupArn;
    $request['Targets'] = targets;
    await _protocol.send(
      $request,
      action: 'DeregisterTargets',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeregisterTargetsInput'],
      shapes: shapes,
      resultWrapper: 'DeregisterTargetsResult',
    );
  }

  /// Describes the current Elastic Load Balancing resource limits for your AWS
  /// account.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html">Limits
  /// for Your Application Load Balancers</a> in the <i>Application Load
  /// Balancer Guide</i> or <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-limits.html">Limits
  /// for Your Network Load Balancers</a> in the <i>Network Load Balancers
  /// Guide</i>.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  Future<DescribeAccountLimitsOutput> describeAccountLimits({
    String marker,
    int pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAccountLimits',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeAccountLimitsInput'],
      shapes: shapes,
      resultWrapper: 'DescribeAccountLimitsResult',
    );
    return DescribeAccountLimitsOutput.fromXml($result);
  }

  /// Describes the default certificate and the certificate list for the
  /// specified HTTPS or TLS listener.
  ///
  /// If the default certificate is also in the certificate list, it appears
  /// twice in the results (once with <code>IsDefault</code> set to true and
  /// once with <code>IsDefault</code> set to false).
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#https-listener-certificates">SSL
  /// Certificates</a> in the <i>Application Load Balancers Guide</i>.
  ///
  /// May throw [ListenerNotFoundException].
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Names (ARN) of the listener.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  Future<DescribeListenerCertificatesOutput> describeListenerCertificates({
    @_s.required String listenerArn,
    String marker,
    int pageSize,
  }) async {
    ArgumentError.checkNotNull(listenerArn, 'listenerArn');
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    $request['ListenerArn'] = listenerArn;
    marker?.also((arg) => $request['Marker'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeListenerCertificates',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeListenerCertificatesInput'],
      shapes: shapes,
      resultWrapper: 'DescribeListenerCertificatesResult',
    );
    return DescribeListenerCertificatesOutput.fromXml($result);
  }

  /// Describes the specified listeners or the listeners for the specified
  /// Application Load Balancer or Network Load Balancer. You must specify
  /// either a load balancer or one or more listeners.
  ///
  /// For an HTTPS or TLS listener, the output includes the default certificate
  /// for the listener. To describe the certificate list for the listener, use
  /// <a>DescribeListenerCertificates</a>.
  ///
  /// May throw [ListenerNotFoundException].
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [UnsupportedProtocolException].
  ///
  /// Parameter [listenerArns] :
  /// The Amazon Resource Names (ARN) of the listeners.
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  Future<DescribeListenersOutput> describeListeners({
    List<String> listenerArns,
    String loadBalancerArn,
    String marker,
    int pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    listenerArns?.also((arg) => $request['ListenerArns'] = arg);
    loadBalancerArn?.also((arg) => $request['LoadBalancerArn'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeListeners',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeListenersInput'],
      shapes: shapes,
      resultWrapper: 'DescribeListenersResult',
    );
    return DescribeListenersOutput.fromXml($result);
  }

  /// Describes the attributes for the specified Application Load Balancer or
  /// Network Load Balancer.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html#load-balancer-attributes">Load
  /// Balancer Attributes</a> in the <i>Application Load Balancers Guide</i> or
  /// <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html#load-balancer-attributes">Load
  /// Balancer Attributes</a> in the <i>Network Load Balancers Guide</i>.
  ///
  /// May throw [LoadBalancerNotFoundException].
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  Future<DescribeLoadBalancerAttributesOutput> describeLoadBalancerAttributes({
    @_s.required String loadBalancerArn,
  }) async {
    ArgumentError.checkNotNull(loadBalancerArn, 'loadBalancerArn');
    final $request = <String, dynamic>{};
    $request['LoadBalancerArn'] = loadBalancerArn;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeLoadBalancerAttributes',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeLoadBalancerAttributesInput'],
      shapes: shapes,
      resultWrapper: 'DescribeLoadBalancerAttributesResult',
    );
    return DescribeLoadBalancerAttributesOutput.fromXml($result);
  }

  /// Describes the specified load balancers or all of your load balancers.
  ///
  /// To describe the listeners for a load balancer, use
  /// <a>DescribeListeners</a>. To describe the attributes for a load balancer,
  /// use <a>DescribeLoadBalancerAttributes</a>.
  ///
  /// May throw [LoadBalancerNotFoundException].
  ///
  /// Parameter [loadBalancerArns] :
  /// The Amazon Resource Names (ARN) of the load balancers. You can specify up
  /// to 20 load balancers in a single call.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [names] :
  /// The names of the load balancers.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  Future<DescribeLoadBalancersOutput> describeLoadBalancers({
    List<String> loadBalancerArns,
    String marker,
    List<String> names,
    int pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    loadBalancerArns?.also((arg) => $request['LoadBalancerArns'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    names?.also((arg) => $request['Names'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeLoadBalancers',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeLoadBalancersInput'],
      shapes: shapes,
      resultWrapper: 'DescribeLoadBalancersResult',
    );
    return DescribeLoadBalancersOutput.fromXml($result);
  }

  /// Describes the specified rules or the rules for the specified listener. You
  /// must specify either a listener or one or more rules.
  ///
  /// May throw [ListenerNotFoundException].
  /// May throw [RuleNotFoundException].
  /// May throw [UnsupportedProtocolException].
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  ///
  /// Parameter [ruleArns] :
  /// The Amazon Resource Names (ARN) of the rules.
  Future<DescribeRulesOutput> describeRules({
    String listenerArn,
    String marker,
    int pageSize,
    List<String> ruleArns,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    listenerArn?.also((arg) => $request['ListenerArn'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    ruleArns?.also((arg) => $request['RuleArns'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeRules',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeRulesInput'],
      shapes: shapes,
      resultWrapper: 'DescribeRulesResult',
    );
    return DescribeRulesOutput.fromXml($result);
  }

  /// Describes the specified policies or all policies used for SSL negotiation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies">Security
  /// Policies</a> in the <i>Application Load Balancers Guide</i>.
  ///
  /// May throw [SSLPolicyNotFoundException].
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [names] :
  /// The names of the policies.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  Future<DescribeSSLPoliciesOutput> describeSSLPolicies({
    String marker,
    List<String> names,
    int pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    names?.also((arg) => $request['Names'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeSSLPolicies',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeSSLPoliciesInput'],
      shapes: shapes,
      resultWrapper: 'DescribeSSLPoliciesResult',
    );
    return DescribeSSLPoliciesOutput.fromXml($result);
  }

  /// Describes the tags for the specified resources. You can describe the tags
  /// for one or more Application Load Balancers, Network Load Balancers, and
  /// target groups.
  ///
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [TargetGroupNotFoundException].
  /// May throw [ListenerNotFoundException].
  /// May throw [RuleNotFoundException].
  ///
  /// Parameter [resourceArns] :
  /// The Amazon Resource Names (ARN) of the resources. You can specify up to 20
  /// resources in a single call.
  Future<DescribeTagsOutput> describeTags({
    @_s.required List<String> resourceArns,
  }) async {
    ArgumentError.checkNotNull(resourceArns, 'resourceArns');
    final $request = <String, dynamic>{};
    $request['ResourceArns'] = resourceArns;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTags',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTagsInput'],
      shapes: shapes,
      resultWrapper: 'DescribeTagsResult',
    );
    return DescribeTagsOutput.fromXml($result);
  }

  /// Describes the attributes for the specified target group.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html#target-group-attributes">Target
  /// Group Attributes</a> in the <i>Application Load Balancers Guide</i> or <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html#target-group-attributes">Target
  /// Group Attributes</a> in the <i>Network Load Balancers Guide</i>.
  ///
  /// May throw [TargetGroupNotFoundException].
  ///
  /// Parameter [targetGroupArn] :
  /// The Amazon Resource Name (ARN) of the target group.
  Future<DescribeTargetGroupAttributesOutput> describeTargetGroupAttributes({
    @_s.required String targetGroupArn,
  }) async {
    ArgumentError.checkNotNull(targetGroupArn, 'targetGroupArn');
    final $request = <String, dynamic>{};
    $request['TargetGroupArn'] = targetGroupArn;
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTargetGroupAttributes',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTargetGroupAttributesInput'],
      shapes: shapes,
      resultWrapper: 'DescribeTargetGroupAttributesResult',
    );
    return DescribeTargetGroupAttributesOutput.fromXml($result);
  }

  /// Describes the specified target groups or all of your target groups. By
  /// default, all target groups are described. Alternatively, you can specify
  /// one of the following to filter the results: the ARN of the load balancer,
  /// the names of one or more target groups, or the ARNs of one or more target
  /// groups.
  ///
  /// To describe the targets for a target group, use
  /// <a>DescribeTargetHealth</a>. To describe the attributes of a target group,
  /// use <a>DescribeTargetGroupAttributes</a>.
  ///
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [TargetGroupNotFoundException].
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results. (You received this marker from a
  /// previous call.)
  ///
  /// Parameter [names] :
  /// The names of the target groups.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return with this call.
  ///
  /// Parameter [targetGroupArns] :
  /// The Amazon Resource Names (ARN) of the target groups.
  Future<DescribeTargetGroupsOutput> describeTargetGroups({
    String loadBalancerArn,
    String marker,
    List<String> names,
    int pageSize,
    List<String> targetGroupArns,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      400,
    );
    final $request = <String, dynamic>{};
    loadBalancerArn?.also((arg) => $request['LoadBalancerArn'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    names?.also((arg) => $request['Names'] = arg);
    pageSize?.also((arg) => $request['PageSize'] = arg);
    targetGroupArns?.also((arg) => $request['TargetGroupArns'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTargetGroups',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTargetGroupsInput'],
      shapes: shapes,
      resultWrapper: 'DescribeTargetGroupsResult',
    );
    return DescribeTargetGroupsOutput.fromXml($result);
  }

  /// Describes the health of the specified targets or all of your targets.
  ///
  /// May throw [InvalidTargetException].
  /// May throw [TargetGroupNotFoundException].
  /// May throw [HealthUnavailableException].
  ///
  /// Parameter [targetGroupArn] :
  /// The Amazon Resource Name (ARN) of the target group.
  ///
  /// Parameter [targets] :
  /// The targets.
  Future<DescribeTargetHealthOutput> describeTargetHealth({
    @_s.required String targetGroupArn,
    List<TargetDescription> targets,
  }) async {
    ArgumentError.checkNotNull(targetGroupArn, 'targetGroupArn');
    final $request = <String, dynamic>{};
    $request['TargetGroupArn'] = targetGroupArn;
    targets?.also((arg) => $request['Targets'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeTargetHealth',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeTargetHealthInput'],
      shapes: shapes,
      resultWrapper: 'DescribeTargetHealthResult',
    );
    return DescribeTargetHealthOutput.fromXml($result);
  }

  /// Replaces the specified properties of the specified listener. Any
  /// properties that you do not specify remain unchanged.
  ///
  /// Changing the protocol from HTTPS to HTTP, or from TLS to TCP, removes the
  /// security policy and default certificate properties. If you change the
  /// protocol from HTTP to HTTPS, or from TCP to TLS, you must add the security
  /// policy and default certificate properties.
  ///
  /// To add an item to a list, remove an item from a list, or update an item in
  /// a list, you must provide the entire list. For example, to add an action,
  /// specify a list with the current actions plus the new action.
  ///
  /// May throw [DuplicateListenerException].
  /// May throw [TooManyListenersException].
  /// May throw [TooManyCertificatesException].
  /// May throw [ListenerNotFoundException].
  /// May throw [TargetGroupNotFoundException].
  /// May throw [TargetGroupAssociationLimitException].
  /// May throw [IncompatibleProtocolsException].
  /// May throw [SSLPolicyNotFoundException].
  /// May throw [CertificateNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [UnsupportedProtocolException].
  /// May throw [TooManyRegistrationsForTargetIdException].
  /// May throw [TooManyTargetsException].
  /// May throw [TooManyActionsException].
  /// May throw [InvalidLoadBalancerActionException].
  /// May throw [TooManyUniqueTargetGroupsPerLoadBalancerException].
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener.
  ///
  /// Parameter [certificates] :
  /// [HTTPS and TLS listeners] The default certificate for the listener. You
  /// must provide exactly one certificate. Set <code>CertificateArn</code> to
  /// the certificate ARN but do not set <code>IsDefault</code>.
  ///
  /// To create a certificate list, use <a>AddListenerCertificates</a>.
  ///
  /// Parameter [defaultActions] :
  /// The actions for the default rule. The rule must include one forward action
  /// or one or more fixed-response actions.
  ///
  /// If the action type is <code>forward</code>, you specify one or more target
  /// groups. The protocol of the target group must be HTTP or HTTPS for an
  /// Application Load Balancer. The protocol of the target group must be TCP,
  /// TLS, UDP, or TCP_UDP for a Network Load Balancer.
  ///
  /// [HTTPS listeners] If the action type is <code>authenticate-oidc</code>,
  /// you authenticate users through an identity provider that is OpenID Connect
  /// (OIDC) compliant.
  ///
  /// [HTTPS listeners] If the action type is <code>authenticate-cognito</code>,
  /// you authenticate users through the user pools supported by Amazon Cognito.
  ///
  /// [Application Load Balancer] If the action type is <code>redirect</code>,
  /// you redirect specified client requests from one URL to another.
  ///
  /// [Application Load Balancer] If the action type is
  /// <code>fixed-response</code>, you drop specified client requests and return
  /// a custom HTTP response.
  ///
  /// Parameter [port] :
  /// The port for connections from clients to the load balancer.
  ///
  /// Parameter [protocol] :
  /// The protocol for connections from clients to the load balancer.
  /// Application Load Balancers support the HTTP and HTTPS protocols. Network
  /// Load Balancers support the TCP, TLS, UDP, and TCP_UDP protocols.
  ///
  /// Parameter [sslPolicy] :
  /// [HTTPS and TLS listeners] The security policy that defines which protocols
  /// and ciphers are supported. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>ELBSecurityPolicy-2016-08</code>
  /// </li>
  /// <li>
  /// <code>ELBSecurityPolicy-TLS-1-0-2015-04</code>
  /// </li>
  /// <li>
  /// <code>ELBSecurityPolicy-TLS-1-1-2017-01</code>
  /// </li>
  /// <li>
  /// <code>ELBSecurityPolicy-TLS-1-2-2017-01</code>
  /// </li>
  /// <li>
  /// <code>ELBSecurityPolicy-TLS-1-2-Ext-2018-06</code>
  /// </li>
  /// <li>
  /// <code>ELBSecurityPolicy-FS-2018-06</code>
  /// </li>
  /// <li>
  /// <code>ELBSecurityPolicy-FS-1-1-2019-08</code>
  /// </li>
  /// <li>
  /// <code>ELBSecurityPolicy-FS-1-2-2019-08</code>
  /// </li>
  /// <li>
  /// <code>ELBSecurityPolicy-FS-1-2-Res-2019-08</code>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies">Security
  /// Policies</a> in the <i>Application Load Balancers Guide</i> and <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-tls-listener.html#describe-ssl-policies">Security
  /// Policies</a> in the <i>Network Load Balancers Guide</i>.
  Future<ModifyListenerOutput> modifyListener({
    @_s.required String listenerArn,
    List<Certificate> certificates,
    List<Action> defaultActions,
    int port,
    ProtocolEnum protocol,
    String sslPolicy,
  }) async {
    ArgumentError.checkNotNull(listenerArn, 'listenerArn');
    _s.validateNumRange(
      'port',
      port,
      1,
      65535,
    );
    final $request = <String, dynamic>{};
    $request['ListenerArn'] = listenerArn;
    certificates?.also((arg) => $request['Certificates'] = arg);
    defaultActions?.also((arg) => $request['DefaultActions'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    protocol?.also((arg) => $request['Protocol'] = arg.toValue());
    sslPolicy?.also((arg) => $request['SslPolicy'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyListener',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyListenerInput'],
      shapes: shapes,
      resultWrapper: 'ModifyListenerResult',
    );
    return ModifyListenerOutput.fromXml($result);
  }

  /// Modifies the specified attributes of the specified Application Load
  /// Balancer or Network Load Balancer.
  ///
  /// If any of the specified attributes can't be modified as requested, the
  /// call fails. Any existing attributes that you do not modify retain their
  /// current values.
  ///
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  ///
  /// Parameter [attributes] :
  /// The load balancer attributes.
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  Future<ModifyLoadBalancerAttributesOutput> modifyLoadBalancerAttributes({
    @_s.required List<LoadBalancerAttribute> attributes,
    @_s.required String loadBalancerArn,
  }) async {
    ArgumentError.checkNotNull(attributes, 'attributes');
    ArgumentError.checkNotNull(loadBalancerArn, 'loadBalancerArn');
    final $request = <String, dynamic>{};
    $request['Attributes'] = attributes;
    $request['LoadBalancerArn'] = loadBalancerArn;
    final $result = await _protocol.send(
      $request,
      action: 'ModifyLoadBalancerAttributes',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyLoadBalancerAttributesInput'],
      shapes: shapes,
      resultWrapper: 'ModifyLoadBalancerAttributesResult',
    );
    return ModifyLoadBalancerAttributesOutput.fromXml($result);
  }

  /// Replaces the specified properties of the specified rule. Any properties
  /// that you do not specify are unchanged.
  ///
  /// To add an item to a list, remove an item from a list, or update an item in
  /// a list, you must provide the entire list. For example, to add an action,
  /// specify a list with the current actions plus the new action.
  ///
  /// To modify the actions for the default rule, use <a>ModifyListener</a>.
  ///
  /// May throw [TargetGroupAssociationLimitException].
  /// May throw [IncompatibleProtocolsException].
  /// May throw [RuleNotFoundException].
  /// May throw [OperationNotPermittedException].
  /// May throw [TooManyRegistrationsForTargetIdException].
  /// May throw [TooManyTargetsException].
  /// May throw [TargetGroupNotFoundException].
  /// May throw [UnsupportedProtocolException].
  /// May throw [TooManyActionsException].
  /// May throw [InvalidLoadBalancerActionException].
  /// May throw [TooManyUniqueTargetGroupsPerLoadBalancerException].
  ///
  /// Parameter [ruleArn] :
  /// The Amazon Resource Name (ARN) of the rule.
  ///
  /// Parameter [actions] :
  /// The actions. Each rule must include exactly one of the following types of
  /// actions: <code>forward</code>, <code>fixed-response</code>, or
  /// <code>redirect</code>, and it must be the last action to be performed.
  ///
  /// If the action type is <code>forward</code>, you specify one or more target
  /// groups. The protocol of the target group must be HTTP or HTTPS for an
  /// Application Load Balancer. The protocol of the target group must be TCP,
  /// TLS, UDP, or TCP_UDP for a Network Load Balancer.
  ///
  /// [HTTPS listeners] If the action type is <code>authenticate-oidc</code>,
  /// you authenticate users through an identity provider that is OpenID Connect
  /// (OIDC) compliant.
  ///
  /// [HTTPS listeners] If the action type is <code>authenticate-cognito</code>,
  /// you authenticate users through the user pools supported by Amazon Cognito.
  ///
  /// [Application Load Balancer] If the action type is <code>redirect</code>,
  /// you redirect specified client requests from one URL to another.
  ///
  /// [Application Load Balancer] If the action type is
  /// <code>fixed-response</code>, you drop specified client requests and return
  /// a custom HTTP response.
  ///
  /// Parameter [conditions] :
  /// The conditions. Each rule can include zero or one of the following
  /// conditions: <code>http-request-method</code>, <code>host-header</code>,
  /// <code>path-pattern</code>, and <code>source-ip</code>, and zero or more of
  /// the following conditions: <code>http-header</code> and
  /// <code>query-string</code>.
  Future<ModifyRuleOutput> modifyRule({
    @_s.required String ruleArn,
    List<Action> actions,
    List<RuleCondition> conditions,
  }) async {
    ArgumentError.checkNotNull(ruleArn, 'ruleArn');
    final $request = <String, dynamic>{};
    $request['RuleArn'] = ruleArn;
    actions?.also((arg) => $request['Actions'] = arg);
    conditions?.also((arg) => $request['Conditions'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyRule',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyRuleInput'],
      shapes: shapes,
      resultWrapper: 'ModifyRuleResult',
    );
    return ModifyRuleOutput.fromXml($result);
  }

  /// Modifies the health checks used when evaluating the health state of the
  /// targets in the specified target group.
  ///
  /// To monitor the health of the targets, use <a>DescribeTargetHealth</a>.
  ///
  /// May throw [TargetGroupNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  ///
  /// Parameter [targetGroupArn] :
  /// The Amazon Resource Name (ARN) of the target group.
  ///
  /// Parameter [healthCheckEnabled] :
  /// Indicates whether health checks are enabled.
  ///
  /// Parameter [healthCheckIntervalSeconds] :
  /// The approximate amount of time, in seconds, between health checks of an
  /// individual target. For Application Load Balancers, the range is 5 to 300
  /// seconds. For Network Load Balancers, the supported values are 10 or 30
  /// seconds.
  ///
  /// With Network Load Balancers, you can't modify this setting.
  ///
  /// Parameter [healthCheckPath] :
  /// [HTTP/HTTPS health checks] The ping path that is the destination for the
  /// health check request.
  ///
  /// Parameter [healthCheckPort] :
  /// The port the load balancer uses when performing health checks on targets.
  ///
  /// Parameter [healthCheckProtocol] :
  /// The protocol the load balancer uses when performing health checks on
  /// targets. The TCP protocol is supported for health checks only if the
  /// protocol of the target group is TCP, TLS, UDP, or TCP_UDP. The TLS, UDP,
  /// and TCP_UDP protocols are not supported for health checks.
  ///
  /// With Network Load Balancers, you can't modify this setting.
  ///
  /// Parameter [healthCheckTimeoutSeconds] :
  /// [HTTP/HTTPS health checks] The amount of time, in seconds, during which no
  /// response means a failed health check.
  ///
  /// With Network Load Balancers, you can't modify this setting.
  ///
  /// Parameter [healthyThresholdCount] :
  /// The number of consecutive health checks successes required before
  /// considering an unhealthy target healthy.
  ///
  /// Parameter [matcher] :
  /// [HTTP/HTTPS health checks] The HTTP codes to use when checking for a
  /// successful response from a target.
  ///
  /// With Network Load Balancers, you can't modify this setting.
  ///
  /// Parameter [unhealthyThresholdCount] :
  /// The number of consecutive health check failures required before
  /// considering the target unhealthy. For Network Load Balancers, this value
  /// must be the same as the healthy threshold count.
  Future<ModifyTargetGroupOutput> modifyTargetGroup({
    @_s.required String targetGroupArn,
    bool healthCheckEnabled,
    int healthCheckIntervalSeconds,
    String healthCheckPath,
    String healthCheckPort,
    ProtocolEnum healthCheckProtocol,
    int healthCheckTimeoutSeconds,
    int healthyThresholdCount,
    Matcher matcher,
    int unhealthyThresholdCount,
  }) async {
    ArgumentError.checkNotNull(targetGroupArn, 'targetGroupArn');
    _s.validateNumRange(
      'healthCheckIntervalSeconds',
      healthCheckIntervalSeconds,
      5,
      300,
    );
    _s.validateStringLength(
      'healthCheckPath',
      healthCheckPath,
      1,
      1024,
    );
    _s.validateNumRange(
      'healthCheckTimeoutSeconds',
      healthCheckTimeoutSeconds,
      2,
      120,
    );
    _s.validateNumRange(
      'healthyThresholdCount',
      healthyThresholdCount,
      2,
      10,
    );
    _s.validateNumRange(
      'unhealthyThresholdCount',
      unhealthyThresholdCount,
      2,
      10,
    );
    final $request = <String, dynamic>{};
    $request['TargetGroupArn'] = targetGroupArn;
    healthCheckEnabled?.also((arg) => $request['HealthCheckEnabled'] = arg);
    healthCheckIntervalSeconds
        ?.also((arg) => $request['HealthCheckIntervalSeconds'] = arg);
    healthCheckPath?.also((arg) => $request['HealthCheckPath'] = arg);
    healthCheckPort?.also((arg) => $request['HealthCheckPort'] = arg);
    healthCheckProtocol
        ?.also((arg) => $request['HealthCheckProtocol'] = arg.toValue());
    healthCheckTimeoutSeconds
        ?.also((arg) => $request['HealthCheckTimeoutSeconds'] = arg);
    healthyThresholdCount
        ?.also((arg) => $request['HealthyThresholdCount'] = arg);
    matcher?.also((arg) => $request['Matcher'] = arg);
    unhealthyThresholdCount
        ?.also((arg) => $request['UnhealthyThresholdCount'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyTargetGroup',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyTargetGroupInput'],
      shapes: shapes,
      resultWrapper: 'ModifyTargetGroupResult',
    );
    return ModifyTargetGroupOutput.fromXml($result);
  }

  /// Modifies the specified attributes of the specified target group.
  ///
  /// May throw [TargetGroupNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  ///
  /// Parameter [attributes] :
  /// The attributes.
  ///
  /// Parameter [targetGroupArn] :
  /// The Amazon Resource Name (ARN) of the target group.
  Future<ModifyTargetGroupAttributesOutput> modifyTargetGroupAttributes({
    @_s.required List<TargetGroupAttribute> attributes,
    @_s.required String targetGroupArn,
  }) async {
    ArgumentError.checkNotNull(attributes, 'attributes');
    ArgumentError.checkNotNull(targetGroupArn, 'targetGroupArn');
    final $request = <String, dynamic>{};
    $request['Attributes'] = attributes;
    $request['TargetGroupArn'] = targetGroupArn;
    final $result = await _protocol.send(
      $request,
      action: 'ModifyTargetGroupAttributes',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyTargetGroupAttributesInput'],
      shapes: shapes,
      resultWrapper: 'ModifyTargetGroupAttributesResult',
    );
    return ModifyTargetGroupAttributesOutput.fromXml($result);
  }

  /// Registers the specified targets with the specified target group.
  ///
  /// If the target is an EC2 instance, it must be in the <code>running</code>
  /// state when you register it.
  ///
  /// By default, the load balancer routes requests to registered targets using
  /// the protocol and port for the target group. Alternatively, you can
  /// override the port for a target when you register it. You can register each
  /// EC2 instance or IP address with the same target group multiple times using
  /// different ports.
  ///
  /// With a Network Load Balancer, you cannot register instances by instance ID
  /// if they have the following instance types: C1, CC1, CC2, CG1, CG2, CR1,
  /// CS1, G1, G2, HI1, HS1, M1, M2, M3, and T1. You can register instances of
  /// these types by IP address.
  ///
  /// To remove a target from a target group, use <a>DeregisterTargets</a>.
  ///
  /// May throw [TargetGroupNotFoundException].
  /// May throw [TooManyTargetsException].
  /// May throw [InvalidTargetException].
  /// May throw [TooManyRegistrationsForTargetIdException].
  ///
  /// Parameter [targetGroupArn] :
  /// The Amazon Resource Name (ARN) of the target group.
  ///
  /// Parameter [targets] :
  /// The targets.
  ///
  /// To register a target by instance ID, specify the instance ID. To register
  /// a target by IP address, specify the IP address. To register a Lambda
  /// function, specify the ARN of the Lambda function.
  Future<void> registerTargets({
    @_s.required String targetGroupArn,
    @_s.required List<TargetDescription> targets,
  }) async {
    ArgumentError.checkNotNull(targetGroupArn, 'targetGroupArn');
    ArgumentError.checkNotNull(targets, 'targets');
    final $request = <String, dynamic>{};
    $request['TargetGroupArn'] = targetGroupArn;
    $request['Targets'] = targets;
    await _protocol.send(
      $request,
      action: 'RegisterTargets',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RegisterTargetsInput'],
      shapes: shapes,
      resultWrapper: 'RegisterTargetsResult',
    );
  }

  /// Removes the specified certificate from the certificate list for the
  /// specified HTTPS or TLS listener.
  ///
  /// You can't remove the default certificate for a listener. To replace the
  /// default certificate, call <a>ModifyListener</a>.
  ///
  /// To list the certificates for your listener, use
  /// <a>DescribeListenerCertificates</a>.
  ///
  /// May throw [ListenerNotFoundException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [certificates] :
  /// The certificate to remove. You can specify one certificate per call. Set
  /// <code>CertificateArn</code> to the certificate ARN but do not set
  /// <code>IsDefault</code>.
  ///
  /// Parameter [listenerArn] :
  /// The Amazon Resource Name (ARN) of the listener.
  Future<void> removeListenerCertificates({
    @_s.required List<Certificate> certificates,
    @_s.required String listenerArn,
  }) async {
    ArgumentError.checkNotNull(certificates, 'certificates');
    ArgumentError.checkNotNull(listenerArn, 'listenerArn');
    final $request = <String, dynamic>{};
    $request['Certificates'] = certificates;
    $request['ListenerArn'] = listenerArn;
    await _protocol.send(
      $request,
      action: 'RemoveListenerCertificates',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveListenerCertificatesInput'],
      shapes: shapes,
      resultWrapper: 'RemoveListenerCertificatesResult',
    );
  }

  /// Removes the specified tags from the specified Elastic Load Balancing
  /// resource.
  ///
  /// To list the current tags for your resources, use <a>DescribeTags</a>.
  ///
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [TargetGroupNotFoundException].
  /// May throw [ListenerNotFoundException].
  /// May throw [RuleNotFoundException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [resourceArns] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys for the tags to remove.
  Future<void> removeTags({
    @_s.required List<String> resourceArns,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArns, 'resourceArns');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $request = <String, dynamic>{};
    $request['ResourceArns'] = resourceArns;
    $request['TagKeys'] = tagKeys;
    await _protocol.send(
      $request,
      action: 'RemoveTags',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveTagsInput'],
      shapes: shapes,
      resultWrapper: 'RemoveTagsResult',
    );
  }

  /// Sets the type of IP addresses used by the subnets of the specified
  /// Application Load Balancer or Network Load Balancer.
  ///
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [InvalidSubnetException].
  ///
  /// Parameter [ipAddressType] :
  /// The IP address type. The possible values are <code>ipv4</code> (for IPv4
  /// addresses) and <code>dualstack</code> (for IPv4 and IPv6 addresses).
  /// Internal load balancers must use <code>ipv4</code>. Network Load Balancers
  /// must use <code>ipv4</code>.
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  Future<SetIpAddressTypeOutput> setIpAddressType({
    @_s.required IpAddressType ipAddressType,
    @_s.required String loadBalancerArn,
  }) async {
    ArgumentError.checkNotNull(ipAddressType, 'ipAddressType');
    ArgumentError.checkNotNull(loadBalancerArn, 'loadBalancerArn');
    final $request = <String, dynamic>{};
    $request['IpAddressType'] = ipAddressType.toValue();
    $request['LoadBalancerArn'] = loadBalancerArn;
    final $result = await _protocol.send(
      $request,
      action: 'SetIpAddressType',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetIpAddressTypeInput'],
      shapes: shapes,
      resultWrapper: 'SetIpAddressTypeResult',
    );
    return SetIpAddressTypeOutput.fromXml($result);
  }

  /// Sets the priorities of the specified rules.
  ///
  /// You can reorder the rules as long as there are no priority conflicts in
  /// the new order. Any existing rules that you do not specify retain their
  /// current priority.
  ///
  /// May throw [RuleNotFoundException].
  /// May throw [PriorityInUseException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [rulePriorities] :
  /// The rule priorities.
  Future<SetRulePrioritiesOutput> setRulePriorities({
    @_s.required List<RulePriorityPair> rulePriorities,
  }) async {
    ArgumentError.checkNotNull(rulePriorities, 'rulePriorities');
    final $request = <String, dynamic>{};
    $request['RulePriorities'] = rulePriorities;
    final $result = await _protocol.send(
      $request,
      action: 'SetRulePriorities',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetRulePrioritiesInput'],
      shapes: shapes,
      resultWrapper: 'SetRulePrioritiesResult',
    );
    return SetRulePrioritiesOutput.fromXml($result);
  }

  /// Associates the specified security groups with the specified Application
  /// Load Balancer. The specified security groups override the previously
  /// associated security groups.
  ///
  /// You can't specify a security group for a Network Load Balancer.
  ///
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [InvalidSecurityGroupException].
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// Parameter [securityGroups] :
  /// The IDs of the security groups.
  Future<SetSecurityGroupsOutput> setSecurityGroups({
    @_s.required String loadBalancerArn,
    @_s.required List<String> securityGroups,
  }) async {
    ArgumentError.checkNotNull(loadBalancerArn, 'loadBalancerArn');
    ArgumentError.checkNotNull(securityGroups, 'securityGroups');
    final $request = <String, dynamic>{};
    $request['LoadBalancerArn'] = loadBalancerArn;
    $request['SecurityGroups'] = securityGroups;
    final $result = await _protocol.send(
      $request,
      action: 'SetSecurityGroups',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetSecurityGroupsInput'],
      shapes: shapes,
      resultWrapper: 'SetSecurityGroupsResult',
    );
    return SetSecurityGroupsOutput.fromXml($result);
  }

  /// Enables the Availability Zones for the specified public subnets for the
  /// specified load balancer. The specified subnets replace the previously
  /// enabled subnets.
  ///
  /// When you specify subnets for a Network Load Balancer, you must include all
  /// subnets that were enabled previously, with their existing configurations,
  /// plus any additional subnets.
  ///
  /// May throw [LoadBalancerNotFoundException].
  /// May throw [InvalidConfigurationRequestException].
  /// May throw [SubnetNotFoundException].
  /// May throw [InvalidSubnetException].
  /// May throw [AllocationIdNotFoundException].
  /// May throw [AvailabilityZoneNotSupportedException].
  ///
  /// Parameter [loadBalancerArn] :
  /// The Amazon Resource Name (ARN) of the load balancer.
  ///
  /// Parameter [subnetMappings] :
  /// The IDs of the public subnets. You can specify only one subnet per
  /// Availability Zone. You must specify either subnets or subnet mappings.
  ///
  /// [Application Load Balancers] You must specify subnets from at least two
  /// Availability Zones. You cannot specify Elastic IP addresses for your
  /// subnets.
  ///
  /// [Network Load Balancers] You can specify subnets from one or more
  /// Availability Zones. If you need static IP addresses for your
  /// internet-facing load balancer, you can specify one Elastic IP address per
  /// subnet. For internal load balancers, you can specify one private IP
  /// address per subnet from the IPv4 range of the subnet.
  ///
  /// Parameter [subnets] :
  /// The IDs of the public subnets. You must specify subnets from at least two
  /// Availability Zones. You can specify only one subnet per Availability Zone.
  /// You must specify either subnets or subnet mappings.
  Future<SetSubnetsOutput> setSubnets({
    @_s.required String loadBalancerArn,
    List<SubnetMapping> subnetMappings,
    List<String> subnets,
  }) async {
    ArgumentError.checkNotNull(loadBalancerArn, 'loadBalancerArn');
    final $request = <String, dynamic>{};
    $request['LoadBalancerArn'] = loadBalancerArn;
    subnetMappings?.also((arg) => $request['SubnetMappings'] = arg);
    subnets?.also((arg) => $request['Subnets'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'SetSubnets',
      version: '2015-12-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetSubnetsInput'],
      shapes: shapes,
      resultWrapper: 'SetSubnetsResult',
    );
    return SetSubnetsOutput.fromXml($result);
  }
}

/// Information about an action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Action {
  /// The type of action.
  @_s.JsonKey(name: 'Type')
  final ActionTypeEnum type;

  /// [HTTPS listeners] Information for using Amazon Cognito to authenticate
  /// users. Specify only when <code>Type</code> is
  /// <code>authenticate-cognito</code>.
  @_s.JsonKey(name: 'AuthenticateCognitoConfig')
  final AuthenticateCognitoActionConfig authenticateCognitoConfig;

  /// [HTTPS listeners] Information about an identity provider that is compliant
  /// with OpenID Connect (OIDC). Specify only when <code>Type</code> is
  /// <code>authenticate-oidc</code>.
  @_s.JsonKey(name: 'AuthenticateOidcConfig')
  final AuthenticateOidcActionConfig authenticateOidcConfig;

  /// [Application Load Balancer] Information for creating an action that returns
  /// a custom HTTP response. Specify only when <code>Type</code> is
  /// <code>fixed-response</code>.
  @_s.JsonKey(name: 'FixedResponseConfig')
  final FixedResponseActionConfig fixedResponseConfig;

  /// Information for creating an action that distributes requests among one or
  /// more target groups. For Network Load Balancers, you can specify a single
  /// target group. Specify only when <code>Type</code> is <code>forward</code>.
  /// If you specify both <code>ForwardConfig</code> and
  /// <code>TargetGroupArn</code>, you can specify only one target group using
  /// <code>ForwardConfig</code> and it must be the same target group specified in
  /// <code>TargetGroupArn</code>.
  @_s.JsonKey(name: 'ForwardConfig')
  final ForwardActionConfig forwardConfig;

  /// The order for the action. This value is required for rules with multiple
  /// actions. The action with the lowest value for order is performed first. The
  /// last action to be performed must be one of the following types of actions: a
  /// <code>forward</code>, <code>fixed-response</code>, or <code>redirect</code>.
  @_s.JsonKey(name: 'Order')
  final int order;

  /// [Application Load Balancer] Information for creating a redirect action.
  /// Specify only when <code>Type</code> is <code>redirect</code>.
  @_s.JsonKey(name: 'RedirectConfig')
  final RedirectActionConfig redirectConfig;

  /// The Amazon Resource Name (ARN) of the target group. Specify only when
  /// <code>Type</code> is <code>forward</code> and you want to route to a single
  /// target group. To route to one or more target groups, use
  /// <code>ForwardConfig</code> instead.
  @_s.JsonKey(name: 'TargetGroupArn')
  final String targetGroupArn;

  Action({
    @_s.required this.type,
    this.authenticateCognitoConfig,
    this.authenticateOidcConfig,
    this.fixedResponseConfig,
    this.forwardConfig,
    this.order,
    this.redirectConfig,
    this.targetGroupArn,
  });
  factory Action.fromXml(_s.XmlElement elem) {
    return Action(
      type: _s.extractXmlStringValue(elem, 'Type')?.toActionTypeEnum(),
      authenticateCognitoConfig: _s
          .extractXmlChild(elem, 'AuthenticateCognitoConfig')
          ?.let((e) => AuthenticateCognitoActionConfig.fromXml(e)),
      authenticateOidcConfig: _s
          .extractXmlChild(elem, 'AuthenticateOidcConfig')
          ?.let((e) => AuthenticateOidcActionConfig.fromXml(e)),
      fixedResponseConfig: _s
          .extractXmlChild(elem, 'FixedResponseConfig')
          ?.let((e) => FixedResponseActionConfig.fromXml(e)),
      forwardConfig: _s
          .extractXmlChild(elem, 'ForwardConfig')
          ?.let((e) => ForwardActionConfig.fromXml(e)),
      order: _s.extractXmlIntValue(elem, 'Order'),
      redirectConfig: _s
          .extractXmlChild(elem, 'RedirectConfig')
          ?.let((e) => RedirectActionConfig.fromXml(e)),
      targetGroupArn: _s.extractXmlStringValue(elem, 'TargetGroupArn'),
    );
  }

  Map<String, dynamic> toJson() => _$ActionToJson(this);
}

enum ActionTypeEnum {
  @_s.JsonValue('forward')
  forward,
  @_s.JsonValue('authenticate-oidc')
  authenticateOidc,
  @_s.JsonValue('authenticate-cognito')
  authenticateCognito,
  @_s.JsonValue('redirect')
  redirect,
  @_s.JsonValue('fixed-response')
  fixedResponse,
}

extension on String {
  ActionTypeEnum toActionTypeEnum() {
    switch (this) {
      case 'forward':
        return ActionTypeEnum.forward;
      case 'authenticate-oidc':
        return ActionTypeEnum.authenticateOidc;
      case 'authenticate-cognito':
        return ActionTypeEnum.authenticateCognito;
      case 'redirect':
        return ActionTypeEnum.redirect;
      case 'fixed-response':
        return ActionTypeEnum.fixedResponse;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class AddListenerCertificatesOutput {
  /// Information about the certificates in the certificate list.
  final List<Certificate> certificates;

  AddListenerCertificatesOutput({
    this.certificates,
  });
  factory AddListenerCertificatesOutput.fromXml(_s.XmlElement elem) {
    return AddListenerCertificatesOutput(
      certificates: _s.extractXmlChild(elem, 'Certificates')?.let((elem) => elem
          .findElements('member')
          .map((c) => Certificate.fromXml(c))
          .toList()),
    );
  }
}

class AddTagsOutput {
  AddTagsOutput();
  factory AddTagsOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return AddTagsOutput();
  }
}

enum AuthenticateCognitoActionConditionalBehaviorEnum {
  @_s.JsonValue('deny')
  deny,
  @_s.JsonValue('allow')
  allow,
  @_s.JsonValue('authenticate')
  authenticate,
}

extension on String {
  AuthenticateCognitoActionConditionalBehaviorEnum
      toAuthenticateCognitoActionConditionalBehaviorEnum() {
    switch (this) {
      case 'deny':
        return AuthenticateCognitoActionConditionalBehaviorEnum.deny;
      case 'allow':
        return AuthenticateCognitoActionConditionalBehaviorEnum.allow;
      case 'authenticate':
        return AuthenticateCognitoActionConditionalBehaviorEnum.authenticate;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Request parameters to use when integrating with Amazon Cognito to
/// authenticate users.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AuthenticateCognitoActionConfig {
  /// The Amazon Resource Name (ARN) of the Amazon Cognito user pool.
  @_s.JsonKey(name: 'UserPoolArn')
  final String userPoolArn;

  /// The ID of the Amazon Cognito user pool client.
  @_s.JsonKey(name: 'UserPoolClientId')
  final String userPoolClientId;

  /// The domain prefix or fully-qualified domain name of the Amazon Cognito user
  /// pool.
  @_s.JsonKey(name: 'UserPoolDomain')
  final String userPoolDomain;

  /// The query parameters (up to 10) to include in the redirect request to the
  /// authorization endpoint.
  @_s.JsonKey(name: 'AuthenticationRequestExtraParams')
  final Map<String, String> authenticationRequestExtraParams;

  /// The behavior if the user is not authenticated. The following are possible
  /// values:
  ///
  /// <ul>
  /// <li>
  /// deny<code/> - Return an HTTP 401 Unauthorized error.
  /// </li>
  /// <li>
  /// allow<code/> - Allow the request to be forwarded to the target.
  /// </li>
  /// <li>
  /// authenticate<code/> - Redirect the request to the IdP authorization
  /// endpoint. This is the default value.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'OnUnauthenticatedRequest')
  final AuthenticateCognitoActionConditionalBehaviorEnum
      onUnauthenticatedRequest;

  /// The set of user claims to be requested from the IdP. The default is
  /// <code>openid</code>.
  ///
  /// To verify which scope values your IdP supports and how to separate multiple
  /// values, see the documentation for your IdP.
  @_s.JsonKey(name: 'Scope')
  final String scope;

  /// The name of the cookie used to maintain session information. The default is
  /// AWSELBAuthSessionCookie.
  @_s.JsonKey(name: 'SessionCookieName')
  final String sessionCookieName;

  /// The maximum duration of the authentication session, in seconds. The default
  /// is 604800 seconds (7 days).
  @_s.JsonKey(name: 'SessionTimeout')
  final int sessionTimeout;

  AuthenticateCognitoActionConfig({
    @_s.required this.userPoolArn,
    @_s.required this.userPoolClientId,
    @_s.required this.userPoolDomain,
    this.authenticationRequestExtraParams,
    this.onUnauthenticatedRequest,
    this.scope,
    this.sessionCookieName,
    this.sessionTimeout,
  });
  factory AuthenticateCognitoActionConfig.fromXml(_s.XmlElement elem) {
    return AuthenticateCognitoActionConfig(
      userPoolArn: _s.extractXmlStringValue(elem, 'UserPoolArn'),
      userPoolClientId: _s.extractXmlStringValue(elem, 'UserPoolClientId'),
      userPoolDomain: _s.extractXmlStringValue(elem, 'UserPoolDomain'),
      authenticationRequestExtraParams: Map.fromEntries(
        elem
            .getElement('AuthenticationRequestExtraParams')
            .findElements('entry')
            .map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'key'),
                _s.extractXmlStringValue(c, 'value'),
              ),
            ),
      ),
      onUnauthenticatedRequest: _s
          .extractXmlStringValue(elem, 'OnUnauthenticatedRequest')
          ?.toAuthenticateCognitoActionConditionalBehaviorEnum(),
      scope: _s.extractXmlStringValue(elem, 'Scope'),
      sessionCookieName: _s.extractXmlStringValue(elem, 'SessionCookieName'),
      sessionTimeout: _s.extractXmlIntValue(elem, 'SessionTimeout'),
    );
  }

  Map<String, dynamic> toJson() =>
      _$AuthenticateCognitoActionConfigToJson(this);
}

enum AuthenticateOidcActionConditionalBehaviorEnum {
  @_s.JsonValue('deny')
  deny,
  @_s.JsonValue('allow')
  allow,
  @_s.JsonValue('authenticate')
  authenticate,
}

extension on String {
  AuthenticateOidcActionConditionalBehaviorEnum
      toAuthenticateOidcActionConditionalBehaviorEnum() {
    switch (this) {
      case 'deny':
        return AuthenticateOidcActionConditionalBehaviorEnum.deny;
      case 'allow':
        return AuthenticateOidcActionConditionalBehaviorEnum.allow;
      case 'authenticate':
        return AuthenticateOidcActionConditionalBehaviorEnum.authenticate;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Request parameters when using an identity provider (IdP) that is compliant
/// with OpenID Connect (OIDC) to authenticate users.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AuthenticateOidcActionConfig {
  /// The authorization endpoint of the IdP. This must be a full URL, including
  /// the HTTPS protocol, the domain, and the path.
  @_s.JsonKey(name: 'AuthorizationEndpoint')
  final String authorizationEndpoint;

  /// The OAuth 2.0 client identifier.
  @_s.JsonKey(name: 'ClientId')
  final String clientId;

  /// The OIDC issuer identifier of the IdP. This must be a full URL, including
  /// the HTTPS protocol, the domain, and the path.
  @_s.JsonKey(name: 'Issuer')
  final String issuer;

  /// The token endpoint of the IdP. This must be a full URL, including the HTTPS
  /// protocol, the domain, and the path.
  @_s.JsonKey(name: 'TokenEndpoint')
  final String tokenEndpoint;

  /// The user info endpoint of the IdP. This must be a full URL, including the
  /// HTTPS protocol, the domain, and the path.
  @_s.JsonKey(name: 'UserInfoEndpoint')
  final String userInfoEndpoint;

  /// The query parameters (up to 10) to include in the redirect request to the
  /// authorization endpoint.
  @_s.JsonKey(name: 'AuthenticationRequestExtraParams')
  final Map<String, String> authenticationRequestExtraParams;

  /// The OAuth 2.0 client secret. This parameter is required if you are creating
  /// a rule. If you are modifying a rule, you can omit this parameter if you set
  /// <code>UseExistingClientSecret</code> to true.
  @_s.JsonKey(name: 'ClientSecret')
  final String clientSecret;

  /// The behavior if the user is not authenticated. The following are possible
  /// values:
  ///
  /// <ul>
  /// <li>
  /// deny<code/> - Return an HTTP 401 Unauthorized error.
  /// </li>
  /// <li>
  /// allow<code/> - Allow the request to be forwarded to the target.
  /// </li>
  /// <li>
  /// authenticate<code/> - Redirect the request to the IdP authorization
  /// endpoint. This is the default value.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'OnUnauthenticatedRequest')
  final AuthenticateOidcActionConditionalBehaviorEnum onUnauthenticatedRequest;

  /// The set of user claims to be requested from the IdP. The default is
  /// <code>openid</code>.
  ///
  /// To verify which scope values your IdP supports and how to separate multiple
  /// values, see the documentation for your IdP.
  @_s.JsonKey(name: 'Scope')
  final String scope;

  /// The name of the cookie used to maintain session information. The default is
  /// AWSELBAuthSessionCookie.
  @_s.JsonKey(name: 'SessionCookieName')
  final String sessionCookieName;

  /// The maximum duration of the authentication session, in seconds. The default
  /// is 604800 seconds (7 days).
  @_s.JsonKey(name: 'SessionTimeout')
  final int sessionTimeout;

  /// Indicates whether to use the existing client secret when modifying a rule.
  /// If you are creating a rule, you can omit this parameter or set it to false.
  @_s.JsonKey(name: 'UseExistingClientSecret')
  final bool useExistingClientSecret;

  AuthenticateOidcActionConfig({
    @_s.required this.authorizationEndpoint,
    @_s.required this.clientId,
    @_s.required this.issuer,
    @_s.required this.tokenEndpoint,
    @_s.required this.userInfoEndpoint,
    this.authenticationRequestExtraParams,
    this.clientSecret,
    this.onUnauthenticatedRequest,
    this.scope,
    this.sessionCookieName,
    this.sessionTimeout,
    this.useExistingClientSecret,
  });
  factory AuthenticateOidcActionConfig.fromXml(_s.XmlElement elem) {
    return AuthenticateOidcActionConfig(
      authorizationEndpoint:
          _s.extractXmlStringValue(elem, 'AuthorizationEndpoint'),
      clientId: _s.extractXmlStringValue(elem, 'ClientId'),
      issuer: _s.extractXmlStringValue(elem, 'Issuer'),
      tokenEndpoint: _s.extractXmlStringValue(elem, 'TokenEndpoint'),
      userInfoEndpoint: _s.extractXmlStringValue(elem, 'UserInfoEndpoint'),
      authenticationRequestExtraParams: Map.fromEntries(
        elem
            .getElement('AuthenticationRequestExtraParams')
            .findElements('entry')
            .map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'key'),
                _s.extractXmlStringValue(c, 'value'),
              ),
            ),
      ),
      clientSecret: _s.extractXmlStringValue(elem, 'ClientSecret'),
      onUnauthenticatedRequest: _s
          .extractXmlStringValue(elem, 'OnUnauthenticatedRequest')
          ?.toAuthenticateOidcActionConditionalBehaviorEnum(),
      scope: _s.extractXmlStringValue(elem, 'Scope'),
      sessionCookieName: _s.extractXmlStringValue(elem, 'SessionCookieName'),
      sessionTimeout: _s.extractXmlIntValue(elem, 'SessionTimeout'),
      useExistingClientSecret:
          _s.extractXmlBoolValue(elem, 'UseExistingClientSecret'),
    );
  }

  Map<String, dynamic> toJson() => _$AuthenticateOidcActionConfigToJson(this);
}

/// Information about an Availability Zone.
class AvailabilityZone {
  /// [Network Load Balancers] If you need static IP addresses for your load
  /// balancer, you can specify one Elastic IP address per Availability Zone when
  /// you create an internal-facing load balancer. For internal load balancers,
  /// you can specify a private IP address from the IPv4 range of the subnet.
  final List<LoadBalancerAddress> loadBalancerAddresses;

  /// The ID of the subnet. You can specify one subnet per Availability Zone.
  final String subnetId;

  /// The name of the Availability Zone.
  final String zoneName;

  AvailabilityZone({
    this.loadBalancerAddresses,
    this.subnetId,
    this.zoneName,
  });
  factory AvailabilityZone.fromXml(_s.XmlElement elem) {
    return AvailabilityZone(
      loadBalancerAddresses: _s
          .extractXmlChild(elem, 'LoadBalancerAddresses')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => LoadBalancerAddress.fromXml(c))
              .toList()),
      subnetId: _s.extractXmlStringValue(elem, 'SubnetId'),
      zoneName: _s.extractXmlStringValue(elem, 'ZoneName'),
    );
  }
}

/// Information about an SSL server certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Certificate {
  /// The Amazon Resource Name (ARN) of the certificate.
  @_s.JsonKey(name: 'CertificateArn')
  final String certificateArn;

  /// Indicates whether the certificate is the default certificate. Do not set
  /// this value when specifying a certificate as an input. This value is not
  /// included in the output when describing a listener, but is included when
  /// describing listener certificates.
  @_s.JsonKey(name: 'IsDefault')
  final bool isDefault;

  Certificate({
    this.certificateArn,
    this.isDefault,
  });
  factory Certificate.fromXml(_s.XmlElement elem) {
    return Certificate(
      certificateArn: _s.extractXmlStringValue(elem, 'CertificateArn'),
      isDefault: _s.extractXmlBoolValue(elem, 'IsDefault'),
    );
  }

  Map<String, dynamic> toJson() => _$CertificateToJson(this);
}

/// Information about a cipher used in a policy.
class Cipher {
  /// The name of the cipher.
  final String name;

  /// The priority of the cipher.
  final int priority;

  Cipher({
    this.name,
    this.priority,
  });
  factory Cipher.fromXml(_s.XmlElement elem) {
    return Cipher(
      name: _s.extractXmlStringValue(elem, 'Name'),
      priority: _s.extractXmlIntValue(elem, 'Priority'),
    );
  }
}

class CreateListenerOutput {
  /// Information about the listener.
  final List<Listener> listeners;

  CreateListenerOutput({
    this.listeners,
  });
  factory CreateListenerOutput.fromXml(_s.XmlElement elem) {
    return CreateListenerOutput(
      listeners: _s.extractXmlChild(elem, 'Listeners')?.let((elem) =>
          elem.findElements('member').map((c) => Listener.fromXml(c)).toList()),
    );
  }
}

class CreateLoadBalancerOutput {
  /// Information about the load balancer.
  final List<LoadBalancer> loadBalancers;

  CreateLoadBalancerOutput({
    this.loadBalancers,
  });
  factory CreateLoadBalancerOutput.fromXml(_s.XmlElement elem) {
    return CreateLoadBalancerOutput(
      loadBalancers: _s.extractXmlChild(elem, 'LoadBalancers')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => LoadBalancer.fromXml(c))
              .toList()),
    );
  }
}

class CreateRuleOutput {
  /// Information about the rule.
  final List<Rule> rules;

  CreateRuleOutput({
    this.rules,
  });
  factory CreateRuleOutput.fromXml(_s.XmlElement elem) {
    return CreateRuleOutput(
      rules: _s.extractXmlChild(elem, 'Rules')?.let((elem) =>
          elem.findElements('member').map((c) => Rule.fromXml(c)).toList()),
    );
  }
}

class CreateTargetGroupOutput {
  /// Information about the target group.
  final List<TargetGroup> targetGroups;

  CreateTargetGroupOutput({
    this.targetGroups,
  });
  factory CreateTargetGroupOutput.fromXml(_s.XmlElement elem) {
    return CreateTargetGroupOutput(
      targetGroups: _s.extractXmlChild(elem, 'TargetGroups')?.let((elem) => elem
          .findElements('member')
          .map((c) => TargetGroup.fromXml(c))
          .toList()),
    );
  }
}

class DeleteListenerOutput {
  DeleteListenerOutput();
  factory DeleteListenerOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteListenerOutput();
  }
}

class DeleteLoadBalancerOutput {
  DeleteLoadBalancerOutput();
  factory DeleteLoadBalancerOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteLoadBalancerOutput();
  }
}

class DeleteRuleOutput {
  DeleteRuleOutput();
  factory DeleteRuleOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteRuleOutput();
  }
}

class DeleteTargetGroupOutput {
  DeleteTargetGroupOutput();
  factory DeleteTargetGroupOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteTargetGroupOutput();
  }
}

class DeregisterTargetsOutput {
  DeregisterTargetsOutput();
  factory DeregisterTargetsOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeregisterTargetsOutput();
  }
}

class DescribeAccountLimitsOutput {
  /// Information about the limits.
  final List<Limit> limits;

  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String nextMarker;

  DescribeAccountLimitsOutput({
    this.limits,
    this.nextMarker,
  });
  factory DescribeAccountLimitsOutput.fromXml(_s.XmlElement elem) {
    return DescribeAccountLimitsOutput(
      limits: _s.extractXmlChild(elem, 'Limits')?.let((elem) =>
          elem.findElements('member').map((c) => Limit.fromXml(c)).toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }
}

class DescribeListenerCertificatesOutput {
  /// Information about the certificates.
  final List<Certificate> certificates;

  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String nextMarker;

  DescribeListenerCertificatesOutput({
    this.certificates,
    this.nextMarker,
  });
  factory DescribeListenerCertificatesOutput.fromXml(_s.XmlElement elem) {
    return DescribeListenerCertificatesOutput(
      certificates: _s.extractXmlChild(elem, 'Certificates')?.let((elem) => elem
          .findElements('member')
          .map((c) => Certificate.fromXml(c))
          .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }
}

class DescribeListenersOutput {
  /// Information about the listeners.
  final List<Listener> listeners;

  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String nextMarker;

  DescribeListenersOutput({
    this.listeners,
    this.nextMarker,
  });
  factory DescribeListenersOutput.fromXml(_s.XmlElement elem) {
    return DescribeListenersOutput(
      listeners: _s.extractXmlChild(elem, 'Listeners')?.let((elem) =>
          elem.findElements('member').map((c) => Listener.fromXml(c)).toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }
}

class DescribeLoadBalancerAttributesOutput {
  /// Information about the load balancer attributes.
  final List<LoadBalancerAttribute> attributes;

  DescribeLoadBalancerAttributesOutput({
    this.attributes,
  });
  factory DescribeLoadBalancerAttributesOutput.fromXml(_s.XmlElement elem) {
    return DescribeLoadBalancerAttributesOutput(
      attributes: _s.extractXmlChild(elem, 'Attributes')?.let((elem) => elem
          .findElements('member')
          .map((c) => LoadBalancerAttribute.fromXml(c))
          .toList()),
    );
  }
}

class DescribeLoadBalancersOutput {
  /// Information about the load balancers.
  final List<LoadBalancer> loadBalancers;

  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String nextMarker;

  DescribeLoadBalancersOutput({
    this.loadBalancers,
    this.nextMarker,
  });
  factory DescribeLoadBalancersOutput.fromXml(_s.XmlElement elem) {
    return DescribeLoadBalancersOutput(
      loadBalancers: _s.extractXmlChild(elem, 'LoadBalancers')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => LoadBalancer.fromXml(c))
              .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }
}

class DescribeRulesOutput {
  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String nextMarker;

  /// Information about the rules.
  final List<Rule> rules;

  DescribeRulesOutput({
    this.nextMarker,
    this.rules,
  });
  factory DescribeRulesOutput.fromXml(_s.XmlElement elem) {
    return DescribeRulesOutput(
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
      rules: _s.extractXmlChild(elem, 'Rules')?.let((elem) =>
          elem.findElements('member').map((c) => Rule.fromXml(c)).toList()),
    );
  }
}

class DescribeSSLPoliciesOutput {
  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String nextMarker;

  /// Information about the security policies.
  final List<SslPolicy> sslPolicies;

  DescribeSSLPoliciesOutput({
    this.nextMarker,
    this.sslPolicies,
  });
  factory DescribeSSLPoliciesOutput.fromXml(_s.XmlElement elem) {
    return DescribeSSLPoliciesOutput(
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
      sslPolicies: _s.extractXmlChild(elem, 'SslPolicies')?.let((elem) => elem
          .findElements('member')
          .map((c) => SslPolicy.fromXml(c))
          .toList()),
    );
  }
}

class DescribeTagsOutput {
  /// Information about the tags.
  final List<TagDescription> tagDescriptions;

  DescribeTagsOutput({
    this.tagDescriptions,
  });
  factory DescribeTagsOutput.fromXml(_s.XmlElement elem) {
    return DescribeTagsOutput(
      tagDescriptions: _s.extractXmlChild(elem, 'TagDescriptions')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => TagDescription.fromXml(c))
              .toList()),
    );
  }
}

class DescribeTargetGroupAttributesOutput {
  /// Information about the target group attributes
  final List<TargetGroupAttribute> attributes;

  DescribeTargetGroupAttributesOutput({
    this.attributes,
  });
  factory DescribeTargetGroupAttributesOutput.fromXml(_s.XmlElement elem) {
    return DescribeTargetGroupAttributesOutput(
      attributes: _s.extractXmlChild(elem, 'Attributes')?.let((elem) => elem
          .findElements('member')
          .map((c) => TargetGroupAttribute.fromXml(c))
          .toList()),
    );
  }
}

class DescribeTargetGroupsOutput {
  /// If there are additional results, this is the marker for the next set of
  /// results. Otherwise, this is null.
  final String nextMarker;

  /// Information about the target groups.
  final List<TargetGroup> targetGroups;

  DescribeTargetGroupsOutput({
    this.nextMarker,
    this.targetGroups,
  });
  factory DescribeTargetGroupsOutput.fromXml(_s.XmlElement elem) {
    return DescribeTargetGroupsOutput(
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
      targetGroups: _s.extractXmlChild(elem, 'TargetGroups')?.let((elem) => elem
          .findElements('member')
          .map((c) => TargetGroup.fromXml(c))
          .toList()),
    );
  }
}

class DescribeTargetHealthOutput {
  /// Information about the health of the targets.
  final List<TargetHealthDescription> targetHealthDescriptions;

  DescribeTargetHealthOutput({
    this.targetHealthDescriptions,
  });
  factory DescribeTargetHealthOutput.fromXml(_s.XmlElement elem) {
    return DescribeTargetHealthOutput(
      targetHealthDescriptions: _s
          .extractXmlChild(elem, 'TargetHealthDescriptions')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => TargetHealthDescription.fromXml(c))
              .toList()),
    );
  }
}

/// Information about an action that returns a custom HTTP response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class FixedResponseActionConfig {
  /// The HTTP response code (2XX, 4XX, or 5XX).
  @_s.JsonKey(name: 'StatusCode')
  final String statusCode;

  /// The content type.
  ///
  /// Valid Values: text/plain | text/css | text/html | application/javascript |
  /// application/json
  @_s.JsonKey(name: 'ContentType')
  final String contentType;

  /// The message.
  @_s.JsonKey(name: 'MessageBody')
  final String messageBody;

  FixedResponseActionConfig({
    @_s.required this.statusCode,
    this.contentType,
    this.messageBody,
  });
  factory FixedResponseActionConfig.fromXml(_s.XmlElement elem) {
    return FixedResponseActionConfig(
      statusCode: _s.extractXmlStringValue(elem, 'StatusCode'),
      contentType: _s.extractXmlStringValue(elem, 'ContentType'),
      messageBody: _s.extractXmlStringValue(elem, 'MessageBody'),
    );
  }

  Map<String, dynamic> toJson() => _$FixedResponseActionConfigToJson(this);
}

/// Information about a forward action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ForwardActionConfig {
  /// The target group stickiness for the rule.
  @_s.JsonKey(name: 'TargetGroupStickinessConfig')
  final TargetGroupStickinessConfig targetGroupStickinessConfig;

  /// One or more target groups. For Network Load Balancers, you can specify a
  /// single target group.
  @_s.JsonKey(name: 'TargetGroups')
  final List<TargetGroupTuple> targetGroups;

  ForwardActionConfig({
    this.targetGroupStickinessConfig,
    this.targetGroups,
  });
  factory ForwardActionConfig.fromXml(_s.XmlElement elem) {
    return ForwardActionConfig(
      targetGroupStickinessConfig: _s
          .extractXmlChild(elem, 'TargetGroupStickinessConfig')
          ?.let((e) => TargetGroupStickinessConfig.fromXml(e)),
      targetGroups: _s.extractXmlChild(elem, 'TargetGroups')?.let((elem) => elem
          .findElements('member')
          .map((c) => TargetGroupTuple.fromXml(c))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() => _$ForwardActionConfigToJson(this);
}

/// Information about a host header condition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HostHeaderConditionConfig {
  /// One or more host names. The maximum size of each name is 128 characters. The
  /// comparison is case insensitive. The following wildcard characters are
  /// supported: * (matches 0 or more characters) and ? (matches exactly 1
  /// character).
  ///
  /// If you specify multiple strings, the condition is satisfied if one of the
  /// strings matches the host name.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  HostHeaderConditionConfig({
    this.values,
  });
  factory HostHeaderConditionConfig.fromXml(_s.XmlElement elem) {
    return HostHeaderConditionConfig(
      values: _s
          .extractXmlChild(elem, 'Values')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() => _$HostHeaderConditionConfigToJson(this);
}

/// Information about an HTTP header condition.
///
/// There is a set of standard HTTP header fields. You can also define custom
/// HTTP header fields.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HttpHeaderConditionConfig {
  /// The name of the HTTP header field. The maximum size is 40 characters. The
  /// header name is case insensitive. The allowed characters are specified by RFC
  /// 7230. Wildcards are not supported.
  ///
  /// You can't use an HTTP header condition to specify the host header. Use
  /// <a>HostHeaderConditionConfig</a> to specify a host header condition.
  @_s.JsonKey(name: 'HttpHeaderName')
  final String httpHeaderName;

  /// One or more strings to compare against the value of the HTTP header. The
  /// maximum size of each string is 128 characters. The comparison strings are
  /// case insensitive. The following wildcard characters are supported: *
  /// (matches 0 or more characters) and ? (matches exactly 1 character).
  ///
  /// If the same header appears multiple times in the request, we search them in
  /// order until a match is found.
  ///
  /// If you specify multiple strings, the condition is satisfied if one of the
  /// strings matches the value of the HTTP header. To require that all of the
  /// strings are a match, create one condition per string.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  HttpHeaderConditionConfig({
    this.httpHeaderName,
    this.values,
  });
  factory HttpHeaderConditionConfig.fromXml(_s.XmlElement elem) {
    return HttpHeaderConditionConfig(
      httpHeaderName: _s.extractXmlStringValue(elem, 'HttpHeaderName'),
      values: _s
          .extractXmlChild(elem, 'Values')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() => _$HttpHeaderConditionConfigToJson(this);
}

/// Information about an HTTP method condition.
///
/// HTTP defines a set of request methods, also referred to as HTTP verbs. For
/// more information, see the <a
/// href="https://www.iana.org/assignments/http-methods/http-methods.xhtml">HTTP
/// Method Registry</a>. You can also define custom HTTP methods.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HttpRequestMethodConditionConfig {
  /// The name of the request method. The maximum size is 40 characters. The
  /// allowed characters are A-Z, hyphen (-), and underscore (_). The comparison
  /// is case sensitive. Wildcards are not supported; therefore, the method name
  /// must be an exact match.
  ///
  /// If you specify multiple strings, the condition is satisfied if one of the
  /// strings matches the HTTP request method. We recommend that you route GET and
  /// HEAD requests in the same way, because the response to a HEAD request may be
  /// cached.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  HttpRequestMethodConditionConfig({
    this.values,
  });
  factory HttpRequestMethodConditionConfig.fromXml(_s.XmlElement elem) {
    return HttpRequestMethodConditionConfig(
      values: _s
          .extractXmlChild(elem, 'Values')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() =>
      _$HttpRequestMethodConditionConfigToJson(this);
}

enum IpAddressType {
  @_s.JsonValue('ipv4')
  ipv4,
  @_s.JsonValue('dualstack')
  dualstack,
}

extension on IpAddressType {
  String toValue() {
    switch (this) {
      case IpAddressType.ipv4:
        return 'ipv4';
      case IpAddressType.dualstack:
        return 'dualstack';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  IpAddressType toIpAddressType() {
    switch (this) {
      case 'ipv4':
        return IpAddressType.ipv4;
      case 'dualstack':
        return IpAddressType.dualstack;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about an Elastic Load Balancing resource limit for your AWS
/// account.
class Limit {
  /// The maximum value of the limit.
  final String max;

  /// The name of the limit. The possible values are:
  ///
  /// <ul>
  /// <li>
  /// application-load-balancers
  /// </li>
  /// <li>
  /// listeners-per-application-load-balancer
  /// </li>
  /// <li>
  /// listeners-per-network-load-balancer
  /// </li>
  /// <li>
  /// network-load-balancers
  /// </li>
  /// <li>
  /// rules-per-application-load-balancer
  /// </li>
  /// <li>
  /// target-groups
  /// </li>
  /// <li>
  /// target-groups-per-action-on-application-load-balancer
  /// </li>
  /// <li>
  /// target-groups-per-action-on-network-load-balancer
  /// </li>
  /// <li>
  /// target-groups-per-application-load-balancer
  /// </li>
  /// <li>
  /// targets-per-application-load-balancer
  /// </li>
  /// <li>
  /// targets-per-availability-zone-per-network-load-balancer
  /// </li>
  /// <li>
  /// targets-per-network-load-balancer
  /// </li>
  /// </ul>
  final String name;

  Limit({
    this.max,
    this.name,
  });
  factory Limit.fromXml(_s.XmlElement elem) {
    return Limit(
      max: _s.extractXmlStringValue(elem, 'Max'),
      name: _s.extractXmlStringValue(elem, 'Name'),
    );
  }
}

/// Information about a listener.
class Listener {
  /// [HTTPS or TLS listener] The default certificate for the listener.
  final List<Certificate> certificates;

  /// The default actions for the listener.
  final List<Action> defaultActions;

  /// The Amazon Resource Name (ARN) of the listener.
  final String listenerArn;

  /// The Amazon Resource Name (ARN) of the load balancer.
  final String loadBalancerArn;

  /// The port on which the load balancer is listening.
  final int port;

  /// The protocol for connections from clients to the load balancer.
  final ProtocolEnum protocol;

  /// [HTTPS or TLS listener] The security policy that defines which protocols and
  /// ciphers are supported.
  final String sslPolicy;

  Listener({
    this.certificates,
    this.defaultActions,
    this.listenerArn,
    this.loadBalancerArn,
    this.port,
    this.protocol,
    this.sslPolicy,
  });
  factory Listener.fromXml(_s.XmlElement elem) {
    return Listener(
      certificates: _s.extractXmlChild(elem, 'Certificates')?.let((elem) => elem
          .findElements('member')
          .map((c) => Certificate.fromXml(c))
          .toList()),
      defaultActions: _s.extractXmlChild(elem, 'DefaultActions')?.let((elem) =>
          elem.findElements('member').map((c) => Action.fromXml(c)).toList()),
      listenerArn: _s.extractXmlStringValue(elem, 'ListenerArn'),
      loadBalancerArn: _s.extractXmlStringValue(elem, 'LoadBalancerArn'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      protocol: _s.extractXmlStringValue(elem, 'Protocol')?.toProtocolEnum(),
      sslPolicy: _s.extractXmlStringValue(elem, 'SslPolicy'),
    );
  }
}

/// Information about a load balancer.
class LoadBalancer {
  /// The Availability Zones for the load balancer.
  final List<AvailabilityZone> availabilityZones;

  /// The ID of the Amazon Route 53 hosted zone associated with the load balancer.
  final String canonicalHostedZoneId;

  /// The date and time the load balancer was created.
  final DateTime createdTime;

  /// The public DNS name of the load balancer.
  final String dNSName;

  /// The type of IP addresses used by the subnets for your load balancer. The
  /// possible values are <code>ipv4</code> (for IPv4 addresses) and
  /// <code>dualstack</code> (for IPv4 and IPv6 addresses).
  final IpAddressType ipAddressType;

  /// The Amazon Resource Name (ARN) of the load balancer.
  final String loadBalancerArn;

  /// The name of the load balancer.
  final String loadBalancerName;

  /// The nodes of an Internet-facing load balancer have public IP addresses. The
  /// DNS name of an Internet-facing load balancer is publicly resolvable to the
  /// public IP addresses of the nodes. Therefore, Internet-facing load balancers
  /// can route requests from clients over the internet.
  ///
  /// The nodes of an internal load balancer have only private IP addresses. The
  /// DNS name of an internal load balancer is publicly resolvable to the private
  /// IP addresses of the nodes. Therefore, internal load balancers can route
  /// requests only from clients with access to the VPC for the load balancer.
  final LoadBalancerSchemeEnum scheme;

  /// The IDs of the security groups for the load balancer.
  final List<String> securityGroups;

  /// The state of the load balancer.
  final LoadBalancerState state;

  /// The type of load balancer.
  final LoadBalancerTypeEnum type;

  /// The ID of the VPC for the load balancer.
  final String vpcId;

  LoadBalancer({
    this.availabilityZones,
    this.canonicalHostedZoneId,
    this.createdTime,
    this.dNSName,
    this.ipAddressType,
    this.loadBalancerArn,
    this.loadBalancerName,
    this.scheme,
    this.securityGroups,
    this.state,
    this.type,
    this.vpcId,
  });
  factory LoadBalancer.fromXml(_s.XmlElement elem) {
    return LoadBalancer(
      availabilityZones: _s.extractXmlChild(elem, 'AvailabilityZones')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => AvailabilityZone.fromXml(c))
              .toList()),
      canonicalHostedZoneId:
          _s.extractXmlStringValue(elem, 'CanonicalHostedZoneId'),
      createdTime: _s.extractXmlDateTimeValue(elem, 'CreatedTime'),
      dNSName: _s.extractXmlStringValue(elem, 'DNSName'),
      ipAddressType:
          _s.extractXmlStringValue(elem, 'IpAddressType')?.toIpAddressType(),
      loadBalancerArn: _s.extractXmlStringValue(elem, 'LoadBalancerArn'),
      loadBalancerName: _s.extractXmlStringValue(elem, 'LoadBalancerName'),
      scheme:
          _s.extractXmlStringValue(elem, 'Scheme')?.toLoadBalancerSchemeEnum(),
      securityGroups: _s
          .extractXmlChild(elem, 'SecurityGroups')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      state: _s
          .extractXmlChild(elem, 'State')
          ?.let((e) => LoadBalancerState.fromXml(e)),
      type: _s.extractXmlStringValue(elem, 'Type')?.toLoadBalancerTypeEnum(),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

/// Information about a static IP address for a load balancer.
class LoadBalancerAddress {
  /// [Network Load Balancers] The allocation ID of the Elastic IP address for an
  /// internal-facing load balancer.
  final String allocationId;

  /// The static IP address.
  final String ipAddress;

  /// [Network Load Balancers] The private IPv4 address for an internal load
  /// balancer.
  final String privateIPv4Address;

  LoadBalancerAddress({
    this.allocationId,
    this.ipAddress,
    this.privateIPv4Address,
  });
  factory LoadBalancerAddress.fromXml(_s.XmlElement elem) {
    return LoadBalancerAddress(
      allocationId: _s.extractXmlStringValue(elem, 'AllocationId'),
      ipAddress: _s.extractXmlStringValue(elem, 'IpAddress'),
      privateIPv4Address: _s.extractXmlStringValue(elem, 'PrivateIPv4Address'),
    );
  }
}

/// Information about a load balancer attribute.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LoadBalancerAttribute {
  /// The name of the attribute.
  ///
  /// The following attributes are supported by both Application Load Balancers
  /// and Network Load Balancers:
  ///
  /// <ul>
  /// <li>
  /// <code>access_logs.s3.enabled</code> - Indicates whether access logs are
  /// enabled. The value is <code>true</code> or <code>false</code>. The default
  /// is <code>false</code>.
  /// </li>
  /// <li>
  /// <code>access_logs.s3.bucket</code> - The name of the S3 bucket for the
  /// access logs. This attribute is required if access logs are enabled. The
  /// bucket must exist in the same region as the load balancer and have a bucket
  /// policy that grants Elastic Load Balancing permissions to write to the
  /// bucket.
  /// </li>
  /// <li>
  /// <code>access_logs.s3.prefix</code> - The prefix for the location in the S3
  /// bucket for the access logs.
  /// </li>
  /// <li>
  /// <code>deletion_protection.enabled</code> - Indicates whether deletion
  /// protection is enabled. The value is <code>true</code> or <code>false</code>.
  /// The default is <code>false</code>.
  /// </li>
  /// </ul>
  /// The following attributes are supported by only Application Load Balancers:
  ///
  /// <ul>
  /// <li>
  /// <code>idle_timeout.timeout_seconds</code> - The idle timeout value, in
  /// seconds. The valid range is 1-4000 seconds. The default is 60 seconds.
  /// </li>
  /// <li>
  /// <code>routing.http.drop_invalid_header_fields.enabled</code> - Indicates
  /// whether HTTP headers with invalid header fields are removed by the load
  /// balancer (<code>true</code>) or routed to targets (<code>false</code>). The
  /// default is <code>false</code>.
  /// </li>
  /// <li>
  /// <code>routing.http2.enabled</code> - Indicates whether HTTP/2 is enabled.
  /// The value is <code>true</code> or <code>false</code>. The default is
  /// <code>true</code>. Elastic Load Balancing requires that message header names
  /// contain only alphanumeric characters and hyphens.
  /// </li>
  /// </ul>
  /// The following attributes are supported by only Network Load Balancers:
  ///
  /// <ul>
  /// <li>
  /// <code>load_balancing.cross_zone.enabled</code> - Indicates whether
  /// cross-zone load balancing is enabled. The value is <code>true</code> or
  /// <code>false</code>. The default is <code>false</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the attribute.
  @_s.JsonKey(name: 'Value')
  final String value;

  LoadBalancerAttribute({
    this.key,
    this.value,
  });
  factory LoadBalancerAttribute.fromXml(_s.XmlElement elem) {
    return LoadBalancerAttribute(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() => _$LoadBalancerAttributeToJson(this);
}

enum LoadBalancerSchemeEnum {
  @_s.JsonValue('internet-facing')
  internetFacing,
  @_s.JsonValue('internal')
  internal,
}

extension on LoadBalancerSchemeEnum {
  String toValue() {
    switch (this) {
      case LoadBalancerSchemeEnum.internetFacing:
        return 'internet-facing';
      case LoadBalancerSchemeEnum.internal:
        return 'internal';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  LoadBalancerSchemeEnum toLoadBalancerSchemeEnum() {
    switch (this) {
      case 'internet-facing':
        return LoadBalancerSchemeEnum.internetFacing;
      case 'internal':
        return LoadBalancerSchemeEnum.internal;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about the state of the load balancer.
class LoadBalancerState {
  /// The state code. The initial state of the load balancer is
  /// <code>provisioning</code>. After the load balancer is fully set up and ready
  /// to route traffic, its state is <code>active</code>. If the load balancer
  /// could not be set up, its state is <code>failed</code>.
  final LoadBalancerStateEnum code;

  /// A description of the state.
  final String reason;

  LoadBalancerState({
    this.code,
    this.reason,
  });
  factory LoadBalancerState.fromXml(_s.XmlElement elem) {
    return LoadBalancerState(
      code: _s.extractXmlStringValue(elem, 'Code')?.toLoadBalancerStateEnum(),
      reason: _s.extractXmlStringValue(elem, 'Reason'),
    );
  }
}

enum LoadBalancerStateEnum {
  @_s.JsonValue('active')
  active,
  @_s.JsonValue('provisioning')
  provisioning,
  @_s.JsonValue('active_impaired')
  activeImpaired,
  @_s.JsonValue('failed')
  failed,
}

extension on String {
  LoadBalancerStateEnum toLoadBalancerStateEnum() {
    switch (this) {
      case 'active':
        return LoadBalancerStateEnum.active;
      case 'provisioning':
        return LoadBalancerStateEnum.provisioning;
      case 'active_impaired':
        return LoadBalancerStateEnum.activeImpaired;
      case 'failed':
        return LoadBalancerStateEnum.failed;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum LoadBalancerTypeEnum {
  @_s.JsonValue('application')
  application,
  @_s.JsonValue('network')
  network,
}

extension on LoadBalancerTypeEnum {
  String toValue() {
    switch (this) {
      case LoadBalancerTypeEnum.application:
        return 'application';
      case LoadBalancerTypeEnum.network:
        return 'network';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  LoadBalancerTypeEnum toLoadBalancerTypeEnum() {
    switch (this) {
      case 'application':
        return LoadBalancerTypeEnum.application;
      case 'network':
        return LoadBalancerTypeEnum.network;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information to use when checking for a successful response from a target.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Matcher {
  /// The HTTP codes.
  ///
  /// For Application Load Balancers, you can specify values between 200 and 499,
  /// and the default value is 200. You can specify multiple values (for example,
  /// "200,202") or a range of values (for example, "200-299").
  ///
  /// For Network Load Balancers, this is 200–399.
  @_s.JsonKey(name: 'HttpCode')
  final String httpCode;

  Matcher({
    @_s.required this.httpCode,
  });
  factory Matcher.fromXml(_s.XmlElement elem) {
    return Matcher(
      httpCode: _s.extractXmlStringValue(elem, 'HttpCode'),
    );
  }

  Map<String, dynamic> toJson() => _$MatcherToJson(this);
}

class ModifyListenerOutput {
  /// Information about the modified listener.
  final List<Listener> listeners;

  ModifyListenerOutput({
    this.listeners,
  });
  factory ModifyListenerOutput.fromXml(_s.XmlElement elem) {
    return ModifyListenerOutput(
      listeners: _s.extractXmlChild(elem, 'Listeners')?.let((elem) =>
          elem.findElements('member').map((c) => Listener.fromXml(c)).toList()),
    );
  }
}

class ModifyLoadBalancerAttributesOutput {
  /// Information about the load balancer attributes.
  final List<LoadBalancerAttribute> attributes;

  ModifyLoadBalancerAttributesOutput({
    this.attributes,
  });
  factory ModifyLoadBalancerAttributesOutput.fromXml(_s.XmlElement elem) {
    return ModifyLoadBalancerAttributesOutput(
      attributes: _s.extractXmlChild(elem, 'Attributes')?.let((elem) => elem
          .findElements('member')
          .map((c) => LoadBalancerAttribute.fromXml(c))
          .toList()),
    );
  }
}

class ModifyRuleOutput {
  /// Information about the modified rule.
  final List<Rule> rules;

  ModifyRuleOutput({
    this.rules,
  });
  factory ModifyRuleOutput.fromXml(_s.XmlElement elem) {
    return ModifyRuleOutput(
      rules: _s.extractXmlChild(elem, 'Rules')?.let((elem) =>
          elem.findElements('member').map((c) => Rule.fromXml(c)).toList()),
    );
  }
}

class ModifyTargetGroupAttributesOutput {
  /// Information about the attributes.
  final List<TargetGroupAttribute> attributes;

  ModifyTargetGroupAttributesOutput({
    this.attributes,
  });
  factory ModifyTargetGroupAttributesOutput.fromXml(_s.XmlElement elem) {
    return ModifyTargetGroupAttributesOutput(
      attributes: _s.extractXmlChild(elem, 'Attributes')?.let((elem) => elem
          .findElements('member')
          .map((c) => TargetGroupAttribute.fromXml(c))
          .toList()),
    );
  }
}

class ModifyTargetGroupOutput {
  /// Information about the modified target group.
  final List<TargetGroup> targetGroups;

  ModifyTargetGroupOutput({
    this.targetGroups,
  });
  factory ModifyTargetGroupOutput.fromXml(_s.XmlElement elem) {
    return ModifyTargetGroupOutput(
      targetGroups: _s.extractXmlChild(elem, 'TargetGroups')?.let((elem) => elem
          .findElements('member')
          .map((c) => TargetGroup.fromXml(c))
          .toList()),
    );
  }
}

/// Information about a path pattern condition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PathPatternConditionConfig {
  /// One or more path patterns to compare against the request URL. The maximum
  /// size of each string is 128 characters. The comparison is case sensitive. The
  /// following wildcard characters are supported: * (matches 0 or more
  /// characters) and ? (matches exactly 1 character).
  ///
  /// If you specify multiple strings, the condition is satisfied if one of them
  /// matches the request URL. The path pattern is compared only to the path of
  /// the URL, not to its query string. To compare against the query string, use
  /// <a>QueryStringConditionConfig</a>.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  PathPatternConditionConfig({
    this.values,
  });
  factory PathPatternConditionConfig.fromXml(_s.XmlElement elem) {
    return PathPatternConditionConfig(
      values: _s
          .extractXmlChild(elem, 'Values')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() => _$PathPatternConditionConfigToJson(this);
}

enum ProtocolEnum {
  @_s.JsonValue('HTTP')
  http,
  @_s.JsonValue('HTTPS')
  https,
  @_s.JsonValue('TCP')
  tcp,
  @_s.JsonValue('TLS')
  tls,
  @_s.JsonValue('UDP')
  udp,
  @_s.JsonValue('TCP_UDP')
  tcpUdp,
}

extension on ProtocolEnum {
  String toValue() {
    switch (this) {
      case ProtocolEnum.http:
        return 'HTTP';
      case ProtocolEnum.https:
        return 'HTTPS';
      case ProtocolEnum.tcp:
        return 'TCP';
      case ProtocolEnum.tls:
        return 'TLS';
      case ProtocolEnum.udp:
        return 'UDP';
      case ProtocolEnum.tcpUdp:
        return 'TCP_UDP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ProtocolEnum toProtocolEnum() {
    switch (this) {
      case 'HTTP':
        return ProtocolEnum.http;
      case 'HTTPS':
        return ProtocolEnum.https;
      case 'TCP':
        return ProtocolEnum.tcp;
      case 'TLS':
        return ProtocolEnum.tls;
      case 'UDP':
        return ProtocolEnum.udp;
      case 'TCP_UDP':
        return ProtocolEnum.tcpUdp;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about a query string condition.
///
/// The query string component of a URI starts after the first '?' character and
/// is terminated by either a '#' character or the end of the URI. A typical
/// query string contains key/value pairs separated by '&amp;' characters. The
/// allowed characters are specified by RFC 3986. Any character can be
/// percentage encoded.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class QueryStringConditionConfig {
  /// One or more key/value pairs or values to find in the query string. The
  /// maximum size of each string is 128 characters. The comparison is case
  /// insensitive. The following wildcard characters are supported: * (matches 0
  /// or more characters) and ? (matches exactly 1 character). To search for a
  /// literal '*' or '?' character in a query string, you must escape these
  /// characters in <code>Values</code> using a '\' character.
  ///
  /// If you specify multiple key/value pairs or values, the condition is
  /// satisfied if one of them is found in the query string.
  @_s.JsonKey(name: 'Values')
  final List<QueryStringKeyValuePair> values;

  QueryStringConditionConfig({
    this.values,
  });
  factory QueryStringConditionConfig.fromXml(_s.XmlElement elem) {
    return QueryStringConditionConfig(
      values: _s.extractXmlChild(elem, 'Values')?.let((elem) => elem
          .findElements('member')
          .map((c) => QueryStringKeyValuePair.fromXml(c))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() => _$QueryStringConditionConfigToJson(this);
}

/// Information about a key/value pair.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class QueryStringKeyValuePair {
  /// The key. You can omit the key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value.
  @_s.JsonKey(name: 'Value')
  final String value;

  QueryStringKeyValuePair({
    this.key,
    this.value,
  });
  factory QueryStringKeyValuePair.fromXml(_s.XmlElement elem) {
    return QueryStringKeyValuePair(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() => _$QueryStringKeyValuePairToJson(this);
}

/// Information about a redirect action.
///
/// A URI consists of the following components:
/// protocol://hostname:port/path?query. You must modify at least one of the
/// following components to avoid a redirect loop: protocol, hostname, port, or
/// path. Any components that you do not modify retain their original values.
///
/// You can reuse URI components using the following reserved keywords:
///
/// <ul>
/// <li>
/// #{protocol}
/// </li>
/// <li>
/// #{host}
/// </li>
/// <li>
/// #{port}
/// </li>
/// <li>
/// #{path} (the leading "/" is removed)
/// </li>
/// <li>
/// #{query}
/// </li>
/// </ul>
/// For example, you can change the path to "/new/#{path}", the hostname to
/// "example.#{host}", or the query to "#{query}&amp;value=xyz".
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RedirectActionConfig {
  /// The HTTP redirect code. The redirect is either permanent (HTTP 301) or
  /// temporary (HTTP 302).
  @_s.JsonKey(name: 'StatusCode')
  final RedirectActionStatusCodeEnum statusCode;

  /// The hostname. This component is not percent-encoded. The hostname can
  /// contain #{host}.
  @_s.JsonKey(name: 'Host')
  final String host;

  /// The absolute path, starting with the leading "/". This component is not
  /// percent-encoded. The path can contain #{host}, #{path}, and #{port}.
  @_s.JsonKey(name: 'Path')
  final String path;

  /// The port. You can specify a value from 1 to 65535 or #{port}.
  @_s.JsonKey(name: 'Port')
  final String port;

  /// The protocol. You can specify HTTP, HTTPS, or #{protocol}. You can redirect
  /// HTTP to HTTP, HTTP to HTTPS, and HTTPS to HTTPS. You cannot redirect HTTPS
  /// to HTTP.
  @_s.JsonKey(name: 'Protocol')
  final String protocol;

  /// The query parameters, URL-encoded when necessary, but not percent-encoded.
  /// Do not include the leading "?", as it is automatically added. You can
  /// specify any of the reserved keywords.
  @_s.JsonKey(name: 'Query')
  final String query;

  RedirectActionConfig({
    @_s.required this.statusCode,
    this.host,
    this.path,
    this.port,
    this.protocol,
    this.query,
  });
  factory RedirectActionConfig.fromXml(_s.XmlElement elem) {
    return RedirectActionConfig(
      statusCode: _s
          .extractXmlStringValue(elem, 'StatusCode')
          ?.toRedirectActionStatusCodeEnum(),
      host: _s.extractXmlStringValue(elem, 'Host'),
      path: _s.extractXmlStringValue(elem, 'Path'),
      port: _s.extractXmlStringValue(elem, 'Port'),
      protocol: _s.extractXmlStringValue(elem, 'Protocol'),
      query: _s.extractXmlStringValue(elem, 'Query'),
    );
  }

  Map<String, dynamic> toJson() => _$RedirectActionConfigToJson(this);
}

enum RedirectActionStatusCodeEnum {
  @_s.JsonValue('HTTP_301')
  http_301,
  @_s.JsonValue('HTTP_302')
  http_302,
}

extension on String {
  RedirectActionStatusCodeEnum toRedirectActionStatusCodeEnum() {
    switch (this) {
      case 'HTTP_301':
        return RedirectActionStatusCodeEnum.http_301;
      case 'HTTP_302':
        return RedirectActionStatusCodeEnum.http_302;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class RegisterTargetsOutput {
  RegisterTargetsOutput();
  factory RegisterTargetsOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return RegisterTargetsOutput();
  }
}

class RemoveListenerCertificatesOutput {
  RemoveListenerCertificatesOutput();
  factory RemoveListenerCertificatesOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return RemoveListenerCertificatesOutput();
  }
}

class RemoveTagsOutput {
  RemoveTagsOutput();
  factory RemoveTagsOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return RemoveTagsOutput();
  }
}

/// Information about a rule.
class Rule {
  /// The actions. Each rule must include exactly one of the following types of
  /// actions: <code>forward</code>, <code>redirect</code>, or
  /// <code>fixed-response</code>, and it must be the last action to be performed.
  final List<Action> actions;

  /// The conditions. Each rule can include zero or one of the following
  /// conditions: <code>http-request-method</code>, <code>host-header</code>,
  /// <code>path-pattern</code>, and <code>source-ip</code>, and zero or more of
  /// the following conditions: <code>http-header</code> and
  /// <code>query-string</code>.
  final List<RuleCondition> conditions;

  /// Indicates whether this is the default rule.
  final bool isDefault;

  /// The priority.
  final String priority;

  /// The Amazon Resource Name (ARN) of the rule.
  final String ruleArn;

  Rule({
    this.actions,
    this.conditions,
    this.isDefault,
    this.priority,
    this.ruleArn,
  });
  factory Rule.fromXml(_s.XmlElement elem) {
    return Rule(
      actions: _s.extractXmlChild(elem, 'Actions')?.let((elem) =>
          elem.findElements('member').map((c) => Action.fromXml(c)).toList()),
      conditions: _s.extractXmlChild(elem, 'Conditions')?.let((elem) => elem
          .findElements('member')
          .map((c) => RuleCondition.fromXml(c))
          .toList()),
      isDefault: _s.extractXmlBoolValue(elem, 'IsDefault'),
      priority: _s.extractXmlStringValue(elem, 'Priority'),
      ruleArn: _s.extractXmlStringValue(elem, 'RuleArn'),
    );
  }
}

/// Information about a condition for a rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RuleCondition {
  /// The field in the HTTP request. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>http-header</code>
  /// </li>
  /// <li>
  /// <code>http-request-method</code>
  /// </li>
  /// <li>
  /// <code>host-header</code>
  /// </li>
  /// <li>
  /// <code>path-pattern</code>
  /// </li>
  /// <li>
  /// <code>query-string</code>
  /// </li>
  /// <li>
  /// <code>source-ip</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Field')
  final String field;

  /// Information for a host header condition. Specify only when
  /// <code>Field</code> is <code>host-header</code>.
  @_s.JsonKey(name: 'HostHeaderConfig')
  final HostHeaderConditionConfig hostHeaderConfig;

  /// Information for an HTTP header condition. Specify only when
  /// <code>Field</code> is <code>http-header</code>.
  @_s.JsonKey(name: 'HttpHeaderConfig')
  final HttpHeaderConditionConfig httpHeaderConfig;

  /// Information for an HTTP method condition. Specify only when
  /// <code>Field</code> is <code>http-request-method</code>.
  @_s.JsonKey(name: 'HttpRequestMethodConfig')
  final HttpRequestMethodConditionConfig httpRequestMethodConfig;

  /// Information for a path pattern condition. Specify only when
  /// <code>Field</code> is <code>path-pattern</code>.
  @_s.JsonKey(name: 'PathPatternConfig')
  final PathPatternConditionConfig pathPatternConfig;

  /// Information for a query string condition. Specify only when
  /// <code>Field</code> is <code>query-string</code>.
  @_s.JsonKey(name: 'QueryStringConfig')
  final QueryStringConditionConfig queryStringConfig;

  /// Information for a source IP condition. Specify only when <code>Field</code>
  /// is <code>source-ip</code>.
  @_s.JsonKey(name: 'SourceIpConfig')
  final SourceIpConditionConfig sourceIpConfig;

  /// The condition value. You can use <code>Values</code> if the rule contains
  /// only <code>host-header</code> and <code>path-pattern</code> conditions.
  /// Otherwise, you can use <code>HostHeaderConfig</code> for
  /// <code>host-header</code> conditions and <code>PathPatternConfig</code> for
  /// <code>path-pattern</code> conditions.
  ///
  /// If <code>Field</code> is <code>host-header</code>, you can specify a single
  /// host name (for example, my.example.com). A host name is case insensitive,
  /// can be up to 128 characters in length, and can contain any of the following
  /// characters.
  ///
  /// <ul>
  /// <li>
  /// A-Z, a-z, 0-9
  /// </li>
  /// <li>
  /// - .
  /// </li>
  /// <li>
  /// * (matches 0 or more characters)
  /// </li>
  /// <li>
  /// ? (matches exactly 1 character)
  /// </li>
  /// </ul>
  /// If <code>Field</code> is <code>path-pattern</code>, you can specify a single
  /// path pattern (for example, /img/*). A path pattern is case-sensitive, can be
  /// up to 128 characters in length, and can contain any of the following
  /// characters.
  ///
  /// <ul>
  /// <li>
  /// A-Z, a-z, 0-9
  /// </li>
  /// <li>
  /// _ - . $ / ~ " ' @ : +
  /// </li>
  /// <li>
  /// &amp; (using &amp;amp;)
  /// </li>
  /// <li>
  /// * (matches 0 or more characters)
  /// </li>
  /// <li>
  /// ? (matches exactly 1 character)
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  RuleCondition({
    this.field,
    this.hostHeaderConfig,
    this.httpHeaderConfig,
    this.httpRequestMethodConfig,
    this.pathPatternConfig,
    this.queryStringConfig,
    this.sourceIpConfig,
    this.values,
  });
  factory RuleCondition.fromXml(_s.XmlElement elem) {
    return RuleCondition(
      field: _s.extractXmlStringValue(elem, 'Field'),
      hostHeaderConfig: _s
          .extractXmlChild(elem, 'HostHeaderConfig')
          ?.let((e) => HostHeaderConditionConfig.fromXml(e)),
      httpHeaderConfig: _s
          .extractXmlChild(elem, 'HttpHeaderConfig')
          ?.let((e) => HttpHeaderConditionConfig.fromXml(e)),
      httpRequestMethodConfig: _s
          .extractXmlChild(elem, 'HttpRequestMethodConfig')
          ?.let((e) => HttpRequestMethodConditionConfig.fromXml(e)),
      pathPatternConfig: _s
          .extractXmlChild(elem, 'PathPatternConfig')
          ?.let((e) => PathPatternConditionConfig.fromXml(e)),
      queryStringConfig: _s
          .extractXmlChild(elem, 'QueryStringConfig')
          ?.let((e) => QueryStringConditionConfig.fromXml(e)),
      sourceIpConfig: _s
          .extractXmlChild(elem, 'SourceIpConfig')
          ?.let((e) => SourceIpConditionConfig.fromXml(e)),
      values: _s
          .extractXmlChild(elem, 'Values')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() => _$RuleConditionToJson(this);
}

/// Information about the priorities for the rules for a listener.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RulePriorityPair {
  /// The rule priority.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// The Amazon Resource Name (ARN) of the rule.
  @_s.JsonKey(name: 'RuleArn')
  final String ruleArn;

  RulePriorityPair({
    this.priority,
    this.ruleArn,
  });
  Map<String, dynamic> toJson() => _$RulePriorityPairToJson(this);
}

class SetIpAddressTypeOutput {
  /// The IP address type.
  final IpAddressType ipAddressType;

  SetIpAddressTypeOutput({
    this.ipAddressType,
  });
  factory SetIpAddressTypeOutput.fromXml(_s.XmlElement elem) {
    return SetIpAddressTypeOutput(
      ipAddressType:
          _s.extractXmlStringValue(elem, 'IpAddressType')?.toIpAddressType(),
    );
  }
}

class SetRulePrioritiesOutput {
  /// Information about the rules.
  final List<Rule> rules;

  SetRulePrioritiesOutput({
    this.rules,
  });
  factory SetRulePrioritiesOutput.fromXml(_s.XmlElement elem) {
    return SetRulePrioritiesOutput(
      rules: _s.extractXmlChild(elem, 'Rules')?.let((elem) =>
          elem.findElements('member').map((c) => Rule.fromXml(c)).toList()),
    );
  }
}

class SetSecurityGroupsOutput {
  /// The IDs of the security groups associated with the load balancer.
  final List<String> securityGroupIds;

  SetSecurityGroupsOutput({
    this.securityGroupIds,
  });
  factory SetSecurityGroupsOutput.fromXml(_s.XmlElement elem) {
    return SetSecurityGroupsOutput(
      securityGroupIds: _s
          .extractXmlChild(elem, 'SecurityGroupIds')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

class SetSubnetsOutput {
  /// Information about the subnet and Availability Zone.
  final List<AvailabilityZone> availabilityZones;

  SetSubnetsOutput({
    this.availabilityZones,
  });
  factory SetSubnetsOutput.fromXml(_s.XmlElement elem) {
    return SetSubnetsOutput(
      availabilityZones: _s.extractXmlChild(elem, 'AvailabilityZones')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => AvailabilityZone.fromXml(c))
              .toList()),
    );
  }
}

/// Information about a source IP condition.
///
/// You can use this condition to route based on the IP address of the source
/// that connects to the load balancer. If a client is behind a proxy, this is
/// the IP address of the proxy not the IP address of the client.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SourceIpConditionConfig {
  /// One or more source IP addresses, in CIDR format. You can use both IPv4 and
  /// IPv6 addresses. Wildcards are not supported.
  ///
  /// If you specify multiple addresses, the condition is satisfied if the source
  /// IP address of the request matches one of the CIDR blocks. This condition is
  /// not satisfied by the addresses in the X-Forwarded-For header. To search for
  /// addresses in the X-Forwarded-For header, use
  /// <a>HttpHeaderConditionConfig</a>.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  SourceIpConditionConfig({
    this.values,
  });
  factory SourceIpConditionConfig.fromXml(_s.XmlElement elem) {
    return SourceIpConditionConfig(
      values: _s
          .extractXmlChild(elem, 'Values')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() => _$SourceIpConditionConfigToJson(this);
}

/// Information about a policy used for SSL negotiation.
class SslPolicy {
  /// The ciphers.
  final List<Cipher> ciphers;

  /// The name of the policy.
  final String name;

  /// The protocols.
  final List<String> sslProtocols;

  SslPolicy({
    this.ciphers,
    this.name,
    this.sslProtocols,
  });
  factory SslPolicy.fromXml(_s.XmlElement elem) {
    return SslPolicy(
      ciphers: _s.extractXmlChild(elem, 'Ciphers')?.let((elem) =>
          elem.findElements('member').map((c) => Cipher.fromXml(c)).toList()),
      name: _s.extractXmlStringValue(elem, 'Name'),
      sslProtocols: _s
          .extractXmlChild(elem, 'SslProtocols')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

/// Information about a subnet mapping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SubnetMapping {
  /// [Network Load Balancers] The allocation ID of the Elastic IP address for an
  /// internet-facing load balancer.
  @_s.JsonKey(name: 'AllocationId')
  final String allocationId;

  /// [Network Load Balancers] The private IPv4 address for an internal load
  /// balancer.
  @_s.JsonKey(name: 'PrivateIPv4Address')
  final String privateIPv4Address;

  /// The ID of the subnet.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  SubnetMapping({
    this.allocationId,
    this.privateIPv4Address,
    this.subnetId,
  });
  Map<String, dynamic> toJson() => _$SubnetMappingToJson(this);
}

/// Information about a tag.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Tag {
  /// The key of the tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the tag.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    this.value,
  });
  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// The tags associated with a resource.
class TagDescription {
  /// The Amazon Resource Name (ARN) of the resource.
  final String resourceArn;

  /// Information about the tags.
  final List<Tag> tags;

  TagDescription({
    this.resourceArn,
    this.tags,
  });
  factory TagDescription.fromXml(_s.XmlElement elem) {
    return TagDescription(
      resourceArn: _s.extractXmlStringValue(elem, 'ResourceArn'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('member').map((c) => Tag.fromXml(c)).toList()),
    );
  }
}

/// Information about a target.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TargetDescription {
  /// The ID of the target. If the target type of the target group is
  /// <code>instance</code>, specify an instance ID. If the target type is
  /// <code>ip</code>, specify an IP address. If the target type is
  /// <code>lambda</code>, specify the ARN of the Lambda function.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// An Availability Zone or <code>all</code>. This determines whether the target
  /// receives traffic from the load balancer nodes in the specified Availability
  /// Zone or from all enabled Availability Zones for the load balancer.
  ///
  /// This parameter is not supported if the target type of the target group is
  /// <code>instance</code>.
  ///
  /// If the target type is <code>ip</code> and the IP address is in a subnet of
  /// the VPC for the target group, the Availability Zone is automatically
  /// detected and this parameter is optional. If the IP address is outside the
  /// VPC, this parameter is required.
  ///
  /// With an Application Load Balancer, if the target type is <code>ip</code> and
  /// the IP address is outside the VPC for the target group, the only supported
  /// value is <code>all</code>.
  ///
  /// If the target type is <code>lambda</code>, this parameter is optional and
  /// the only supported value is <code>all</code>.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// The port on which the target is listening. Not used if the target is a
  /// Lambda function.
  @_s.JsonKey(name: 'Port')
  final int port;

  TargetDescription({
    @_s.required this.id,
    this.availabilityZone,
    this.port,
  });
  factory TargetDescription.fromXml(_s.XmlElement elem) {
    return TargetDescription(
      id: _s.extractXmlStringValue(elem, 'Id'),
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      port: _s.extractXmlIntValue(elem, 'Port'),
    );
  }

  Map<String, dynamic> toJson() => _$TargetDescriptionToJson(this);
}

/// Information about a target group.
class TargetGroup {
  /// Indicates whether health checks are enabled.
  final bool healthCheckEnabled;

  /// The approximate amount of time, in seconds, between health checks of an
  /// individual target.
  final int healthCheckIntervalSeconds;

  /// The destination for the health check request.
  final String healthCheckPath;

  /// The port to use to connect with the target.
  final String healthCheckPort;

  /// The protocol to use to connect with the target.
  final ProtocolEnum healthCheckProtocol;

  /// The amount of time, in seconds, during which no response means a failed
  /// health check.
  final int healthCheckTimeoutSeconds;

  /// The number of consecutive health checks successes required before
  /// considering an unhealthy target healthy.
  final int healthyThresholdCount;

  /// The Amazon Resource Names (ARN) of the load balancers that route traffic to
  /// this target group.
  final List<String> loadBalancerArns;

  /// The HTTP codes to use when checking for a successful response from a target.
  final Matcher matcher;

  /// The port on which the targets are listening. Not used if the target is a
  /// Lambda function.
  final int port;

  /// The protocol to use for routing traffic to the targets.
  final ProtocolEnum protocol;

  /// The Amazon Resource Name (ARN) of the target group.
  final String targetGroupArn;

  /// The name of the target group.
  final String targetGroupName;

  /// The type of target that you must specify when registering targets with this
  /// target group. The possible values are <code>instance</code> (targets are
  /// specified by instance ID) or <code>ip</code> (targets are specified by IP
  /// address).
  final TargetTypeEnum targetType;

  /// The number of consecutive health check failures required before considering
  /// the target unhealthy.
  final int unhealthyThresholdCount;

  /// The ID of the VPC for the targets.
  final String vpcId;

  TargetGroup({
    this.healthCheckEnabled,
    this.healthCheckIntervalSeconds,
    this.healthCheckPath,
    this.healthCheckPort,
    this.healthCheckProtocol,
    this.healthCheckTimeoutSeconds,
    this.healthyThresholdCount,
    this.loadBalancerArns,
    this.matcher,
    this.port,
    this.protocol,
    this.targetGroupArn,
    this.targetGroupName,
    this.targetType,
    this.unhealthyThresholdCount,
    this.vpcId,
  });
  factory TargetGroup.fromXml(_s.XmlElement elem) {
    return TargetGroup(
      healthCheckEnabled: _s.extractXmlBoolValue(elem, 'HealthCheckEnabled'),
      healthCheckIntervalSeconds:
          _s.extractXmlIntValue(elem, 'HealthCheckIntervalSeconds'),
      healthCheckPath: _s.extractXmlStringValue(elem, 'HealthCheckPath'),
      healthCheckPort: _s.extractXmlStringValue(elem, 'HealthCheckPort'),
      healthCheckProtocol: _s
          .extractXmlStringValue(elem, 'HealthCheckProtocol')
          ?.toProtocolEnum(),
      healthCheckTimeoutSeconds:
          _s.extractXmlIntValue(elem, 'HealthCheckTimeoutSeconds'),
      healthyThresholdCount:
          _s.extractXmlIntValue(elem, 'HealthyThresholdCount'),
      loadBalancerArns: _s
          .extractXmlChild(elem, 'LoadBalancerArns')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      matcher:
          _s.extractXmlChild(elem, 'Matcher')?.let((e) => Matcher.fromXml(e)),
      port: _s.extractXmlIntValue(elem, 'Port'),
      protocol: _s.extractXmlStringValue(elem, 'Protocol')?.toProtocolEnum(),
      targetGroupArn: _s.extractXmlStringValue(elem, 'TargetGroupArn'),
      targetGroupName: _s.extractXmlStringValue(elem, 'TargetGroupName'),
      targetType:
          _s.extractXmlStringValue(elem, 'TargetType')?.toTargetTypeEnum(),
      unhealthyThresholdCount:
          _s.extractXmlIntValue(elem, 'UnhealthyThresholdCount'),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

/// Information about a target group attribute.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TargetGroupAttribute {
  /// The name of the attribute.
  ///
  /// The following attributes are supported by both Application Load Balancers
  /// and Network Load Balancers:
  ///
  /// <ul>
  /// <li>
  /// <code>deregistration_delay.timeout_seconds</code> - The amount of time, in
  /// seconds, for Elastic Load Balancing to wait before changing the state of a
  /// deregistering target from <code>draining</code> to <code>unused</code>. The
  /// range is 0-3600 seconds. The default value is 300 seconds. If the target is
  /// a Lambda function, this attribute is not supported.
  /// </li>
  /// <li>
  /// <code>stickiness.enabled</code> - Indicates whether sticky sessions are
  /// enabled. The value is <code>true</code> or <code>false</code>. The default
  /// is <code>false</code>.
  /// </li>
  /// <li>
  /// <code>stickiness.type</code> - The type of sticky sessions. The possible
  /// values are <code>lb_cookie</code> for Application Load Balancers or
  /// <code>source_ip</code> for Network Load Balancers.
  /// </li>
  /// </ul>
  /// The following attributes are supported by Application Load Balancers if the
  /// target is not a Lambda function:
  ///
  /// <ul>
  /// <li>
  /// <code>load_balancing.algorithm.type</code> - The load balancing algorithm
  /// determines how the load balancer selects targets when routing requests. The
  /// value is <code>round_robin</code> or
  /// <code>least_outstanding_requests</code>. The default is
  /// <code>round_robin</code>.
  /// </li>
  /// <li>
  /// <code>slow_start.duration_seconds</code> - The time period, in seconds,
  /// during which a newly registered target receives a linearly increasing share
  /// of the traffic to the target group. After this time period ends, the target
  /// receives its full share of traffic. The range is 30-900 seconds (15
  /// minutes). Slow start mode is disabled by default.
  /// </li>
  /// <li>
  /// <code>stickiness.lb_cookie.duration_seconds</code> - The time period, in
  /// seconds, during which requests from a client should be routed to the same
  /// target. After this time period expires, the load balancer-generated cookie
  /// is considered stale. The range is 1 second to 1 week (604800 seconds). The
  /// default value is 1 day (86400 seconds).
  /// </li>
  /// </ul>
  /// The following attribute is supported only if the target is a Lambda
  /// function.
  ///
  /// <ul>
  /// <li>
  /// <code>lambda.multi_value_headers.enabled</code> - Indicates whether the
  /// request and response headers exchanged between the load balancer and the
  /// Lambda function include arrays of values or strings. The value is
  /// <code>true</code> or <code>false</code>. The default is <code>false</code>.
  /// If the value is <code>false</code> and the request contains a duplicate
  /// header field name or query parameter key, the load balancer uses the last
  /// value sent by the client.
  /// </li>
  /// </ul>
  /// The following attribute is supported only by Network Load Balancers:
  ///
  /// <ul>
  /// <li>
  /// <code>proxy_protocol_v2.enabled</code> - Indicates whether Proxy Protocol
  /// version 2 is enabled. The value is <code>true</code> or <code>false</code>.
  /// The default is <code>false</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the attribute.
  @_s.JsonKey(name: 'Value')
  final String value;

  TargetGroupAttribute({
    this.key,
    this.value,
  });
  factory TargetGroupAttribute.fromXml(_s.XmlElement elem) {
    return TargetGroupAttribute(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() => _$TargetGroupAttributeToJson(this);
}

/// Information about the target group stickiness for a rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TargetGroupStickinessConfig {
  /// The time period, in seconds, during which requests from a client should be
  /// routed to the same target group. The range is 1-604800 seconds (7 days).
  @_s.JsonKey(name: 'DurationSeconds')
  final int durationSeconds;

  /// Indicates whether target group stickiness is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  TargetGroupStickinessConfig({
    this.durationSeconds,
    this.enabled,
  });
  factory TargetGroupStickinessConfig.fromXml(_s.XmlElement elem) {
    return TargetGroupStickinessConfig(
      durationSeconds: _s.extractXmlIntValue(elem, 'DurationSeconds'),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
    );
  }

  Map<String, dynamic> toJson() => _$TargetGroupStickinessConfigToJson(this);
}

/// Information about how traffic will be distributed between multiple target
/// groups in a forward rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TargetGroupTuple {
  /// The Amazon Resource Name (ARN) of the target group.
  @_s.JsonKey(name: 'TargetGroupArn')
  final String targetGroupArn;

  /// The weight. The range is 0 to 999.
  @_s.JsonKey(name: 'Weight')
  final int weight;

  TargetGroupTuple({
    this.targetGroupArn,
    this.weight,
  });
  factory TargetGroupTuple.fromXml(_s.XmlElement elem) {
    return TargetGroupTuple(
      targetGroupArn: _s.extractXmlStringValue(elem, 'TargetGroupArn'),
      weight: _s.extractXmlIntValue(elem, 'Weight'),
    );
  }

  Map<String, dynamic> toJson() => _$TargetGroupTupleToJson(this);
}

/// Information about the current health of a target.
class TargetHealth {
  /// A description of the target health that provides additional details. If the
  /// state is <code>healthy</code>, a description is not provided.
  final String description;

  /// The reason code.
  ///
  /// If the target state is <code>healthy</code>, a reason code is not provided.
  ///
  /// If the target state is <code>initial</code>, the reason code can be one of
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>Elb.RegistrationInProgress</code> - The target is in the process of
  /// being registered with the load balancer.
  /// </li>
  /// <li>
  /// <code>Elb.InitialHealthChecking</code> - The load balancer is still sending
  /// the target the minimum number of health checks required to determine its
  /// health status.
  /// </li>
  /// </ul>
  /// If the target state is <code>unhealthy</code>, the reason code can be one of
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>Target.ResponseCodeMismatch</code> - The health checks did not return
  /// an expected HTTP code. Applies only to Application Load Balancers.
  /// </li>
  /// <li>
  /// <code>Target.Timeout</code> - The health check requests timed out. Applies
  /// only to Application Load Balancers.
  /// </li>
  /// <li>
  /// <code>Target.FailedHealthChecks</code> - The load balancer received an error
  /// while establishing a connection to the target or the target response was
  /// malformed.
  /// </li>
  /// <li>
  /// <code>Elb.InternalError</code> - The health checks failed due to an internal
  /// error. Applies only to Application Load Balancers.
  /// </li>
  /// </ul>
  /// If the target state is <code>unused</code>, the reason code can be one of
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>Target.NotRegistered</code> - The target is not registered with the
  /// target group.
  /// </li>
  /// <li>
  /// <code>Target.NotInUse</code> - The target group is not used by any load
  /// balancer or the target is in an Availability Zone that is not enabled for
  /// its load balancer.
  /// </li>
  /// <li>
  /// <code>Target.InvalidState</code> - The target is in the stopped or
  /// terminated state.
  /// </li>
  /// <li>
  /// <code>Target.IpUnusable</code> - The target IP address is reserved for use
  /// by a load balancer.
  /// </li>
  /// </ul>
  /// If the target state is <code>draining</code>, the reason code can be the
  /// following value:
  ///
  /// <ul>
  /// <li>
  /// <code>Target.DeregistrationInProgress</code> - The target is in the process
  /// of being deregistered and the deregistration delay period has not expired.
  /// </li>
  /// </ul>
  /// If the target state is <code>unavailable</code>, the reason code can be the
  /// following value:
  ///
  /// <ul>
  /// <li>
  /// <code>Target.HealthCheckDisabled</code> - Health checks are disabled for the
  /// target group. Applies only to Application Load Balancers.
  /// </li>
  /// <li>
  /// <code>Elb.InternalError</code> - Target health is unavailable due to an
  /// internal error. Applies only to Network Load Balancers.
  /// </li>
  /// </ul>
  final TargetHealthReasonEnum reason;

  /// The state of the target.
  final TargetHealthStateEnum state;

  TargetHealth({
    this.description,
    this.reason,
    this.state,
  });
  factory TargetHealth.fromXml(_s.XmlElement elem) {
    return TargetHealth(
      description: _s.extractXmlStringValue(elem, 'Description'),
      reason:
          _s.extractXmlStringValue(elem, 'Reason')?.toTargetHealthReasonEnum(),
      state: _s.extractXmlStringValue(elem, 'State')?.toTargetHealthStateEnum(),
    );
  }
}

/// Information about the health of a target.
class TargetHealthDescription {
  /// The port to use to connect with the target.
  final String healthCheckPort;

  /// The description of the target.
  final TargetDescription target;

  /// The health information for the target.
  final TargetHealth targetHealth;

  TargetHealthDescription({
    this.healthCheckPort,
    this.target,
    this.targetHealth,
  });
  factory TargetHealthDescription.fromXml(_s.XmlElement elem) {
    return TargetHealthDescription(
      healthCheckPort: _s.extractXmlStringValue(elem, 'HealthCheckPort'),
      target: _s
          .extractXmlChild(elem, 'Target')
          ?.let((e) => TargetDescription.fromXml(e)),
      targetHealth: _s
          .extractXmlChild(elem, 'TargetHealth')
          ?.let((e) => TargetHealth.fromXml(e)),
    );
  }
}

enum TargetHealthReasonEnum {
  @_s.JsonValue('Elb.RegistrationInProgress')
  elbRegistrationInProgress,
  @_s.JsonValue('Elb.InitialHealthChecking')
  elbInitialHealthChecking,
  @_s.JsonValue('Target.ResponseCodeMismatch')
  targetResponseCodeMismatch,
  @_s.JsonValue('Target.Timeout')
  targetTimeout,
  @_s.JsonValue('Target.FailedHealthChecks')
  targetFailedHealthChecks,
  @_s.JsonValue('Target.NotRegistered')
  targetNotRegistered,
  @_s.JsonValue('Target.NotInUse')
  targetNotInUse,
  @_s.JsonValue('Target.DeregistrationInProgress')
  targetDeregistrationInProgress,
  @_s.JsonValue('Target.InvalidState')
  targetInvalidState,
  @_s.JsonValue('Target.IpUnusable')
  targetIpUnusable,
  @_s.JsonValue('Target.HealthCheckDisabled')
  targetHealthCheckDisabled,
  @_s.JsonValue('Elb.InternalError')
  elbInternalError,
}

extension on String {
  TargetHealthReasonEnum toTargetHealthReasonEnum() {
    switch (this) {
      case 'Elb.RegistrationInProgress':
        return TargetHealthReasonEnum.elbRegistrationInProgress;
      case 'Elb.InitialHealthChecking':
        return TargetHealthReasonEnum.elbInitialHealthChecking;
      case 'Target.ResponseCodeMismatch':
        return TargetHealthReasonEnum.targetResponseCodeMismatch;
      case 'Target.Timeout':
        return TargetHealthReasonEnum.targetTimeout;
      case 'Target.FailedHealthChecks':
        return TargetHealthReasonEnum.targetFailedHealthChecks;
      case 'Target.NotRegistered':
        return TargetHealthReasonEnum.targetNotRegistered;
      case 'Target.NotInUse':
        return TargetHealthReasonEnum.targetNotInUse;
      case 'Target.DeregistrationInProgress':
        return TargetHealthReasonEnum.targetDeregistrationInProgress;
      case 'Target.InvalidState':
        return TargetHealthReasonEnum.targetInvalidState;
      case 'Target.IpUnusable':
        return TargetHealthReasonEnum.targetIpUnusable;
      case 'Target.HealthCheckDisabled':
        return TargetHealthReasonEnum.targetHealthCheckDisabled;
      case 'Elb.InternalError':
        return TargetHealthReasonEnum.elbInternalError;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum TargetHealthStateEnum {
  @_s.JsonValue('initial')
  initial,
  @_s.JsonValue('healthy')
  healthy,
  @_s.JsonValue('unhealthy')
  unhealthy,
  @_s.JsonValue('unused')
  unused,
  @_s.JsonValue('draining')
  draining,
  @_s.JsonValue('unavailable')
  unavailable,
}

extension on String {
  TargetHealthStateEnum toTargetHealthStateEnum() {
    switch (this) {
      case 'initial':
        return TargetHealthStateEnum.initial;
      case 'healthy':
        return TargetHealthStateEnum.healthy;
      case 'unhealthy':
        return TargetHealthStateEnum.unhealthy;
      case 'unused':
        return TargetHealthStateEnum.unused;
      case 'draining':
        return TargetHealthStateEnum.draining;
      case 'unavailable':
        return TargetHealthStateEnum.unavailable;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum TargetTypeEnum {
  @_s.JsonValue('instance')
  instance,
  @_s.JsonValue('ip')
  ip,
  @_s.JsonValue('lambda')
  lambda,
}

extension on TargetTypeEnum {
  String toValue() {
    switch (this) {
      case TargetTypeEnum.instance:
        return 'instance';
      case TargetTypeEnum.ip:
        return 'ip';
      case TargetTypeEnum.lambda:
        return 'lambda';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  TargetTypeEnum toTargetTypeEnum() {
    switch (this) {
      case 'instance':
        return TargetTypeEnum.instance;
      case 'ip':
        return TargetTypeEnum.ip;
      case 'lambda':
        return TargetTypeEnum.lambda;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class AllocationIdNotFoundException extends _s.GenericAwsException {
  AllocationIdNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'AllocationIdNotFoundException',
            message: message);
}

class AvailabilityZoneNotSupportedException extends _s.GenericAwsException {
  AvailabilityZoneNotSupportedException({String type, String message})
      : super(
            type: type,
            code: 'AvailabilityZoneNotSupportedException',
            message: message);
}

class CertificateNotFoundException extends _s.GenericAwsException {
  CertificateNotFoundException({String type, String message})
      : super(
            type: type, code: 'CertificateNotFoundException', message: message);
}

class DuplicateListenerException extends _s.GenericAwsException {
  DuplicateListenerException({String type, String message})
      : super(type: type, code: 'DuplicateListenerException', message: message);
}

class DuplicateLoadBalancerNameException extends _s.GenericAwsException {
  DuplicateLoadBalancerNameException({String type, String message})
      : super(
            type: type,
            code: 'DuplicateLoadBalancerNameException',
            message: message);
}

class DuplicateTagKeysException extends _s.GenericAwsException {
  DuplicateTagKeysException({String type, String message})
      : super(type: type, code: 'DuplicateTagKeysException', message: message);
}

class DuplicateTargetGroupNameException extends _s.GenericAwsException {
  DuplicateTargetGroupNameException({String type, String message})
      : super(
            type: type,
            code: 'DuplicateTargetGroupNameException',
            message: message);
}

class HealthUnavailableException extends _s.GenericAwsException {
  HealthUnavailableException({String type, String message})
      : super(type: type, code: 'HealthUnavailableException', message: message);
}

class IncompatibleProtocolsException extends _s.GenericAwsException {
  IncompatibleProtocolsException({String type, String message})
      : super(
            type: type,
            code: 'IncompatibleProtocolsException',
            message: message);
}

class InvalidConfigurationRequestException extends _s.GenericAwsException {
  InvalidConfigurationRequestException({String type, String message})
      : super(
            type: type,
            code: 'InvalidConfigurationRequestException',
            message: message);
}

class InvalidLoadBalancerActionException extends _s.GenericAwsException {
  InvalidLoadBalancerActionException({String type, String message})
      : super(
            type: type,
            code: 'InvalidLoadBalancerActionException',
            message: message);
}

class InvalidSchemeException extends _s.GenericAwsException {
  InvalidSchemeException({String type, String message})
      : super(type: type, code: 'InvalidSchemeException', message: message);
}

class InvalidSecurityGroupException extends _s.GenericAwsException {
  InvalidSecurityGroupException({String type, String message})
      : super(
            type: type,
            code: 'InvalidSecurityGroupException',
            message: message);
}

class InvalidSubnetException extends _s.GenericAwsException {
  InvalidSubnetException({String type, String message})
      : super(type: type, code: 'InvalidSubnetException', message: message);
}

class InvalidTargetException extends _s.GenericAwsException {
  InvalidTargetException({String type, String message})
      : super(type: type, code: 'InvalidTargetException', message: message);
}

class ListenerNotFoundException extends _s.GenericAwsException {
  ListenerNotFoundException({String type, String message})
      : super(type: type, code: 'ListenerNotFoundException', message: message);
}

class LoadBalancerNotFoundException extends _s.GenericAwsException {
  LoadBalancerNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'LoadBalancerNotFoundException',
            message: message);
}

class OperationNotPermittedException extends _s.GenericAwsException {
  OperationNotPermittedException({String type, String message})
      : super(
            type: type,
            code: 'OperationNotPermittedException',
            message: message);
}

class PriorityInUseException extends _s.GenericAwsException {
  PriorityInUseException({String type, String message})
      : super(type: type, code: 'PriorityInUseException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class RuleNotFoundException extends _s.GenericAwsException {
  RuleNotFoundException({String type, String message})
      : super(type: type, code: 'RuleNotFoundException', message: message);
}

class SSLPolicyNotFoundException extends _s.GenericAwsException {
  SSLPolicyNotFoundException({String type, String message})
      : super(type: type, code: 'SSLPolicyNotFoundException', message: message);
}

class SubnetNotFoundException extends _s.GenericAwsException {
  SubnetNotFoundException({String type, String message})
      : super(type: type, code: 'SubnetNotFoundException', message: message);
}

class TargetGroupAssociationLimitException extends _s.GenericAwsException {
  TargetGroupAssociationLimitException({String type, String message})
      : super(
            type: type,
            code: 'TargetGroupAssociationLimitException',
            message: message);
}

class TargetGroupNotFoundException extends _s.GenericAwsException {
  TargetGroupNotFoundException({String type, String message})
      : super(
            type: type, code: 'TargetGroupNotFoundException', message: message);
}

class TooManyActionsException extends _s.GenericAwsException {
  TooManyActionsException({String type, String message})
      : super(type: type, code: 'TooManyActionsException', message: message);
}

class TooManyCertificatesException extends _s.GenericAwsException {
  TooManyCertificatesException({String type, String message})
      : super(
            type: type, code: 'TooManyCertificatesException', message: message);
}

class TooManyListenersException extends _s.GenericAwsException {
  TooManyListenersException({String type, String message})
      : super(type: type, code: 'TooManyListenersException', message: message);
}

class TooManyLoadBalancersException extends _s.GenericAwsException {
  TooManyLoadBalancersException({String type, String message})
      : super(
            type: type,
            code: 'TooManyLoadBalancersException',
            message: message);
}

class TooManyRegistrationsForTargetIdException extends _s.GenericAwsException {
  TooManyRegistrationsForTargetIdException({String type, String message})
      : super(
            type: type,
            code: 'TooManyRegistrationsForTargetIdException',
            message: message);
}

class TooManyRulesException extends _s.GenericAwsException {
  TooManyRulesException({String type, String message})
      : super(type: type, code: 'TooManyRulesException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class TooManyTargetGroupsException extends _s.GenericAwsException {
  TooManyTargetGroupsException({String type, String message})
      : super(
            type: type, code: 'TooManyTargetGroupsException', message: message);
}

class TooManyTargetsException extends _s.GenericAwsException {
  TooManyTargetsException({String type, String message})
      : super(type: type, code: 'TooManyTargetsException', message: message);
}

class TooManyUniqueTargetGroupsPerLoadBalancerException
    extends _s.GenericAwsException {
  TooManyUniqueTargetGroupsPerLoadBalancerException(
      {String type, String message})
      : super(
            type: type,
            code: 'TooManyUniqueTargetGroupsPerLoadBalancerException',
            message: message);
}

class UnsupportedProtocolException extends _s.GenericAwsException {
  UnsupportedProtocolException({String type, String message})
      : super(
            type: type, code: 'UnsupportedProtocolException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AllocationIdNotFoundException': (type, message) =>
      AllocationIdNotFoundException(type: type, message: message),
  'AvailabilityZoneNotSupportedException': (type, message) =>
      AvailabilityZoneNotSupportedException(type: type, message: message),
  'CertificateNotFoundException': (type, message) =>
      CertificateNotFoundException(type: type, message: message),
  'DuplicateListenerException': (type, message) =>
      DuplicateListenerException(type: type, message: message),
  'DuplicateLoadBalancerNameException': (type, message) =>
      DuplicateLoadBalancerNameException(type: type, message: message),
  'DuplicateTagKeysException': (type, message) =>
      DuplicateTagKeysException(type: type, message: message),
  'DuplicateTargetGroupNameException': (type, message) =>
      DuplicateTargetGroupNameException(type: type, message: message),
  'HealthUnavailableException': (type, message) =>
      HealthUnavailableException(type: type, message: message),
  'IncompatibleProtocolsException': (type, message) =>
      IncompatibleProtocolsException(type: type, message: message),
  'InvalidConfigurationRequestException': (type, message) =>
      InvalidConfigurationRequestException(type: type, message: message),
  'InvalidLoadBalancerActionException': (type, message) =>
      InvalidLoadBalancerActionException(type: type, message: message),
  'InvalidSchemeException': (type, message) =>
      InvalidSchemeException(type: type, message: message),
  'InvalidSecurityGroupException': (type, message) =>
      InvalidSecurityGroupException(type: type, message: message),
  'InvalidSubnetException': (type, message) =>
      InvalidSubnetException(type: type, message: message),
  'InvalidTargetException': (type, message) =>
      InvalidTargetException(type: type, message: message),
  'ListenerNotFoundException': (type, message) =>
      ListenerNotFoundException(type: type, message: message),
  'LoadBalancerNotFoundException': (type, message) =>
      LoadBalancerNotFoundException(type: type, message: message),
  'OperationNotPermittedException': (type, message) =>
      OperationNotPermittedException(type: type, message: message),
  'PriorityInUseException': (type, message) =>
      PriorityInUseException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'RuleNotFoundException': (type, message) =>
      RuleNotFoundException(type: type, message: message),
  'SSLPolicyNotFoundException': (type, message) =>
      SSLPolicyNotFoundException(type: type, message: message),
  'SubnetNotFoundException': (type, message) =>
      SubnetNotFoundException(type: type, message: message),
  'TargetGroupAssociationLimitException': (type, message) =>
      TargetGroupAssociationLimitException(type: type, message: message),
  'TargetGroupNotFoundException': (type, message) =>
      TargetGroupNotFoundException(type: type, message: message),
  'TooManyActionsException': (type, message) =>
      TooManyActionsException(type: type, message: message),
  'TooManyCertificatesException': (type, message) =>
      TooManyCertificatesException(type: type, message: message),
  'TooManyListenersException': (type, message) =>
      TooManyListenersException(type: type, message: message),
  'TooManyLoadBalancersException': (type, message) =>
      TooManyLoadBalancersException(type: type, message: message),
  'TooManyRegistrationsForTargetIdException': (type, message) =>
      TooManyRegistrationsForTargetIdException(type: type, message: message),
  'TooManyRulesException': (type, message) =>
      TooManyRulesException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'TooManyTargetGroupsException': (type, message) =>
      TooManyTargetGroupsException(type: type, message: message),
  'TooManyTargetsException': (type, message) =>
      TooManyTargetsException(type: type, message: message),
  'TooManyUniqueTargetGroupsPerLoadBalancerException': (type, message) =>
      TooManyUniqueTargetGroupsPerLoadBalancerException(
          type: type, message: message),
  'UnsupportedProtocolException': (type, message) =>
      UnsupportedProtocolException(type: type, message: message),
};
