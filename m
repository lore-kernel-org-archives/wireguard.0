Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60dc4929
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 00:35:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef7dc4e1
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 00:35:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39949f96
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 00:54:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ba1d4200
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 00:54:11 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id c77so25369173oig.0
 for <wireguard@lists.zx2c4.com>; Thu, 05 Oct 2017 18:04:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANcRkim=9nUOQT5abRfTOVfXzVc1wAo+b_hNQjugHsxABhiWVw@mail.gmail.com>
References: <CANcRkik-gjJqz89FFtAXPC2_ixi8uZv6wDTTOOsjJqNieiDPKg@mail.gmail.com>
 <CAHmME9qHxvQc63ubFxv7KvrrJ0J26q6dSJPi4YYjjqs=cDDhxg@mail.gmail.com>
 <CANcRkim=9nUOQT5abRfTOVfXzVc1wAo+b_hNQjugHsxABhiWVw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Oct 2017 03:04:19 +0200
Message-ID: <CAHmME9p9v-eZvj_-23y1+Pa3pDTV7Gug7MBYz_-X+xVUXMS03A@mail.gmail.com>
Subject: Re: wireguard bypass question
To: Ryan McGee <rwm.pc.repair@gmail.com>
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

On Fri, Oct 6, 2017 at 3:00 AM, Ryan McGee <rwm.pc.repair@gmail.com> wrote:
> So I set up the VPN using Mullvad's guad here:
> https://mullvad.net/guides/running-wireguard-router/
> The only thing I can think of is maybe the firewall settings in the Mullvad
> guide but I really don't know enough about this kind of stuff. I can follow
> guides and how-tos, but that is about the end of it =)

That guide is horrible. I wouldn't recommend following it.

> Nothing seems to work as netflix still sees me going through a VPN.

Try adding /zx2c4.com/vpnbypass as well as 192.95.5.67, reboot, and
then try to visit zx2c4.com/ip. See then which IP it returns.

If this doesn't work, can you send the output of:

iptables-save
ip rule show all
ip route show table all
ip addr show

And then we'll see what's going on.
