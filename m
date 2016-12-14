Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8625c2a1
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 19:54:35 +0000 (UTC)
Received: from mx.sealand.io (mx.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 920bf68c
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 19:54:35 +0000 (UTC)
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Structure(d) output of wg?
Message-Id: <AD79A695-30E3-425D-9D7F-51AE2A25384D@danrl.com>
Date: Wed, 14 Dec 2016 21:04:16 +0100
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason, everyone,

I'd like to discuss the topic of structured output. I am working on =
luci-app-wireguard* which aims to provide status information via the =
user-friendly LUCI interface in LEDE. While writing code to parse the =
output I realized that I may not be the only one who needs to structure =
wg's output. Would it make sense to add support for structured output =
now and thus prevent/reduce parsers and half-baked solutions popping up =
in higher level software in the future?

Something like wg show --json
[
	{
		interface: "foo"
		private_key: "(hidden)",
		preshared_key: "(hidden)",
		listen_port: "12345",
		peers: [
			{
				public_key: "dfkdjkfjslfkd...",
				bandwith: "...",
				last_handshake: "..."
			},
			{
				public_key: "sdj9ad....",
				allowed_ips: "2001:db8::/64",
				bandwith: "..."
			}
		]
	},
	{
		interface: "foo2",
		...you get the idea...
	}
]

JSON is just one idea because it allows nice structuring. CSV, TSV or =
whatever is lean and easy to implement may be an equally good option. =
While structuring, we could also provide even more structure than the =
usual stdout of wg provides. Candidate for lists: allowed_ips
Candidate for sub-structures: bandwith (rx, tx)

What do you think?

Cheers,

Dan


*: Not to be confused with luci-proto-wireguard, kmod-wireguard, and =
wireguard-tools. They provide functionality and configuration =
interfaces, but not monitoring/fancy output.=
