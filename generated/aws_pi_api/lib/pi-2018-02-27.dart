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

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'pi-2018-02-27.g.dart';

/// AWS Performance Insights enables you to monitor and explore different
/// dimensions of database load based on data captured from a running RDS
/// instance. The guide provides detailed information about Performance Insights
/// data types, parameters and errors. For more information about Performance
/// Insights capabilities see <a
/// href="http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html">Using
/// Amazon RDS Performance Insights </a> in the <i>Amazon RDS User Guide</i>.
///
/// The AWS Performance Insights API provides visibility into the performance of
/// your RDS instance, when Performance Insights is enabled for supported engine
/// types. While Amazon CloudWatch provides the authoritative source for AWS
/// service vended monitoring metrics, AWS Performance Insights offers a
/// domain-specific view of database load measured as Average Active Sessions
/// and provided to API consumers as a 2-dimensional time-series dataset. The
/// time dimension of the data provides DB load data for each time point in the
/// queried time range, and each time point decomposes overall load in relation
/// to the requested dimensions, such as SQL, Wait-event, User or Host, measured
/// at that time point.
class PI {
  final _s.JsonProtocol _protocol;
  PI({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'pi',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// For a specific time period, retrieve the top <code>N</code> dimension keys
  /// for a metric.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [endTime] :
  /// The date and time specifying the end of the requested time series data.
  /// The value specified is <i>exclusive</i> - data points less than (but not
  /// equal to) <code>EndTime</code> will be returned.
  ///
  /// The value for <code>EndTime</code> must be later than the value for
  /// <code>StartTime</code>.
  ///
  /// Parameter [groupBy] :
  /// A specification for how to aggregate the data points from a query result.
  /// You must specify a valid dimension group. Performance Insights will return
  /// all of the dimensions within that group, unless you provide the names of
  /// specific dimensions within that group. You can also request that
  /// Performance Insights return a limited number of values for a dimension.
  ///
  /// Parameter [identifier] :
  /// An immutable, AWS Region-unique identifier for a data source. Performance
  /// Insights gathers metrics from this data source.
  ///
  /// To use an Amazon RDS instance as a data source, you specify its
  /// <code>DbiResourceId</code> value - for example:
  /// <code>db-FAIHNTYBKTGAUSUZQYPDS2GW4A</code>
  ///
  /// Parameter [metric] :
  /// The name of a Performance Insights metric to be measured.
  ///
  /// Valid values for <code>Metric</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>db.load.avg</code> - a scaled representation of the number of active
  /// sessions for the database engine.
  /// </li>
  /// <li>
  /// <code>db.sampledload.avg</code> - the raw number of active sessions for
  /// the database engine.
  /// </li>
  /// </ul>
  ///
  /// Parameter [serviceType] :
  /// The AWS service for which Performance Insights will return metrics. The
  /// only valid value for <i>ServiceType</i> is: <code>RDS</code>
  ///
  /// Parameter [startTime] :
  /// The date and time specifying the beginning of the requested time series
  /// data. You can't specify a <code>StartTime</code> that's earlier than 7
  /// days ago. The value specified is <i>inclusive</i> - data points equal to
  /// or greater than <code>StartTime</code> will be returned.
  ///
  /// The value for <code>StartTime</code> must be earlier than the value for
  /// <code>EndTime</code>.
  ///
  /// Parameter [filter] :
  /// One or more filters to apply in the request. Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Any number of filters by the same dimension, as specified in the
  /// <code>GroupBy</code> or <code>Partition</code> parameters.
  /// </li>
  /// <li>
  /// A single filter for any other dimension in this dimension group.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response. If more items exist
  /// than the specified <code>MaxRecords</code> value, a pagination token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// token, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [partitionBy] :
  /// For each dimension specified in <code>GroupBy</code>, specify a secondary
  /// dimension to further subdivide the partition keys in the response.
  ///
  /// Parameter [periodInSeconds] :
  /// The granularity, in seconds, of the data points returned from Performance
  /// Insights. A period can be as short as one second, or as long as one day
  /// (86400 seconds). Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>1</code> (one second)
  /// </li>
  /// <li>
  /// <code>60</code> (one minute)
  /// </li>
  /// <li>
  /// <code>300</code> (five minutes)
  /// </li>
  /// <li>
  /// <code>3600</code> (one hour)
  /// </li>
  /// <li>
  /// <code>86400</code> (twenty-four hours)
  /// </li>
  /// </ul>
  /// If you don't specify <code>PeriodInSeconds</code>, then Performance
  /// Insights will choose a value for you, with a goal of returning roughly
  /// 100-200 data points in the response.
  Future<DescribeDimensionKeysResponse> describeDimensionKeys({
    @_s.required DateTime endTime,
    @_s.required DimensionGroup groupBy,
    @_s.required String identifier,
    @_s.required String metric,
    @_s.required ServiceType serviceType,
    @_s.required DateTime startTime,
    Map<String, String> filter,
    int maxResults,
    String nextToken,
    DimensionGroup partitionBy,
    int periodInSeconds,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(groupBy, 'groupBy');
    ArgumentError.checkNotNull(identifier, 'identifier');
    ArgumentError.checkNotNull(metric, 'metric');
    ArgumentError.checkNotNull(serviceType, 'serviceType');
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PerformanceInsightsv20180227.DescribeDimensionKeys'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndTime': endTime,
        'GroupBy': groupBy,
        'Identifier': identifier,
        'Metric': metric,
        'ServiceType': serviceType?.toValue(),
        'StartTime': startTime,
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (partitionBy != null) 'PartitionBy': partitionBy,
        if (periodInSeconds != null) 'PeriodInSeconds': periodInSeconds,
      },
    );

    return DescribeDimensionKeysResponse.fromJson(jsonResponse.body);
  }

  /// Retrieve Performance Insights metrics for a set of data sources, over a
  /// time period. You can provide specific dimension groups and dimensions, and
  /// provide aggregation and filtering criteria for each group.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [endTime] :
  /// The date and time specifiying the end of the requested time series data.
  /// The value specified is <i>exclusive</i> - data points less than (but not
  /// equal to) <code>EndTime</code> will be returned.
  ///
  /// The value for <code>EndTime</code> must be later than the value for
  /// <code>StartTime</code>.
  ///
  /// Parameter [identifier] :
  /// An immutable, AWS Region-unique identifier for a data source. Performance
  /// Insights gathers metrics from this data source.
  ///
  /// To use an Amazon RDS instance as a data source, you specify its
  /// <code>DbiResourceId</code> value - for example:
  /// <code>db-FAIHNTYBKTGAUSUZQYPDS2GW4A</code>
  ///
  /// Parameter [metricQueries] :
  /// An array of one or more queries to perform. Each query must specify a
  /// Performance Insights metric, and can optionally specify aggregation and
  /// filtering criteria.
  ///
  /// Parameter [serviceType] :
  /// The AWS service for which Performance Insights will return metrics. The
  /// only valid value for <i>ServiceType</i> is: <code>RDS</code>
  ///
  /// Parameter [startTime] :
  /// The date and time specifying the beginning of the requested time series
  /// data. You can't specify a <code>StartTime</code> that's earlier than 7
  /// days ago. The value specified is <i>inclusive</i> - data points equal to
  /// or greater than <code>StartTime</code> will be returned.
  ///
  /// The value for <code>StartTime</code> must be earlier than the value for
  /// <code>EndTime</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response. If more items exist
  /// than the specified <code>MaxRecords</code> value, a pagination token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// token, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [periodInSeconds] :
  /// The granularity, in seconds, of the data points returned from Performance
  /// Insights. A period can be as short as one second, or as long as one day
  /// (86400 seconds). Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>1</code> (one second)
  /// </li>
  /// <li>
  /// <code>60</code> (one minute)
  /// </li>
  /// <li>
  /// <code>300</code> (five minutes)
  /// </li>
  /// <li>
  /// <code>3600</code> (one hour)
  /// </li>
  /// <li>
  /// <code>86400</code> (twenty-four hours)
  /// </li>
  /// </ul>
  /// If you don't specify <code>PeriodInSeconds</code>, then Performance
  /// Insights will choose a value for you, with a goal of returning roughly
  /// 100-200 data points in the response.
  Future<GetResourceMetricsResponse> getResourceMetrics({
    @_s.required DateTime endTime,
    @_s.required String identifier,
    @_s.required List<MetricQuery> metricQueries,
    @_s.required ServiceType serviceType,
    @_s.required DateTime startTime,
    int maxResults,
    String nextToken,
    int periodInSeconds,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(identifier, 'identifier');
    ArgumentError.checkNotNull(metricQueries, 'metricQueries');
    ArgumentError.checkNotNull(serviceType, 'serviceType');
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PerformanceInsightsv20180227.GetResourceMetrics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndTime': endTime,
        'Identifier': identifier,
        'MetricQueries': metricQueries,
        'ServiceType': serviceType?.toValue(),
        'StartTime': startTime,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (periodInSeconds != null) 'PeriodInSeconds': periodInSeconds,
      },
    );

    return GetResourceMetricsResponse.fromJson(jsonResponse.body);
  }
}

