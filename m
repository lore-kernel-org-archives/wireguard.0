Return-Path: rumpelsepp@sevenbyte.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47d4fc69
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Jan 2018 07:38:12 +0000 (UTC)
Received: from coruscant.sevenbyte.org (coruscant.sevenbyte.org
 [45.32.152.104])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f15f7449
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Jan 2018 07:38:12 +0000 (UTC)
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
 [209.85.215.47]) (Authenticated sender: rumpelsepp@sevenbyte.org)
 by coruscant.sevenbyte.org (Postfix) with ESMTPSA id BDA4A4080E
 for <wireguard@lists.zx2c4.com>; Fri, 12 Jan 2018 08:40:49 +0100 (CET)
Received: by mail-lf0-f47.google.com with SMTP id h140so4944483lfg.1
 for <wireguard@lists.zx2c4.com>; Thu, 11 Jan 2018 23:40:49 -0800 (PST)
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
From: Stefan Tatschner <rumpelsepp@sevenbyte.org>
Date: Fri, 12 Jan 2018 08:40:46 +0100
Message-ID: <CAB=oiXb4D+KsaY-2muX=wTXu3q22Mtf3dM-ANbBZcvV=WrYW5g@mail.gmail.com>
Subject: Re: WireGuard in systemd-networkd
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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
> Hi Stefan--
>
> Matthias was suggesting a simply-named meta-package: just "wireguard",
> which would ensure that both wireguard-dkms and wireguard-tools are
> installed.  The advantage there is that you can tell people to do:
>
>    apt install wireguard
>
> and apt make sure the system has the common setup by default :)

Awesome! Thanks for clarifying this.

>
>> I just do
>>
>>   # ifup wg0
>>   # ifdown wg0
>>
>> and it's fine.
>
> i'm glad it works for you, it's always nice to have positive feedback :)

:)

Stefan

>
> happy hacking,
>
>     --dkg
