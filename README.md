# Marshmallow
This gem is a collction of macOS specfic facts and actions that may be helpful for macadmins.
Tested on macOS 10.12.


## Usage
To see a list of availible options for Marshmallow, require 'Marshmallow' in file then type:  
`puts Marshmallow.methods(false)`


output should be similar to this:
***
- users
- users_number
- listoflocaladmins
- apps_installed
- apps_number
- serial
- os_version
- build
- model
- model_id
- processor_name
- processor_speed
- processor_number
- cores
- memory
- boot_rom
- smc
- uuid
- graphics
- free_space
- hd_size
- boot_volume
- computer_name
- sys_launchagents
- sys_launchdaemons
- ard_info1
- ard_info2
- ard_info3
- ard_info4

##  Examples:

To print serial number: `puts Marshmallow.serial`

To print computer name: `puts Marshmallow.computer_name`

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

