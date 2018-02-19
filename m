Return-Path: johan@netsense.nl
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6760437f
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Feb 2018 10:35:06 +0000 (UTC)
Received: from mail.netsense.nl (pretsense.xs4all.nl [212.238.167.101])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e389bcab
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Feb 2018 10:35:06 +0000 (UTC)
Received: from [IPv6:2001:984:f4a1:1:78dc:814c:66e9:3177] (unknown
 [IPv6:2001:984:f4a1:1:78dc:814c:66e9:3177])
 by mail.netsense.nl (Postfix) with ESMTPSA id 4A1AA95D8
 for <wireguard@lists.zx2c4.com>; Mon, 19 Feb 2018 10:42:33 +0000 (UTC)
From: Johan Henselmans <johan@netsense.nl>
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.10\))
Subject: Compiling wireguard-go on non linux platforms
Message-Id: <2B0A40BA-F968-49BC-9845-33EE7226DE24@netsense.nl>
Date: Mon, 19 Feb 2018 11:42:32 +0100
To: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

It seems wireguard-go is not exactly cross-platfrom at the moment, this =
is what happens at the moment when compiling os mac os:

go build -o wireguard-go
# _/Users/johan/projecten/testdevel/go/examples/wireguard-go
./main.go:94:11: undefined: CreateTUNFromFile
./main.go:108:11: undefined: UAPIOpen
./main.go:142:18: too many arguments in call to Daemonize
	have (*os.ProcAttr)
	want ()
./main.go:165:15: undefined: UAPIListen
./tun_darwin.go:178:2: cannot use device (type *NativeTUN) as type =
TUNDevice in return argument:
	*NativeTUN does not implement TUNDevice (missing File method)
make: *** [wireguard-go] Error 2


(Darwin Kernel Version 17.5.0: Mon Jan 29 02:17:30 PST 2018; =
root:xnu-4570.50.257~17/RELEASE_X86_64 x86_64)


I noticed there was some discussion about not having a mac available to =
test cross-platform code. I do.

If there is anything I can do to help to make the code work =
cross-platform, please let me know.

Kind Regards,
=20
Johan Henselmans
