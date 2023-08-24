{config, pkgs, lib, ...}:
let
	inherit (lib) mkOption mkIf types;
	cfg = config.aryxis.general;
in {
	options.aryxis.general = {
		profile = mkOption {
			type = types.enum [ "Fnige" "Ringlings" ];
			default = [];
		};
	};

	config = {
		
	};
}