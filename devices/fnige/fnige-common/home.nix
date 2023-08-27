{ config, pkgs, home-manager, ... }:
{
  import = [
    ../.././home-manager.nix
  ];

	home = {
		# Home Manager needs a bit of information about you and the paths it should
		# manage.
		username = "fnige";
		homeDirectory = "/home/fnige";

	};
}