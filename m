Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20145C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:06:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4DEF2081B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:06:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFbX10gp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4DEF2081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4c30150;
	Fri, 6 Sep 2019 19:06:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f92adf3
 for <wireguard@lists.zx2c4.com>; Wed, 4 Sep 2019 13:10:11 +0000 (UTC)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b03809a7
 for <wireguard@lists.zx2c4.com>; Wed, 4 Sep 2019 13:10:11 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id o101so20482795ota.8
 for <wireguard@lists.zx2c4.com>; Wed, 04 Sep 2019 06:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LHJW0F8CLUICsmfycCb3JTyJWU113sWfT8GfnN+AyPg=;
 b=gFbX10gp/RxDIDL0eC8zLTydIG2iOinaUTqtGUol6vDJCw8+trmpzuQuFjLtYj8UqM
 SwXI/lHPMMxXIP1et5hMYXhDuq0i8A5GdQFAmA9xOJ2uvavCDtv9ab39S0zZQWg207DO
 u1x50e+WXVfgJgLB/eMmbjSZVpfVSHcp359A15Ue42M77HQe0DJAGo7aySl5QIp4YGw+
 6J7lv2b3JuZ3IYOfV3yaBxKcNJfueyBTfmMtRjkKIZ81/AgY6sT9G+0Dbmj7eCEvqoIz
 GnrMfU0YT1Yta5rkupQygCLgvzSqmsS+SLhA6LN51AdlD9qdK6/q6GNRp9pZFbqRXfrW
 f8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LHJW0F8CLUICsmfycCb3JTyJWU113sWfT8GfnN+AyPg=;
 b=lkz899RGQ7OqDLs/VD3/ugGBlkbwKoZYHgvplnLr+EhsTSWtZQ3suh6BGCo+nhefNO
 CFyoCIruwCcQ7/0f8tR8IJAlf16sq9AqOJiJwNgAdULzjlSdIjV6xcJKWcaP1ktgqGaV
 ZqOzg5ubCxzEDyjV6G+kaaHsPWhn4E//nKStqZIRR9aw2m4f2Ly+dLVKLCYHzZQkVsq4
 XsExfy8eOyAhj3FJGY9pKUOdqLHgdhRM4Wb5CS1C3QPwco/ACLbPgL8ettbdUy0b8Mbu
 SYTZSJr3VLCIhkJACvNoaCBYAzRQ18dB7+e/thzuadhF+HtrMWsri1au7QxAke7k/jGw
 A2tA==
X-Gm-Message-State: APjAAAV9q+kX8b/L7dqOOXBm7eqBlbujADKsSDg/8xckf79fjjKCHMxG
 1tEjIwxlna+CO9CLgkLdQuVsbKodTmts6i/iuY3kruAVlfU=
X-Google-Smtp-Source: APXvYqzQ3QBDEL8PqcMp2uq3J9LCbqgcVILl5STvlfNlZ31md15VT3hlPbUagPN2AceROmKaOVnLzAmPKN7v9l+xVIs=
X-Received: by 2002:a9d:7e93:: with SMTP id m19mr8969784otp.283.1567602610323; 
 Wed, 04 Sep 2019 06:10:10 -0700 (PDT)
MIME-Version: 1.0
From: Sebastiano Barrera <sebastiano.barrera@gmail.com>
Date: Wed, 4 Sep 2019 15:09:59 +0200
Message-ID: <CAHo=znZWFs427fDRYPUx3jxjXR01McUFwsOQR9rQy4ocWwyRNA@mail.gmail.com>
Subject: On Windows: Wrong source IP address
To: wireguard@lists.zx2c4.com
Content-Type: multipart/mixed; boundary="000000000000bcebcd0591b9ec0b"
X-Mailman-Approved-At: Fri, 06 Sep 2019 21:06:10 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--000000000000bcebcd0591b9ec0b
Content-Type: text/plain; charset="UTF-8"

Hi all,

I've been looking for a high-performance VPN solution to build a
secure tunnel for a network application we're developing, and
WireGuard has been perfect for us.

I encountered a problem with the Windows version though [1]. It looks
like a bug to me, and I have a workaround (although a dubious one),
but I'd like to have your confirmation/opinion on how to fix it
better.

