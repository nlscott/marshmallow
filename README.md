# Marshmallow
This gem is a collction of macOS specfic facts and actions that may be helpful for macadmins.
Tested on macOS 10.12.


## Usage
To see a list of availible options for Marshmallow, require 'Marshmallow' in file then type:  
`puts Marshmallow.options`


output should be similar to this:
***
	- apps_installed
	- ard_info1
	- ard_info2
	- ard_info3
	- ard_info4
	- boot_rom
	- boot_volume
	- build
	- computer_name
	- cores
	- domain_check
	- fastuserswitch_check
	- firewall_check
	- free_space
	- graphics
	- hd_size
	- listoflocaladmins
	- loginwindow_check
	- memory
	- model
	- model_id
	- options
	- os_version
	- processor_name
	- processor_number
	- processor_speed
	- profiles_all
	- profiles_installed
	- serial
	- smc
	- system_launchagents
	- system_launchdaemons
	- user_launchagents
	- user_launchdaemons
	- users
	- uuid

##  Examples:

To print serial number: `puts Marshmallow.serial`

To print computer name: `puts Marshmallow.computer_name`

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

