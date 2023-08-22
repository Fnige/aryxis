{config, pkgs, lib, ...}:
let
	inherit (lib) mkEnableOption mkIf;
	cfg = config.aryxis.packages.spotify;
in {
	options.aryxis.packages.spotify = {
		enable = mkEnableOption "Spotify";
	};

	config = mkIf cfg.enable {
		
	};
}