/// A timestamp, and a single numerical value, which together represent a
/// measurement at a particular point in time.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataPoint {
  /// The time, in epoch format, associated with a particular <code>Value</code>.
  @_s.JsonKey(
      name: 'Timestamp',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime timestamp;

  /// The actual value associated with a particular <code>Timestamp</code>.
  @_s.JsonKey(name: 'Value')
  final double value;

  DataPoint({
    @_s.required this.timestamp,
    @_s.required this.value,
  });
  factory DataPoint.fromJson(Map<String, dynamic> json) =>
      _$DataPointFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDimensionKeysResponse {
  /// The end time for the returned dimension keys, after alignment to a granular
  /// boundary (as specified by <code>PeriodInSeconds</code>).
  /// <code>AlignedEndTime</code> will be greater than or equal to the value of
  /// the user-specified <code>Endtime</code>.
  @_s.JsonKey(
      name: 'AlignedEndTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime alignedEndTime;

  /// The start time for the returned dimension keys, after alignment to a
  /// granular boundary (as specified by <code>PeriodInSeconds</code>).
  /// <code>AlignedStartTime</code> will be less than or equal to the value of the
  /// user-specified <code>StartTime</code>.
  @_s.JsonKey(
      name: 'AlignedStartTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime alignedStartTime;

  /// The dimension keys that were requested.
  @_s.JsonKey(name: 'Keys')
  final List<DimensionKeyDescription> keys;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the token,
  /// up to the value specified by <code>MaxRecords</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// If <code>PartitionBy</code> was present in the request,
  /// <code>PartitionKeys</code> contains the breakdown of dimension keys by the
  /// specified partitions.
  @_s.JsonKey(name: 'PartitionKeys')
  final List<ResponsePartitionKey> partitionKeys;

  DescribeDimensionKeysResponse({
    this.alignedEndTime,
    this.alignedStartTime,
    this.keys,
    this.nextToken,
    this.partitionKeys,
  });
  factory DescribeDimensionKeysResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDimensionKeysResponseFromJson(json);
}

/// A logical grouping of Performance Insights metrics for a related subject
/// area. For example, the <code>db.sql</code> dimension group consists of the
/// following dimensions: <code>db.sql.id</code>, <code>db.sql.db_id</code>,
/// <code>db.sql.statement</code>, and <code>db.sql.tokenized_id</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DimensionGroup {
  /// The name of the dimension group. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>db.user</code>
  /// </li>
  /// <li>
  /// <code>db.host</code>
  /// </li>
  /// <li>
  /// <code>db.sql</code>
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized</code>
  /// </li>
  /// <li>
  /// <code>db.wait_event</code>
  /// </li>
  /// <li>
  /// <code>db.wait_event_type</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Group')
  final String group;

  /// A list of specific dimensions from a dimension group. If this parameter is
  /// not present, then it signifies that all of the dimensions in the group were
  /// requested, or are present in the response.
  ///
  /// Valid values for elements in the <code>Dimensions</code> array are:
  ///
  /// <ul>
  /// <li>
  /// db.user.id
  /// </li>
  /// <li>
  /// db.user.name
  /// </li>
  /// <li>
  /// db.host.id
  /// </li>
  /// <li>
  /// db.host.name
  /// </li>
  /// <li>
  /// db.sql.id
  /// </li>
  /// <li>
  /// db.sql.db_id
  /// </li>
  /// <li>
  /// db.sql.statement
  /// </li>
  /// <li>
  /// db.sql.tokenized_id
  /// </li>
  /// <li>
  /// db.sql_tokenized.id
  /// </li>
  /// <li>
  /// db.sql_tokenized.db_id
  /// </li>
  /// <li>
  /// db.sql_tokenized.statement
  /// </li>
  /// <li>
  /// db.wait_event.name
  /// </li>
  /// <li>
  /// db.wait_event.type
  /// </li>
  /// <li>
  /// db.wait_event_type.name
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Dimensions')
  final List<String> dimensions;

  /// The maximum number of items to fetch for this dimension group.
  @_s.JsonKey(name: 'Limit')
  final int limit;

  DimensionGroup({
    @_s.required this.group,
    this.dimensions,
    this.limit,
  });
  Map<String, dynamic> toJson() => _$DimensionGroupToJson(this);
}

/// An array of descriptions and aggregated values for each dimension within a
/// dimension group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DimensionKeyDescription {
  /// A map of name-value pairs for the dimensions in the group.
  @_s.JsonKey(name: 'Dimensions')
  final Map<String, String> dimensions;

  /// If <code>PartitionBy</code> was specified, <code>PartitionKeys</code>
  /// contains the dimensions that were.
  @_s.JsonKey(name: 'Partitions')
  final List<double> partitions;

  /// The aggregated metric value for the dimension(s), over the requested time
  /// range.
  @_s.JsonKey(name: 'Total')
  final double total;

  DimensionKeyDescription({
    this.dimensions,
    this.partitions,
    this.total,
  });
  factory DimensionKeyDescription.fromJson(Map<String, dynamic> json) =>
      _$DimensionKeyDescriptionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResourceMetricsResponse {
  /// The end time for the returned metrics, after alignment to a granular
  /// boundary (as specified by <code>PeriodInSeconds</code>).
  /// <code>AlignedEndTime</code> will be greater than or equal to the value of
  /// the user-specified <code>Endtime</code>.
  @_s.JsonKey(
      name: 'AlignedEndTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime alignedEndTime;

  /// The start time for the returned metrics, after alignment to a granular
  /// boundary (as specified by <code>PeriodInSeconds</code>).
  /// <code>AlignedStartTime</code> will be less than or equal to the value of the
  /// user-specified <code>StartTime</code>.
  @_s.JsonKey(
      name: 'AlignedStartTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime alignedStartTime;

  /// An immutable, AWS Region-unique identifier for a data source. Performance
  /// Insights gathers metrics from this data source.
  ///
  /// To use an Amazon RDS instance as a data source, you specify its
  /// <code>DbiResourceId</code> value - for example:
  /// <code>db-FAIHNTYBKTGAUSUZQYPDS2GW4A</code>
  @_s.JsonKey(name: 'Identifier')
  final String identifier;

  /// An array of metric results,, where each array element contains all of the
  /// data points for a particular dimension.
  @_s.JsonKey(name: 'MetricList')
  final List<MetricKeyDataPoints> metricList;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the token,
  /// up to the value specified by <code>MaxRecords</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetResourceMetricsResponse({
    this.alignedEndTime,
    this.alignedStartTime,
    this.identifier,
    this.metricList,
    this.nextToken,
  });
  factory GetResourceMetricsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResourceMetricsResponseFromJson(json);
}

/// The request failed due to an unknown error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InternalServiceError implements _s.AwsException {
  @_s.JsonKey(name: 'Message')
  final String message;

  InternalServiceError({
    this.message,
  });
  factory InternalServiceError.fromJson(Map<String, dynamic> json) =>
      _$InternalServiceErrorFromJson(json);
}

/// One of the arguments provided is invalid for this request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InvalidArgumentException implements _s.AwsException {
  @_s.JsonKey(name: 'Message')
  final String message;

  InvalidArgumentException({
    this.message,
  });
  factory InvalidArgumentException.fromJson(Map<String, dynamic> json) =>
      _$InvalidArgumentExceptionFromJson(json);
}

