import 'condition.dart';

class Current {
	int? lastUpdatedEpoch;
	String? lastUpdated;
	num? tempC;
	double? tempF;
	int? isDay;
	Condition? condition;
	double? windMph;
	double? windKph;
	num? windDegree;
	String? windDir;
	num? pressureMb;
	double? pressureIn;
	num? precipMm;
	num? precipIn;
	num? humidity;
	num? cloud;
	double? feelslikeC;
	double? feelslikeF;
	num? visKm;
	num? visMiles;
	num? uv;
	double? gustMph;
	num? gustKph;

	Current({
		this.lastUpdatedEpoch, 
		this.lastUpdated, 
		this.tempC, 
		this.tempF, 
		this.isDay, 
		this.condition, 
		this.windMph, 
		this.windKph, 
		this.windDegree, 
		this.windDir, 
		this.pressureMb, 
		this.pressureIn, 
		this.precipMm, 
		this.precipIn, 
		this.humidity, 
		this.cloud, 
		this.feelslikeC, 
		this.feelslikeF, 
		this.visKm, 
		this.visMiles, 
		this.uv, 
		this.gustMph, 
		this.gustKph, 
	});

	factory Current.fromJson(Map<String, dynamic> json) => Current(
				lastUpdatedEpoch: json['last_updated_epoch'] as int?,
				lastUpdated: json['last_updated'] as String?,
				tempC: json['temp_c'] as num?,
				tempF: (json['temp_f'] as num?)?.toDouble(),
				isDay: json['is_day'] as int?,
				condition: json['condition'] == null
						? null
						: Condition.fromJson(json['condition'] as Map<String, dynamic>),
				windMph: (json['wind_mph'] as num?)?.toDouble(),
				windKph: (json['wind_kph'] as num?)?.toDouble(),
				windDegree: json['wind_degree'] as num?,
				windDir: json['wind_dir'] as String?,
        cloud: json['cloud'] as num?,
				pressureMb: json['pressure_mb'] as num?,
				pressureIn: (json['pressure_in'] as num?)?.toDouble(),
				precipMm: json['precip_mm'] as num?,
				precipIn: json['precip_in'] as num?,
				humidity: json['humidity'] as num?,
				feelslikeC: (json['feelslike_c'] as num?)?.toDouble(),
				feelslikeF: (json['feelslike_f'] as num?)?.toDouble(),
				visKm: json['vis_km'] as num?,
				visMiles: json['vis_miles'] as num?,
				uv: json['uv'] as num?,
				gustMph: (json['gust_mph'] as num?)?.toDouble(),
				gustKph: json['gust_kph'] as num?,
			);

	Map<String, dynamic> toJson() => {
				'last_updated_epoch': lastUpdatedEpoch,
				'last_updated': lastUpdated,
				'temp_c': tempC,
				'temp_f': tempF,
				'is_day': isDay,
				'condition': condition?.toJson(),
				'wind_mph': windMph,
				'wind_kph': windKph,
				'wind_degree': windDegree,
				'wind_dir': windDir,
				'pressure_mb': pressureMb,
				'pressure_in': pressureIn,
				'precip_mm': precipMm,
				'precip_in': precipIn,
				'humidity': humidity,
				'cloud': cloud,
				'feelslike_c': feelslikeC,
				'feelslike_f': feelslikeF,
				'vis_km': visKm,
				'vis_miles': visMiles,
				'uv': uv,
				'gust_mph': gustMph,
				'gust_kph': gustKph,
			};
}
