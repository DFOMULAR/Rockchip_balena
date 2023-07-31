deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

ROCKPI_BOARD_SHUTDOWN = "The device is performing a shutdown. Please wait until the blue LED stops flashing (powered off)."

postProvisioningInstructions = [
	ROCKPI_BOARD_SHUTDOWN
	instructions.REMOVE_INSTALL_MEDIA
	instructions.BOARD_REPOWER
]

module.exports =
	version: 1
	slug: 'rock-4c-plus-rk3399'
	name: 'ROCK 4C Plus'
	arch: 'aarch64'
	state: 'new'

	stateInstructions:
		postProvisioning: postProvisioningInstructions

	instructions: [
		instructions.ETCHER_SD
		instructions.EJECT_SD
		instructions.FLASHER_WARNING
	].concat(postProvisioningInstructions)

	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/rock-4c-plus-rk3399/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/rock-4c-plus-rk3399/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/rock-4c-plus-rk3399/nodejs/'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'rock-4c-plus-rk3399'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-dunfell'
		deployArtifact: 'balena-image-flasher-rock-4c-plus-rk3399.balenaos-img'
		compressed: true

	configuration:
		config:
			partition: 4
			path: '/config.json'

	initialization: commonImg.initialization
