Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 937be75b
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:20:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd0b2a90
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:20:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9f73882
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:20:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7d0f219a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:20:51 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id b126so186637075oia.2
 for <wireguard@lists.zx2c4.com>; Tue, 20 Dec 2016 10:27:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <C11142B8-C7EA-4B18-A86C-2981549D0641@danrl.com>
References: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
 <20161220011334.GB16814@tuxmachine.polynome.dn42>
 <CAHmME9rDK0MEFH2oOVjeTF0n=J6=Hsk9e5Hyj2GDnFk8V3LtwA@mail.gmail.com>
 <89D5D16F-84AF-4FC6-9AA1-55EFCB6A3B9E@danrl.com>
 <CAHmME9popkFYu-am43TMCc6NcPtUA5dYRWPuTDJS-B69L73_cQ@mail.gmail.com>
 <40FCA8CB-1FAA-42AF-B229-8692568F8226@danrl.com>
 <59811706-CB39-4A8F-823B-9B270ABFD211@danrl.com>
 <CAHmME9p8KwzZONpAk=hF1GBQ_psR6Hjgv5yAxvogHxvm4KpfSg@mail.gmail.com>
 <C11142B8-C7EA-4B18-A86C-2981549D0641@danrl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 20 Dec 2016 19:27:55 +0100
Message-ID: <CAHmME9pH-eZ5OtjSCb58exqz0kKnJDcFrScoKqmoFP0m1Ur0wQ@mail.gmail.com>
Subject: Re: openwrt route_allowed_ips is inprecise
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
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

Hi Dan,

On Tue, Dec 20, 2016 at 3:51 PM, Dan L=C3=BCdtke <mail@danrl.com> wrote:
> I see what you mean now. Don't see a real problem there despite ugliness,=
 but let me think of a solution. May not be my highest priority right now, =
though.

Solutions:

0) Do nothing.
1) Make netifd deal with it.
2) Sort the endpoints allowed IPs by cidr, and call `ip route get`
before each `ip route add`.
3) Compute the set difference in bash between the addresses of the
interface and the allowed-ips of the interface, and only `ip route
add` the difference.
4) Compute the set difference using sipcalc or ipcalc between the
addresses of the interface and the allowed-ips of the interface, and
only `ip route add` the difference.
5) Bug me to add this functionality to wg(8), and receive frustrating
responses like "wg(8) isn't supposed to touch any of the info that
ip(8) has due to future tool merging plans."

Jason
