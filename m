Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc393162
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 16:53:37 +0000 (UTC)
Received: from mail-yb0-f175.google.com (mail-yb0-f175.google.com
 [209.85.213.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93c5ba36
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 16:53:37 +0000 (UTC)
Received: by mail-yb0-f175.google.com with SMTP id v12so6862510ybj.5
 for <wireguard@lists.zx2c4.com>; Mon, 04 Dec 2017 09:00:17 -0800 (PST)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: What are the options for stopping and starting?
To: Whit Blauvelt <whit@transpect.com>
References: <20171204160159.GA27666@black.transpect.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <60cd414c-ad17-a6a5-22b5-49d34bedbd85@gmail.com>
Date: Mon, 4 Dec 2017 17:00:12 +0000
MIME-Version: 1.0
In-Reply-To: <20171204160159.GA27666@black.transpect.com>
Content-Type: text/plain; charset=utf-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

On 04/12/17 16:01, Whit Blauvelt wrote:
> Hi,
> 
> Great design on this project. If I can understand some of the
> things the docs don't cover yet, I'll try to write them up.
> 
> The first thing I'm tripping over is the relationship of a
> configuration file, say wg0.conf, to the wg kernel module. I can
> follow the documented examples to get a connection set up; but once
> it's going I'm vague on how to reset it to other values -- perhaps
> another port, or different allowed IPs

wg(8) can dynamically adjust the configuration of an interface -- either
directly on the command-line, or by using 'addconf' or 'setconf' and
giving a (new) configuration file. The former won't erase any existing
configuration that doesn't exist in the new file.

> .... There are some cases where hand-editing of the conf file gets 
> overwritten by some automated process. Does that have something to
> do with the "SaveConfig" flag? What's the theory there?

Interface configuration can be persisted to the configuration file and
restored when the interface is next brought up. This is useful in the
context of dynamic configuration; some other service may have adjusted
your configuration, added or removed peers, etc, and you want this
preserved. That's what the flag you mentioned does.

> More centrally, how does one apply changes through the conf file?
> Most of use are used to user-space daemons, where restarting the
> daemon or having it reload its prefs is standard.

# wg addconf wg0 /etc/wireguard/wg0.conf

Regards,
Aaron Jones

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJaJX8VAAoJEIrwc3SIqzASvO4P/jwHINGo/WnsVO80hASlp+xL
4GQ9sQPOVBvJdLcb1YMEksIf69daWgfgcxRMbX0nL4I5aemOpfwm+bftWwdPCziE
ee25xA+petvusULAFHINbDk7dZHN1p8ugKTWQ/Pet6c4bgFZhRNp4Cs3/vjVsB4+
U+QQQPuY8b8VRChzB4jnpTQvlXvsn9lJYP/5MbsuK9Fcauvde992+YY64vMeBD/R
oi0bvbP/dQO1B+2S07kCcrzwov+UrsMN7+mc1zFoZWmvOkp5I250EqjAS2pJ8AhK
J5FUlvTfHKBUV3Zz/Totx4SgMwutir7Iu9yh+zzxn/s7O36pKJVeqMYBpOdhq+dL
eMrwwCtDoqiIyi3RQsHDCxg+4jINOvdflH3HDqM2w/sPmZe2xLJwNVPIEpAkddR3
yGLp5duZbKKNcM3kMPHeXC73u5RpzuPhIaSk4j67ZnRdkMIyx/D7ad1k4MyOPrUt
/PagvUl3E4eMQDKAc0wOcTOo8+Op/A9bgnxueWy/lTioufx7xZe1dOs9XzrChLN7
CDJbfKEr5NptWi4RdwqgdY+G1tKs/BS3Z6tqWesERgujnaVM2MrAN2Z4WSe3U/3t
PAIPaAYoxV0pc6WHIiXK+SYKL5K4/1oiGkd75QlA+8KhW9HAuu/C7W3EV/h1sAqX
+Q9OHBsc9YPg7Tj6WBKq
=XNLT
-----END PGP SIGNATURE-----
