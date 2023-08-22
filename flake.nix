{
	description = "Fnige's Nix Config (Aryxis)";

	inputs = {
		# Specify the source of Home Manager and Nixpkgs.
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

	# Home Manager
	home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

	# Flake Parts
	flake-parts = {
		url = "github:hercules-ci/flake-parts";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs: {

		nixosConfigurations."yawre-mother" = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = inputs;

			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager
				{
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.users.fnige = import ./home.nix;
				}
			];
		};
	};
}