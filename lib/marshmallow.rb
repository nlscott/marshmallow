#require "marshmallow/version"

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

	def self.users_number
		return Flock.users.length
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

	def self.apps_number
		return Flock.apps_installed.length
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

	def self.sys_launchagents
		launchagents=[]
		for x in Dir.entries("/Library/LaunchAgents")
			if !x.start_with?(".")
				launchagents.push(x)
			end
		end
		return launchagents
	end

	def self.sys_launchdaemons
		launchdaemons=[]
		for x in Dir.entries("/Library/LaunchDaemons")
			if !x.start_with?(".")
				launchdaemons.push(x)
			end
		end
		return launchdaemons
	end

	def self.ard_info1
		if !`defaults read /Library/Preferences/com.apple.RemoteDesktop.plist Text1`.chomp.empty?
			`defaults read /Library/Preferences/com.apple.RemoteDesktop.plist Text1`.chomp
		else
			return "null"
		end
	end

	def self.ard_info2
		if !`defaults read /Library/Preferences/com.apple.RemoteDesktop.plist Text2`.chomp.empty?
			`defaults read /Library/Preferences/com.apple.RemoteDesktop.plist Text2`.chomp
		else
			return "null"
		end
	end

	def self.ard_info3
		if !`defaults read /Library/Preferences/com.apple.RemoteDesktop.plist Text3`.chomp.empty?
			`defaults read /Library/Preferences/com.apple.RemoteDesktop.plist Text3`.chomp
		else
			return "null"
		end
	end

	def self.ard_info4
		if !`defaults read /Library/Preferences/com.apple.RemoteDesktop.plist Text4`.chomp.empty?
			`defaults read /Library/Preferences/com.apple.RemoteDesktop.plist Text4`.chomp
		else
			return "null"
		end
	end
end


