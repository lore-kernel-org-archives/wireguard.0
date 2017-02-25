Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca3c99d5
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Feb 2017 14:29:53 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8eefc0e
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Feb 2017 14:29:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 636616f4
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Feb 2017 14:29:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1904bdb4
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Feb 2017 14:29:53 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id x10so30219088otb.1
 for <wireguard@lists.zx2c4.com>; Sat, 25 Feb 2017 06:31:13 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 25 Feb 2017 15:31:12 +0100
Message-ID: <CAHmME9pL8U9=-BWZJvwjeoDMqhSR6u5V8zhgf4bAa2p56GV6ig@mail.gmail.com>
Subject: Mullvad public WireGuard server for testing
To: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Fred,

This is nice to hear. Congratulations on getting it up and running.
That then makes 3 public servers:

1. Mine - https://www.wireguard.io/quickstart/#demo-server
2. Veil - https://veil.nuke.red/
3. Yours

I'm very happy about this!

Those instructions are very thorough, but they're not as simple as
they could be. Instead, I'd recommend you use wg-quick, which takes
care of setting up all the addressing and routing table stuff.

Instead, instruct users to fill in /etc/wireguard/mullvad.conf:

[Interface]
PrivateKey = INSERT_YOUR_PRIVATE_KEY_HERE
Address = INSERT_THE_IP_WE_GIVE_YOU_HERE
ListenPort = 51820

[Peer]
PublicKey = NFSMulKTJvtrlNDozk/plAvtPyUkQktx7SlLt0E7fhQ=
Endpoint = 193.138.219.62:51820
AllowedIPs = 0.0.0.0/0

Then, the next instructions are simply:

$ wg-quick up mullvad
$ wg-quick down mullvad

To turn on and off the VPN, respectively. If you want to add DNS
support, you can easily do that too; check out the man page of
wg-quick(8) for examples on this.

This allows you to get rid of the otherwise extremely complex
instructions regarding default gateways and routing tables and such.
wg-quick uses a more clever trick involving ip-rule, but the user
doesn't have to configure it; it simply just works by itself when
using wg-quick.

I know that as soon as I get my Mullvad credentials setup, I'll
certainly be using wg-quick myself.

Regards,
Jason

PS: Since Mullvad is a commercial organization and doesn't represent
the official direction of the WireGuard open source project, please
include "Mullvad" in your subject lines, rather than "Announcement" or
"[ANNOUNCE]" which are often treated a bit more officially.
