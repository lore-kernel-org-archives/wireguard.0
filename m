Return-Path: daniel@binaryparadox.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66239a07
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Nov 2017 15:33:41 +0000 (UTC)
Received: from crapcannon.binaryparadox.net (crapcannon.binaryparadox.net
 [151.236.28.84])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1f660a3
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Nov 2017 15:33:41 +0000 (UTC)
Date: Sat, 25 Nov 2017 10:38:55 -0500
From: Daniel McCarney <daniel@binaryparadox.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Easily adding WireGuard to Android ROMs
Message-ID: <20171125153855.GH2122@noir>
References: <CAHmME9q8VbC_brP5BJVTS9YFTNxoiL2owW3gGdmJCpcXtzHgXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9q8VbC_brP5BJVTS9YFTNxoiL2owW3gGdmJCpcXtzHgXw@mail.gmail.com>
Cc: Sultan XDA <sultanxda@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Folks,

On 25/11, Jason A. Donenfeld wrote:
>So, if any of you on this list are into building your own Android ROMs
>and would like to give this a try, don't hesitate to see what happens
>when you link to that repo via the manifest xml. Let me know how it
>goes.

Jason asked me to chime in with my experience running the kernel module
on an Android ROM so far.

I've been running the WG kernel module in a self-built LineageOS 14.1
ROM for a LeEco LePro3 (zl1) device for about a month now. I haven't
been using the GUI userland tool, just the wg/wg-quick command line
tools.

Very pleased so far! Both the performance & battery life are markedly
better than with OpenVPN (no surprises there). No stability problems or
other weirdness to report.

Looking forward to trying out the manifest approach to building a WG
ROM.

Thanks!
