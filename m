Return-Path: <SRS0=8LYU=AY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E285C433E4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:55:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4737520825
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:55:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScivhPnS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4737520825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22da8fbd;
	Mon, 13 Jul 2020 23:33:29 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fff78606
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Jul 2020 23:10:21 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id a1so404435edt.10
 for <wireguard@lists.zx2c4.com>; Fri, 10 Jul 2020 16:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=QwQ33XOHnaeRonBh5oeDoz7k5yglhM3O84gphYnWvEw=;
 b=ScivhPnS4UvDoc8+fFz3prPOJhefq/ClbeUjD7oEIPHHNiDyxZK9U3qIf+Vs1Nda9d
 5xv0oUO5xFjWiVqg5KKKkCJK1zXRnTAIjPeMSh1q3I1toOhewxH9RlwDcnqPAV8maR0o
 0hzMxQnorMYIW9IklKDHedTyxFa6gAcnf579J+HLaNJa179z7H1RxrKhO4K8EM0SfHDk
 as5EifOGmZw6bMmn8gVrTYox7Miy5sAp4gGd9/DqSrC/sT8h0jJh8LWbHHY5GsOh8KTA
 3JAMB+VyAYVVpCodL8xeadPsXvgkR+1cNxdMCIWf4dOZFcB84adhFIwZWHwCMFAtVomB
 s4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QwQ33XOHnaeRonBh5oeDoz7k5yglhM3O84gphYnWvEw=;
 b=oy3k9UQmWV5gzlDw5Hq6G9Zrfu3WOKq4IVm0z+QWMaTiqqdQjlpnN03z6O0LKAOgg1
 1EcnLZvzHSysvVuHlVfjbRuRUCOawvkAjcNlRbPEQZpSEwAVURLxF04+fWHIXOoN5JhK
 M6ilOMXmstLdkLflfTUlEjG93po7ZQrfGfr2c+KnAkRBLwe//5GtnFFlch0/7AWoR0N0
 LZeXlvmdFVszodJN7vZdzV8p9ujgd3WzT3FTVYMaNSvwHR636gECODmgCPW6d2Nc+lKv
 pJ3au8efZDaLaAUBq4Na7flJhqmEXnpskD6q3injrFVYljI4Rf3FeMJa1B13tauUqWVD
 fKUw==
X-Gm-Message-State: AOAM5336cpCIJkDhg/VLpdSBvVDHZUXF4sZi3zWflX98JmCqBnrhRt2t
 TVBLlg5nvQganTX8a8XfAu6WpeOKptHJKBm8cNbuPOgIY7M=
X-Google-Smtp-Source: ABdhPJyIs7oY6haamM1xPqCy9gS7Fpnjk6/8yX4gr1ws6XdzYjAU6C7kVGFJ+aj3zSFV2weWHa/KWnFCobxo5ocs1xA=
X-Received: by 2002:a05:6402:1c86:: with SMTP id
 cy6mr65313409edb.30.1594423889100; 
 Fri, 10 Jul 2020 16:31:29 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Burkett <burkett.andrew@gmail.com>
Date: Fri, 10 Jul 2020 16:31:18 -0700
Message-ID: <CAONL4-JqcxN9gtjH+3GFOsfqM8AcoYdsL3Jvf4aWGG=aF0q+pQ@mail.gmail.com>
Subject: DNS Issues with Wireguard for Windows
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 14 Jul 2020 01:33:28 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
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

I was running into dns issues with wireguard on windows using the
released gui app. It seems like a bug with wireguard, but not sure if
it was actually something about my networking configs that messed it
up. I was able to work around the issue by changing the wireguard
config (in a way that seemed odd to me), but I thought it might be
useful to share what I was seeing in case its helpful to others or if
it is in fact a bug in wireguard. I'll share the configs at the bottom
of the email, but I'm just going to describe what I'm seeing first.

My basic setup is I have wireguard running on a linux box functioning
as a server/router to a remote network. I've got a windows desktop
connecting to the linux box via wireguard. There are dns servers on
the remote network that I would like to use from the desktop. I added
the dns servers from the remote network to my desktop wireguard
config. Everything was working fine for awhile. At some point, my
windows box started complaining about not being connected to the
internet. I was able to pinpoint it with some confidence to dns
requests failing when wireguard was connected. Even though windows was
complaining about not having a network connection, my browser still
worked though it seemed slow so I assumed it was trying a dns server
and then falling back to a different one after a timeout (at least
that was my guess). The "cause" of the problem was adding
192.168.7.12/32 to the AllowedIPs on the peer (the wireguard network
in my case is 10.98.1.0/24 and the rest of the network is under
10.0.X.X) After adding it and waiting for a couple hours windows will
inevitably claim that there is no internet access from my network
adapter. Sometimes nslookup and ping still work fine, sometimes they
start to report errors. My solution that reliably fixes it is to add
my local dns server (which is my local router in this case
192.168.86.1) to the dns section of the wireguard config, which seems
like an odd fix since I'm not actually sending local dns traffic to
wireguard.

I couldn't figure out how to use wireshark to view wireguard traffic
on windows to see what's happening to the dns requests, nor do I know
of another way to view traffic (If someone wants to point me at how to
do that, or some other way to view network traffic on windows, I'm
happy to look at it).

Anyway, thanks for the software. It's the best vpn software I've used by a mile.

Andrew

My Local Gateway/DNS is 192.168.86.1
My Local IP is in 192.168.86.0/24 subnet

Working Config 1

[Interface]
PrivateKey = XXXXX
Address = 10.98.1.103/32
DNS = 10.0.X.X, 10.0.Y.Y

[Peer]
PublicKey = XXXXXX
AllowedIPs = 10.0.0.0/16, 10.98.1.0/24
Endpoint = XXXXXXX

Working Config 2

[Interface]
PrivateKey = XXXXX
Address = 10.98.1.103/32
DNS = 10.0.X.X, 10.0.Y.Y , 192.168.86.1

[Peer]
PublicKey = XXXXXX
AllowedIPs = 10.0.0.0/16, 10.98.1.0/24, 198.168.7.12/32
Endpoint = XXXXXXX

NonWorking Config

[Interface]
PrivateKey = XXXXX
Address = 10.98.1.103/32
DNS = 10.0.X.X, 10.0.Y.Y

[Peer]
PublicKey = XXXXXX
AllowedIPs = 10.0.0.0/16, 10.98.1.0/24, 198.168.7.12/32
Endpoint = XXXXXXX