The context is simple. There are 2 machines:

- A laptop running Windows 10 with a Wi-fi interface
(192.168.1.223/24) and an Ethernet interface (192.168.71.1/24);

- another computer running Linux is connected to it through an
Ethernet cable (local address 192.168.71.2/24)

I set WireGuard up on both sides as usual (public keys, allowed IPs,
etc.). From the logs on the Windows side ("Logs" tab on the GUI), it
looks like the handshake is sent, but always fails. Running tcpdump on
the Linux side, one can immediately see what the issue consists in
(59874 and 53187 are the UDP ListenPorts of the two WireGuard
instances):

$ sudo tcpdump -n -i eno1 udp port 59874 or udp port 53187
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eno1, link-type EN10MB (Ethernet), capture size 262144 bytes
14:51:36.011169 IP 192.168.71.2.53187 > 192.168.71.1.59874: UDP, length 148
14:51:36.013757 IP 192.168.1.223.59874 > 192.168.71.2.53187: UDP, length 92
14:51:41.096679 IP 192.168.71.2.53187 > 192.168.71.1.59874: UDP, length 148
14:51:41.122407 IP 192.168.1.223.59874 > 192.168.71.2.53187: UDP, length 92

As you can see, the handshake request is sent from 192.168.71.2 (Linux
computer) to 192.168.71.1 (Ethernet interface of the Windows
computer), but the response has source address 192.168.1.223, which is
the address of the *Wi-fi* interface of the Windows computer, even
though the packet has correctly come out of its Ethernet interface!

I've tried looking into the issue in the source code, and I can see
that the Windows client continuously queries the routing table to see
which is the default route, and binds its v4/v6 sockets to the
corresponding interface.  This interface's address is what ends up
wrongly as the source address of the packets, as shown in the tcpdump
output above, since the default route goes through the Wi-fi to get to
the internet. Skipping this operation seems to solve the issue
completely (see attached patch).

The question is: am I missing something? If skipping the binding of
the socket to the interface solves this issue, what is the purpose of
this step at all? I'd love to produce a real fix for this issue and
contribute it upstream, but I'd rather know your view on this issue
first.

Keep up the good work. Thanks a lot,
-Sebastiano Barrera

[1] https://github.com/WireGuard/wireguard-windows

--000000000000bcebcd0591b9ec0b
Content-Type: application/octet-stream; name="disable_binding.patch"
Content-Disposition: attachment; filename="disable_binding.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k059vp8g0>
X-Attachment-Id: f_k059vp8g0

