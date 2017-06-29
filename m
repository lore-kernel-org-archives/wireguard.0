Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id caca1b4b
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 17:07:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 044ec4d2
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 17:07:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bc247db
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 17:20:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 73af5b2d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 17:20:48 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id k67so192352263wrc.2
 for <wireguard@lists.zx2c4.com>; Thu, 29 Jun 2017 10:24:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2918068.8WQJdSgOSh@travesty>
References: <2918068.8WQJdSgOSh@travesty>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 29 Jun 2017 19:23:59 +0200
Message-ID: <CAHmME9pcEGNVPY=2OfVhc6zfZ7huCOqi7TVAFvzFNrJZv30dqQ@mail.gmail.com>
Subject: Re: snapshot 0.0.20170628 broken?
To: Reuben Martin <reuben.m.work@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello Reuben,

I've tried several things to try to reproduce this, in different
network configurations, and I'm entirely unable to. Could you provide
more details? Like the output of:

wg
ip link
ip addr
cat /proc/cpuinfo
cat /proc/version
lspci
lsusb
lshw
lsmod
lsb_release -a
cat /sys/module/wireguard/version
dmesg
nping --tcp wireguard.io -p 80 -c 1 -vv

For each of the three systems?

Thanks,
Jason
