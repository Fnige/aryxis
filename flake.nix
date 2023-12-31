{
	description = "Aryxis: Funny nix config for both Fniges and Ringlings";

	inputs = {
		# Specify the source of Home Manager and Nixpkgs.
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

	# Home Manager
	home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
	};
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs: {
		nixosConfigurations.verra = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = inputs;

			modules = [
				./configuration.nix

				({ home-manager, ... }: {
					imports = [
						home-manager.nixosModules.home-manager
						./packages/media/spotify
					];

					aryxis.packages.spotify.enable = true;
		
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.fnige = import ./home-manager.nix;
					};
				})
			];
		};
	};
}