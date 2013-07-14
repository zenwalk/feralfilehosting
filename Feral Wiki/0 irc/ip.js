/*
 * Node.js IRC Server IP Bot for feralhosting
 * 
 * Author: Ben Harris <ben@harrisuk.com>
 * Please email me using the email above if
 * you use this script. Thanks!
 */

// Create the configuration
var config = {
	//channels: ["#feral"],
	channels: ["#bentest"],
	server: "irc.what-network.net",
	botName: "BenBot_IP_Clone",
};

// Get required libs
var irc = require("irc");
var http= require('http');

// Create the bot name
var bot = new irc.Client(config.server, config.botName, {
	channels: config.channels
});

// Set Max Listenser to Unlimited
bot.setMaxListeners(0);

bot.addListener('message', function(from, to, message) {

	// $ip(more) command
	if ( message.substring(0,3) == '$ip' ) {

		if ( message.length < 5 ) {
			bot.say(to, "You need to provide a server name (like $ip zeus)");
			return;
		}

		var parts = message.split(" ");
		var server = parts[1];

		// Make sure we only have the subdomain
		var server_subdomain = server.split(".");
		var server = server_subdomain[0];

		var options = {
			host: 'dazzlepod.com',
			path: '/ip/' + server + '.feralhosting.com.json'
		};

		http.get(options, function(resp){
			var str = '';
			resp.on('data', function(chunk){
				str += chunk;
			});

			resp.on('end', function(){
				var resp = JSON.parse(str);

				var validate = resp.ip.split('.');
				if ( validate.length == 4 ) {
					if ( validate[0] == 178 && validate[1] == 32 && validate[2] == 53 && validate[3] == 178 ) {
						bot.say(to, server + ".feralhosting.com seems to return 178.32.53.178, which is the "
							+ "IP of the main feralhosting.com site, so that server probably doesn't exist");
					} else {
						bot.say(to, server + ".feralhosting.com resolves to " + resp.ip);
					}
				}
			});
		});
	} // $ipmore command
});
