Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78885550
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 02:57:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66057f90
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 02:57:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b972eeae
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 02:57:26 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id o141so48796269lff.1
 for <wireguard@lists.zx2c4.com>; Sun, 13 Nov 2016 18:59:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <215ed362-725f-a236-d236-bc31bf508005@mib-infotech.co.nz>
References: <27cccef1-06d9-74b3-5b8a-912850119a76@cumulusnetworks.com>
 <20161113232813.28926-1-Jason@zx2c4.com>
 <bcc61a59-1fbf-adb6-aa82-2e53821f215d@mib-infotech.co.nz>
 <CAHmME9o8zt+5uq=yuw1jsZZhMRcwLasPjpk=O5tpjcp_+55HNQ@mail.gmail.com>
 <215ed362-725f-a236-d236-bc31bf508005@mib-infotech.co.nz>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 14 Nov 2016 03:59:55 +0100
Message-ID: <CAHmME9pjf8Ue0fbunCX5WJrjp51ow8+9OoeUza-40_ACHLcqPw@mail.gmail.com>
To: John Huttley <john@mib-infotech.co.nz>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Debugging AllowedIps
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Nov 14, 2016 at 3:28 AM, John Huttley <john@mib-infotech.co.nz> wrote:
>
> I'm using gentoo x64. debug USE is enabled

After recompiling with USE=debug, you'll need to remove and then
insert the module:

# rmmod wireguard
# modprobe wireguard

If that doesn't do it, then it means you have dynamic debugging
enabled in your kernel, in which case you'll have to turn on debug
messages via:

# echo "module wireguard +p" >/sys/kernel/debug/dynamic_debug/control

> Nothing but the module startup in /var/log/dmesg

A better more up to date source is generally the output of the `dmesg` command.

> I start the server like this

I assume you're going for a classic client/server topology, in which
the server routes internet traffic. Usually in this case you want
something like:

-- Server --
# ip addr add 192.168.1.254/24 dev wg0
wg0.conf:
[Peer]
PublicKey = ABCD
AllowedIPs = 192.168.1.20/32
[Peer]
PublicKey = DCBA
AllowedIPs = 192.168.1.21/32
[Peer]
PublicKey = ABAB
AllowedIPs = 192.168.1.22/32

-- Client --
# ip addr add 192.168.1.20/24 dev wg0
wg0.conf:
[Peer]
PublicKey = EEEG
AllowedIPs = 0.0.0.0/0
