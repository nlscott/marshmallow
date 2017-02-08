#require "marshmallow/version"

require "CFPropertyList"

module Marshmallow
  def self.users
		users=[]
		Dir.entries("/Users").each do |username|
			if !username.start_with?(".")
				users.push(username)
			end
		end
		users.delete("Guest")
		users.delete("Shared")
		return users
	end

	def self.listoflocaladmins
		listoflocaladmins =`dscacheutil -q group -a name admin`.split(":")
		listoflocaladmins=listoflocaladmins[4].strip.split(" ")
		return listoflocaladmins
	end

	def self.apps_installed
		apps=[]
		for x in Dir.entries("/Applications")
			if !x.start_with?(".")
				apps.push(x)
			end
		end
		return apps
	end

	def self.serial
		serial = `system_profiler SPHardwareDataType | awk '/Serial/'`.split(":")
		serial = serial[1].strip!
		return serial
	end

	def self.os_version
		os_version = `sw_vers -productVersion`.chomp
	end

	def self.build
		build = `sw_vers -buildVersion`.chomp
	end

	def self.model
		model = `system_profiler SPHardwareDataType`.split("\n")
		model = model[4].split(":")
		return model[1].strip
	end

	def self.model_id
		model = `system_profiler SPHardwareDataType`.split("\n")
		model = model[5].split(":")
		return model[1].strip
	end

	def self.processor_name
		processor = `system_profiler SPHardwareDataType`.split("\n")
		processor = processor[6].split(":")
		return processor[1].strip
	end

	def self.processor_speed
		processor = `system_profiler SPHardwareDataType`.split("\n")
		processor = processor[7].split(":")
		return processor[1].strip
	end

	def self.processor_number
		processor = `system_profiler SPHardwareDataType`.split("\n")
		processor = processor[8].split(":")
		return processor[1].strip
	end

	def self.cores
		cores = `system_profiler SPHardwareDataType`.split("\n")
		cores = cores[9].split(":")
		return cores[1].strip
	end

	def self.memory
		memory = `system_profiler SPHardwareDataType`.split("\n")
		memory = memory[12].split(":")
		return memory[1].strip
	end

	def self.boot_rom
		boot = `system_profiler SPHardwareDataType`.split("\n")
		boot = boot[13].split(":")
		return boot[1].strip
	end

	def self.smc
		smc = `system_profiler SPHardwareDataType`.split("\n")
		smc = smc[14].split(":")
		return smc[1].strip
	end

	def self.uuid
		uuid = `system_profiler SPHardwareDataType`.split("\n")
		uuid = uuid[16].split(":")
		return uuid[1].strip
	end

	def self.graphics
		graphics = `system_profiler SPDisplaysDataType`.split("\n")
		graphics = graphics[2].split(":")
		return graphics[0].strip
	end

	def self.free_space
		free = `system_profiler SPStorageDataType`.split("\n")
		free = free[4].split(":")
		free = free[1].split("(")
		return free[0].strip
	end

	def self.hd_size
		hd = `system_profiler SPStorageDataType`.split("\n")
		hd = hd[5].split(":")
		hd = hd[1].split("(")
		return hd[0].strip
	end

	def self.boot_volume
		boot = `system_profiler SPSoftwareDataType`.split("\n")
		boot = boot[6].split(":")
		return boot[1].strip
	end

	def self.computer_name
		name = `system_profiler SPSoftwareDataType`.split("\n")
		name = name[8].split(":")
		return name[1].strip
	end

	def self.system_launchagents
		launchagents=[]
		for x in Dir.entries("/Library/LaunchAgents")
			if !x.start_with?(".")
				launchagents.push(x)
			end
		end
		return launchagents
	end

	def self.system_launchdaemons
		launchdaemons=[]
		for x in Dir.entries("/Library/LaunchDaemons")
			if !x.start_with?(".")
				launchdaemons.push(x)
			end
		end
		return launchdaemons
	end

	def self.user_launchagents
		users.each do |username|
			if File.exist?("/Users/#{username}/Library/LaunchAgents")
				launchAgents=[]
				for x in Dir.entries("/Users/#{username}/Library/LaunchAgents")
					if !x.start_with?(".")
						launchAgents.push(x)
					end
				end
				puts"#{username} LaunchAgents: "
				puts launchAgents
				puts "\n"
			else
				puts "#{username} LaunchAgents does not exist "
				puts "\n"
			end
		end
	end

	def self.user_launchdaemons
		users.each do |username|
			if File.exist?("/Users/#{username}/Library/LaunchDaemons")
				launchdaemons=[]
				for file in Dir.entries("/Users/#{username}/Library/LaunchDaemons")
					if !file.start_with?(".")
						launchdaemons.push(file)
					end
				end
				puts "#{username} LaunchDaemons: "
				puts launchdaemons
				puts "\n"
			else
				puts "#{username} LaunchDaemons: does not exist"
				puts "\n"
			end
		end
	end

	def self.ard_info1
		plist = CFPropertyList::List.new(:file => "/Library/Preferences/com.apple.RemoteDesktop.plist")
		results = CFPropertyList.native_types(plist.value)
		if results['Text1'].empty?
			return "null"
		else
			return results['Text1']
		end
	end

	def self.ard_info2
		plist = CFPropertyList::List.new(:file => "/Library/Preferences/com.apple.RemoteDesktop.plist")
		results = CFPropertyList.native_types(plist.value)
		if results['Text2'].empty?
			return "null"
		else
			return results['Text2']
		end
	end

	def self.ard_info3
		plist = CFPropertyList::List.new(:file => "/Library/Preferences/com.apple.RemoteDesktop.plist")
		results = CFPropertyList.native_types(plist.value)
		if results['Text3'].empty?
			return "null"
		else
			return results['Text3']
		end
	end

	def self.ard_info4
		plist = CFPropertyList::List.new(:file => "/Library/Preferences/com.apple.RemoteDesktop.plist")
		results = CFPropertyList.native_types(plist.value)
		if results['Text4'].empty?
			return "null"
		else
			return results['Text4']
		end
	end

	def self.profiles_installed
		if `profiles -C`.chomp == "There are no configuration profiles installed in the system domain"
			puts "No profiles installed"
		else
			profiles=`profiles -C`.lines

			installed=[]
			for x in profiles
			 	installed.push(x.split.last)
			end
			installed.delete("installed")
			puts installed
		end
	end

	def self.profiles_all
		profiles="profiles -C"
		system(profiles)
	end

	def self.domain_check
		if `dsconfigad -show`.empty?
			puts "no Domain Settings"
		else
			domain_check=`dsconfigad -show | grep "Active Directory Domain"`.split("=")
			domain_check = domain_check[1].strip!
			return domain_check
		end
	end

	def self.firewall_check
		plist = CFPropertyList::List.new(:file => "/Library/Preferences/com.apple.alf.plist")
		firewall = CFPropertyList.native_types(plist.value)
		if firewall['globalstate'] == 1
			return "on"
		else
			return "off"
		end
	end

	def self.fastuserswitch_check
		plist = CFPropertyList::List.new(:file => "/Library/Preferences/.GlobalPreferences.plist")
		results = CFPropertyList.native_types(plist.value)
		if results['MultipleSessionEnabled'] == true
			return "enabled"
		else
			return "disabled"
		end
	end

	def self.loginwindow_check
		plist = CFPropertyList::List.new(:file => "/Library/Preferences/com.apple.loginwindow.plist")
		results = CFPropertyList.native_types(plist.value)
		if results['SHOWFULLNAME'] == true
			return "Name and Password"
		else
			return "List of users"
		end
	end

	def self.options
		return Marshmallow.methods(false).sort
	end
end



