{
	description = "Home Manager configuration of fnige";

	inputs = {
		# Specify the source of Home Manager and Nixpkgs.
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
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