/// A time-ordered series of data points, correpsonding to a dimension of a
/// Performance Insights metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MetricKeyDataPoints {
  /// An array of timestamp-value pairs, representing measurements over a period
  /// of time.
  @_s.JsonKey(name: 'DataPoints')
  final List<DataPoint> dataPoints;

  /// The dimension(s) to which the data points apply.
  @_s.JsonKey(name: 'Key')
  final ResponseResourceMetricKey key;

  MetricKeyDataPoints({
    this.dataPoints,
    this.key,
  });
  factory MetricKeyDataPoints.fromJson(Map<String, dynamic> json) =>
      _$MetricKeyDataPointsFromJson(json);
}

/// A single query to be processed. You must provide the metric to query. If no
/// other parameters are specified, Performance Insights returns all of the data
/// points for that metric. You can optionally request that the data points be
/// aggregated by dimension group ( <code>GroupBy</code>), and return only those
/// data points that match your criteria (<code>Filter</code>).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MetricQuery {
  /// The name of a Performance Insights metric to be measured.
  ///
  /// Valid values for <code>Metric</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>db.load.avg</code> - a scaled representation of the number of active
  /// sessions for the database engine.
  /// </li>
  /// <li>
  /// <code>db.sampledload.avg</code> - the raw number of active sessions for the
  /// database engine.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Metric')
  final String metric;

  /// One or more filters to apply in the request. Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Any number of filters by the same dimension, as specified in the
  /// <code>GroupBy</code> parameter.
  /// </li>
  /// <li>
  /// A single filter for any other dimension in this dimension group.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Filter')
  final Map<String, String> filter;

  /// A specification for how to aggregate the data points from a query result.
  /// You must specify a valid dimension group. Performance Insights will return
  /// all of the dimensions within that group, unless you provide the names of
  /// specific dimensions within that group. You can also request that Performance
  /// Insights return a limited number of values for a dimension.
  @_s.JsonKey(name: 'GroupBy')
  final DimensionGroup groupBy;

  MetricQuery({
    @_s.required this.metric,
    this.filter,
    this.groupBy,
  });
  Map<String, dynamic> toJson() => _$MetricQueryToJson(this);
}

