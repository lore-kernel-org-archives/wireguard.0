Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3483182f
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2018 14:59:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54851714
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2018 14:59:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f91be14f
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2018 14:51:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id aa9fb9b7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2018 14:51:04 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id d124so1782531oib.13
 for <wireguard@lists.zx2c4.com>; Thu, 11 Jan 2018 07:02:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87k1wo1pfu.fsf@fifthhorseman.net>
References: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
 <871siz6ouv.fsf@fifthhorseman.net>
 <CAHmME9qrfy4Lf78NkChdv6tPnSFTcGArwgsizAaapL9k=Tc31w@mail.gmail.com>
 <87efmy42c0.fsf@fifthhorseman.net>
 <81bb0726-8f67-0163-875f-0d3403f8df29@urlichs.de>
 <87wp0p1h5j.fsf@fifthhorseman.net>
 <CAB=oiXauSSzhqEgF32spvWmkd3ZaGZfFmy5NEpQmvqxeuDASqw@mail.gmail.com>
 <87k1wo1pfu.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 11 Jan 2018 16:02:30 +0100
Message-ID: <CAHmME9q8_4Ln=OB7_NDTzE3JpTdf8Ae4isJ+qiAVCJJS1qCDcQ@mail.gmail.com>
Subject: Re: WireGuard in systemd-networkd
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>,
 Egbert Verhage <egbert@eggiecode.org>
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

On Thu, Jan 11, 2018 at 2:43 PM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> Matthias was suggesting a simply-named meta-package: just "wireguard",
> which would ensure that both wireguard-dkms and wireguard-tools are
> installed.  The advantage there is that you can tell people to do:
>
>    apt install wireguard
>
> and apt make sure the system has the common setup by default :)

This is a great idea. Let me know if you wind up making this. I've
added Egbert to the CC so that he can make an identical change in the
Ubuntu PPA.

Jason
