import $mAssetsPath from './assets.config';
import $mConstData from './constData.config';
class Setting {
	constructor(
		appName,
		appLogo,
		
	) {
		this._appName = appName; // 应用名称
		this._appLogo = appLogo; // 应用Logo

	}

	

	get appName() {
		return this._appName;
	}

	set appName(value) {
		this._appName = value;
	}

	get appLogo() {
		return this._appLogo;
	}

	set appLogo(value) {
		this._appLogo = value;
	}

	
}
export default new Setting(
	$mConstData.appName,
	$mAssetsPath.logo,
	
);
