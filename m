Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4f064ea
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 16:09:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07665e8c
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 16:09:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f784b01b
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 16:00:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ae68d234
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 16:00:19 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id h23so4752295oib.5
 for <wireguard@lists.zx2c4.com>; Thu, 08 Mar 2018 08:18:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87efku1vza.fsf@toke.dk>
References: <87efku1vza.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 8 Mar 2018 17:18:47 +0100
Message-ID: <CAHmME9qg=YXoKxEnikkJe1Li5Pq+yASPUhqN5PmGk6Fx=Y3-1Q@mail.gmail.com>
Subject: Re: Another roaming problem
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
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

Hi Toke,

On Thu, Mar 8, 2018 at 3:29 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
> So is there a way to either tell the client not to change its idea of
> the endpoint, or to tell the server to always use a certain source
> address for outgoing packets?

There have been some discussions on adding another [gasp] nob to clamp
an endpoint, for this reason and some other related ones. But the
source address caching is supposed to be sticky. That is -- it's
supposed to be that WireGuard will use the correct source address
based on in the prior incoming packet. I can try to reproduce to see
if perhaps you're uncovering some incorrect behavior here. More
generally speaking, it seems like this problem is occurring for you
because of NAT and so I wonder if a simpler solution would also
involve NAT -- namely, configuring "hair pin" NAT?
