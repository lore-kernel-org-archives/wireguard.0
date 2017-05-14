Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b888b051
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 May 2017 10:39:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2da5885a
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 May 2017 10:39:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1eebfad1
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 May 2017 10:39:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a65eacc3
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 May 2017 10:39:00 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id l18so104588561oig.2
 for <wireguard@lists.zx2c4.com>; Sun, 14 May 2017 03:50:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170514104817.GA29758@kroah.com>
References: <20170513073721.GD22218@tuxmachine.polynome.dn42>
 <CAHmME9pgLtP4z-vvuHxH4ST2f6ZeHhKZXM8FnyrRnxojYDsGGQ@mail.gmail.com>
 <20170514095552.GB7227@tuxmachine.polynome.dn42>
 <20170514104817.GA29758@kroah.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 14 May 2017 12:49:59 +0200
Message-ID: <CAHmME9rxGD6gWoW0Q71YN4dn_J4bRD7rk1x_2ihgb0sn0r4Dbw@mail.gmail.com>
Subject: Re: Performance of Wireguard on Infiniband 40G
To: Greg KH <greg@kroah.com>
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

Hey Greg,

On Sun, May 14, 2017 at 12:48 PM, Greg KH <greg@kroah.com> wrote:
> 4.9 is 6 months old, I'd be curious if 4.11 is any faster given the rate
> of change in the network stack :)

I imagine it might be. I think the biggest bottle neck, in any case,
is still the poor algorithm in padata. Hopefully we'll get this sorted
with the help of Samuel's research this summer!

Jason