//5kAGkAZgBmACAALQAtAGcAaQB0ACAAYQAvAHQAdQBuAG4AZQBsAC8AZABlAGYAYQB1AGwAdABy
AG8AdQB0AGUAbQBvAG4AaQB0AG8AcgAuAGcAbwAgAGIALwB0AHUAbgBuAGUAbAAvAGQAZQBmAGEA
dQBsAHQAcgBvAHUAdABlAG0AbwBuAGkAdABvAHIALgBnAG8ADQAKAGkAbgBkAGUAeAAgAGMAMQA3
ADIAMgBjADQALgAuAGQAMAA1AGMAZQBmADEAIAAxADAAMAA2ADQANAANAAoALQAtAC0AIABhAC8A
dAB1AG4AbgBlAGwALwBkAGUAZgBhAHUAbAB0AHIAbwB1AHQAZQBtAG8AbgBpAHQAbwByAC4AZwBv
AA0ACgArACsAKwAgAGIALwB0AHUAbgBuAGUAbAAvAGQAZQBmAGEAdQBsAHQAcgBvAHUAdABlAG0A
bwBuAGkAdABvAHIALgBnAG8ADQAKAEAAQAAgAC0ANAA0ACwAMQAxACAAKwA0ADQALAAxADEAIABA
AEAAIABmAHUAbgBjACAAYgBpAG4AZABTAG8AYwBrAGUAdABSAG8AdQB0AGUAKABmAGEAbQBpAGwA
eQAgAHcAaQBuAGkAcABjAGYAZwAuAEEAZABkAHIAZQBzAHMARgBhAG0AaQBsAHkALAAgAGQAZQB2
AGkAYwBlACAAKgBkAGUAdgBpAGMAZQAuAEQAZQB2AGkAYwBlACwAIABvAHUAcgBMAFUADQAKACAA
CQAqAGwAYQBzAHQATABVAEkARAAgAD0AIABsAHUAaQBkAA0ACgAgAAkAKgBsAGEAcwB0AEkAbgBk
AGUAeAAgAD0AIABpAG4AZABlAHgADQAKACAACQBpAGYAIABmAGEAbQBpAGwAeQAgAD0APQAgAHcA
aQBuAGQAbwB3AHMALgBBAEYAXwBJAE4ARQBUACAAewANAAoALQAJAAkAbABvAGcALgBQAHIAaQBu
AHQAZgAoACIAQgBpAG4AZABpAG4AZwAgAHYANAAgAHMAbwBjAGsAZQB0ACAAdABvACAAaQBuAHQA
ZQByAGYAYQBjAGUAIAAlAGQAIgAsACAAaQBuAGQAZQB4ACkADQAKAC0ACQAJAHIAZQB0AHUAcgBu
ACAAZABlAHYAaQBjAGUALgBCAGkAbgBkAFMAbwBjAGsAZQB0AFQAbwBJAG4AdABlAHIAZgBhAGMA
ZQA0ACgAaQBuAGQAZQB4ACkADQAKACsACQAJAGwAbwBnAC4AUAByAGkAbgB0AGYAKAAiACAAKgAq
ACoAIABOAE8AVAAgAGIAaQBuAGQAaQBuAGcAIAB2ADQAIABzAG8AYwBrAGUAdAAgAHQAbwAgAGkA
bgB0AGUAcgBmAGEAYwBlACAAJQBkACIALAAgAGkAbgBkAGUAeAApAA0ACgArAAkACQAvAC8AIABy
AGUAdAB1AHIAbgAgAGQAZQB2AGkAYwBlAC4AQgBpAG4AZABTAG8AYwBrAGUAdABUAG8ASQBuAHQA
ZQByAGYAYQBjAGUANAAoAGkAbgBkAGUAeAApAA0ACgAgAAkAfQAgAGUAbABzAGUAIABpAGYAIABm
AGEAbQBpAGwAeQAgAD0APQAgAHcAaQBuAGQAbwB3AHMALgBBAEYAXwBJAE4ARQBUADYAIAB7AA0A
CgAtAAkACQBsAG8AZwAuAFAAcgBpAG4AdABmACgAIgBCAGkAbgBkAGkAbgBnACAAdgA2ACAAcwBv
AGMAawBlAHQAIAB0AG8AIABpAG4AdABlAHIAZgBhAGMAZQAgACUAZAAiACwAIABpAG4AZABlAHgA
KQANAAoALQAJAAkAcgBlAHQAdQByAG4AIABkAGUAdgBpAGMAZQAuAEIAaQBuAGQAUwBvAGMAawBl
AHQAVABvAEkAbgB0AGUAcgBmAGEAYwBlADYAKABpAG4AZABlAHgAKQANAAoAKwAJAAkAbABvAGcA
LgBQAHIAaQBuAHQAZgAoACIAIAAqACoAKgAgAE4ATwBUACAAYgBpAG4AZABpAG4AZwAgAHYANgAg
AHMAbwBjAGsAZQB0ACAAdABvACAAaQBuAHQAZQByAGYAYQBjAGUAIAAlAGQAIgAsACAAaQBuAGQA
ZQB4ACkADQAKACsACQAJAC8ALwAgAHIAZQB0AHUAcgBuACAAZABlAHYAaQBjAGUALgBCAGkAbgBk
AFMAbwBjAGsAZQB0AFQAbwBJAG4AdABlAHIAZgBhAGMAZQA2ACgAaQBuAGQAZQB4ACkADQAKACAA
CQB9AA0ACgAgAAkAcgBlAHQAdQByAG4AIABuAGkAbAANAAoAIAB9AA0ACgA=
--000000000000bcebcd0591b9ec0b
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--000000000000bcebcd0591b9ec0b--