/// The user is not authorized to perform this request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NotAuthorizedException implements _s.AwsException {
  @_s.JsonKey(name: 'Message')
  final String message;

  NotAuthorizedException({
    this.message,
  });
  factory NotAuthorizedException.fromJson(Map<String, dynamic> json) =>
      _$NotAuthorizedExceptionFromJson(json);
}

/// If <code>PartitionBy</code> was specified in a
/// <code>DescribeDimensionKeys</code> request, the dimensions are returned in
/// an array. Each element in the array specifies one dimension.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResponsePartitionKey {
  /// A dimension map that contains the dimension(s) for this partition.
  @_s.JsonKey(name: 'Dimensions')
  final Map<String, String> dimensions;

  ResponsePartitionKey({
    @_s.required this.dimensions,
  });
  factory ResponsePartitionKey.fromJson(Map<String, dynamic> json) =>
      _$ResponsePartitionKeyFromJson(json);
}

/// An object describing a Performance Insights metric and one or more
/// dimensions for that metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResponseResourceMetricKey {
  /// The name of a Performance Insights metric to be measured.
  ///
  /// Valid values for <code>Metric</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>db.load.avg</code> - a scaled representation of the number of active
  /// sessions for the database engine.
  /// </li>
  /// <li>
  /// <code>db.sampledload.avg</code> - the raw number of active sessions for the
  /// database engine.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Metric')
  final String metric;

  /// The valid dimensions for the metric.
  @_s.JsonKey(name: 'Dimensions')
  final Map<String, String> dimensions;

  ResponseResourceMetricKey({
    @_s.required this.metric,
    this.dimensions,
  });
  factory ResponseResourceMetricKey.fromJson(Map<String, dynamic> json) =>
      _$ResponseResourceMetricKeyFromJson(json);
}

enum ServiceType {
  @_s.JsonValue('RDS')
  rds,
}

extension on ServiceType {
  String toValue() {
    switch (this) {
      case ServiceType.rds:
        return 'RDS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServiceError': (type, message) =>
      InternalServiceError(message: message),
  'InvalidArgumentException': (type, message) =>
      InvalidArgumentException(message: message),
  'NotAuthorizedException': (type, message) =>
      NotAuthorizedException(message: message),
};
