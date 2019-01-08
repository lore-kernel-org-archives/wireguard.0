Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BB9C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 08:01:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D272218A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 08:01:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY9tQmPf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D272218A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1d083fb;
	Tue, 8 Jan 2019 07:58:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d78f7238
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 07:58:44 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1702c818
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 07:58:43 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id g62so1518690pfd.12
 for <wireguard@lists.zx2c4.com>; Tue, 08 Jan 2019 00:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nW40f9O8mHm7BN3nEU1rAjM4xNXTueF9E8L0W7ToD4Q=;
 b=lY9tQmPfwYjuUws2q3EZDwtNEQFs9VMjXpeNEd6ZrX5Y0m6MpLWczCH1H+Bm2DQ09y
 HeTycXH006AtqPZE19r6SiPgjysgDXIAO2JXwf3yiZolqo8uWR5/p4EWcuOhOGZF4WMU
 m35JCEBt/XEL1cZBVdaQPaHmScp0he33uTbUkmaxrMPKscg8SpA32TbiETOcpiwgs+B+
 VMaj1URe1hsMwX6uM8k7H3Xjcak4wF8AAbaYMQOumQh4Fbbpj9F/igjq/nk05bXzHHul
 HYYPc+HiGBzDnwT1lv4Cd/urnPkq1/ML0M7LZu7Qzu15rtKfcQZuYonrxHG840Y/Hb2U
 9hHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nW40f9O8mHm7BN3nEU1rAjM4xNXTueF9E8L0W7ToD4Q=;
 b=Ko2q8Tlwo+ZLJd80NkJxXnqifo1+lTcUgQFVEXycUAQ4HEq76WVKyPTlOCNexOvKg7
 RJw5jSfpHezXIJryeL2avWA384YyIbJZ5VxO2bwignn+IQiNrJBM9ytlAGP5KrYkA7/+
 ZdCuN0Geu5TLXl+016Psxt2ylJfYN+omnJXe+9xO7LFKejGTxd+I25SYuUN7RaIuq5LW
 ls/4nF2/TzCwXaHtvN9dRrLsGbjfrMHjmvYd/ClcXUWmrFzyQ1eEbxBTm1yxOjA8+GfN
 UJGaszvgzoT90wdMRl4TqCYZNSSVR7EMWrzqGxBz1mlP2rMt2sstubQb0KBD/3Q89A5q
 f8Bg==
X-Gm-Message-State: AJcUukdVxKi9diskKuZl5ye4VYyxBJ/WNhSUrMxrygRYurWNrJz4rE+g
 WLy0n6l1vBIffnbF7eDWii595zjY6BscaVqkm+U=
X-Google-Smtp-Source: ALg8bN6CftZL0+tzL5ny7RWyvdpmm+vdmfKe636QDZlku/uoptQJToTMZrapLGff4gD5xuscwCfcbZ0IJP9Ic7Aazdw=
X-Received: by 2002:a62:184e:: with SMTP id 75mr748998pfy.28.1546934509503;
 Tue, 08 Jan 2019 00:01:49 -0800 (PST)
MIME-Version: 1.0
References: <CAGCGytL90oVSVe_VNKszSynq_gvNzKGwORk8LEacXMANVaD2zA@mail.gmail.com>
In-Reply-To: <CAGCGytL90oVSVe_VNKszSynq_gvNzKGwORk8LEacXMANVaD2zA@mail.gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Tue, 8 Jan 2019 09:01:38 +0100
Message-ID: <CAKXLc7cRqa+22pVnJvErGMpBd1-TWXNrjzfQE3q2=uqbnFq2Cw@mail.gmail.com>
Subject: Re: issue with certain apps + wireguard
To: Arpit Gupta <g.arpit@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Tue, Jan 8, 2019 at 3:22 AM Arpit Gupta <g.arpit@gmail.com> wrote:
> A new user here. Recently setup wireguard to run on my pi 3 + pi hole. I am noticing some interesting behavior with certain apps.
>
Apps running where? Name your hosts (fakename if you prefer) for clarity.

> When using Google Duo on my android phone it would not work if wireguard was configured in split tunnel mode. When i enabled all traffic via wireguard it worked fine.
>
"android phone"? How does it connect to where?

> Downloading app updates my phone when on wireguard would not work regardless if it was split tunnel or all traffic was being routed via wireguard. Interestingly installing an app did not have any issue.
>
Is there wireguard tunnel starting from "phone" (end ending where?), or no?

> Another issue i noticed is when i try to open lets say a pdf attachment in my browser from gmail it gets stuck in downloading state. I then turn off wireguard and then it works fine.

> I am noob in the matters of VPN, security, network etc so i wanted to see if people had thoughts on how i can debug this further to determine if this is an issue with the wireguard app on my phone vs the peer running on my pi and if there are certain types of apps i should add to my exclude list. Right now i have added google duo and play store to it.
>
For a start, get one or two levels below "Google store", "app" and so
on. Test with simple tools, possibly platform agnostic (ping,
wget/curl).
In IP networks, data travels in packets, apps talk via sockets and
send those packets. Packet flow can be observed via Wireshark
(tcpdump, thsark) and can be recorded in a packet capture (pcap file).
Linux networking is flexible enough to allow non-working
configurations (or working not in the way one thinks);
examining/sharing (running) configurations is a key point (`ip addr;
ip route; wg; cat /etc/resolv.conf; ping -c3 8.8.8.8` commands run as
root might help).

> I have confirmed pi hole is not causing issues as when i disable wireguard applications are working fine and still using pi hole dns.
>
Since you have "working" and "non-working" state (i.e. when you
"enable wireguard"), compare (diff) the two and try to understand what
changes (execute the commands and record their output in a text file
before and after:
<reboot>
bash -c "ip addr; ip route; wg; cat /etc/resolv.conf; ping -c3
8.8.8.8" >test.good 2>&1
<enable wireguard>
bash -c "ip addr; ip route; wg; cat /etc/resolv.conf; ping -c3
8.8.8.8" >test.bad 2>&1

Then compare test.{good,bad} with a diff utility (diff, sdiff,
gvimdiff, etc.). When you have more than one host involved, do that
for each host before/after.

Cheers,
Kalin.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
