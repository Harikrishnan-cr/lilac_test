import 'current.dart';
import 'location.dart';

class WetherModelClass {
	Location? location;
	Current? current;

	WetherModelClass({this.location, this.current});

	factory WetherModelClass.fromJson(Map<String, dynamic> json) {
		return WetherModelClass(
			location: json['location'] == null
						? null
						: Location.fromJson(json['location'] as Map<String, dynamic>),
			current: json['current'] == null
						? null
						: Current.fromJson(json['current'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'location': location?.toJson(),
				'current': current?.toJson(),
			};
}
