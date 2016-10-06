Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91227b64
 for <wireguard@lists.zx2c4.com>; Thu, 6 Oct 2016 17:24:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1616d29
 for <wireguard@lists.zx2c4.com>; Thu, 6 Oct 2016 17:24:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f6bcf5d2
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Oct 2016 17:24:22 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id b81so22932355lfe.1
 for <wireguard@lists.zx2c4.com>; Thu, 06 Oct 2016 10:35:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1475771658.1684011.747950545.01B63CCC@webmail.messagingengine.com>
References: <1475719977.650386.747317105.1837502D@webmail.messagingengine.com>
 <20161006150310.GB30704@wolff.to>
 <1475771658.1684011.747950545.01B63CCC@webmail.messagingengine.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Oct 2016 19:35:48 +0200
Message-ID: <CAHmME9o4Mn1+4pBVbpioe7Bhx-CaSt=74XaOpeYdSk5MTMDZ+A@mail.gmail.com>
To: Jehan Tremback <jehan@altheamesh.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] auth-only wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Oct 6, 2016 at 6:34 PM, Jehan Tremback <jehan@altheamesh.com> wrote:
> Let me be more specific about my application. I'm trying to create a
> system where routers in a "mesh" network (mixed ad-hoc wifi and
> ethernet) pay their neighbors, or are paid by their neighbors for
> bandwidth. To make this happen, I've got to be able to identify traffic
> from specific neighbors with something less spoofable than MAC
> addresses. Creating tunnels between neighbors fits the bill for now, and
> gives me a good handle to apply traffic shaping to different neighbors.
> The encapsulating tunnel packet will have the source IP address of the
> previous hop neighbor, and will be sent to the next hop neighbor, and
> can be prioritized . Authentication keeps anyone from spoofing addresses
> and stealing bandwidth.

And encryption keeps various neighbors traffic hidden from passive
eavesdroppers. Do your customers a service; encrypt their traffic
wherever possible.

>
> Anyway, I'm experimenting with fastd right now, and it's working, but
> WireGuard seems like a very nicely designed and executed piece of
> software so I thought I'd ask. I understand that WireGuard is designed
> to be very focused on a traditional VPN server usecase, so more
> configurability may not be something you want to support.

WireGuard isn't very focused on any particular use case. It certainly
aims to be something directly applicable for what you have in mind.
Recently we've been talking with a large community run ISP that
extends across Germany that does some interesting and complicated mesh
networking to bring affordable internet everywhere. They're currently
using fastd, too, but I believe are in a transition to WireGuard,
because the performance is substantially better than fastd.

>
>> Without encryption you authentication won't be useful against attackers
>> that can modify packets or insert packets with the source address of your
>> contact.
>
> Isn't this exactly what authentication prevents? If the signature does
> not match the sender and the packet content, it will fail authentication
> by definition, at least by any definition of authentication that I am
> familiar with.

I was confused by Bruno's statement too with more or less your exact
same reaction.
