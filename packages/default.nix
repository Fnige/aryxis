{config, pkgs, lib, ...}:
let
	inherit (lib) mkEnableOption mkIf;
	cfg = config.aryxis.general;
in {
	options.aryxis.general = {
		profile = mkOption {
			type = types.enum [ "Fnige" "Ringlings "];
			default = [];
		};
	};

	config = mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			spotify
		];
	};
}