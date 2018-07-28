Return-Path: celti@celti.name
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 390bd87b
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Jul 2018 21:41:20 +0000 (UTC)
Received: from mail.celti.name (ilmatar.celti.name
 [IPv6:2600:3c01::f03c:91ff:fe69:9008])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7a73f6b
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Jul 2018 21:41:20 +0000 (UTC)
From: Celti Burroughs <celti@celti.name>
To: <wireguard@lists.zx2c4.com>
Subject: Re: [darwin] wg-quick command line flag to prevent disown
Date: Sat, 28 Jul 2018 14:51:00 -0700
MIME-Version: 1.0
Message-ID: <b421cff1-c997-480f-9ea0-8b4bf87affd7@celti.name>
In-Reply-To: <1C82AB17-0F62-4A85-A336-B6A89D79ABBA@posteo.de>
References: <1C82AB17-0F62-4A85-A336-B6A89D79ABBA@posteo.de>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Saturday, July 28, 2018 1:36:21 PM MST, Niklas Buschmann wrote:
> Hello,
>
> I am using macOS=E2=80=99s launchd to create a boot daemon that runs=20
> wg-quick. Now launchd seems to kill the process when wg-quick=20
> calls disown[...]

You can stop launchd from garbage-collecting processes via the
plist property "AbandonProcessGroup". See the section "Careful
With That Fork, Eugene" [1] in the launchd documentation for
details on the whole mess.

~Celti

[1]:=20
https://developer.apple.com/library/archive/technotes/tn2083/_index.html#//ap=
ple_ref/doc/uid/DTS10003794-CH1-SUBSECTION52
