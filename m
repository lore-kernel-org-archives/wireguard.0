Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4af7956a
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 17:45:55 +0000 (UTC)
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
 [209.85.128.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1177acd8
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 17:45:55 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id p53so9147244wrc.10
 for <wireguard@lists.zx2c4.com>; Sun, 25 Mar 2018 10:57:42 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Message-ID: <1522000656.2044.8.camel@gmail.com>
Subject: Re: add/remove a peer
From: ST <smntov@gmail.com>
To: Wang Jian <larkwang@gmail.com>
Date: Sun, 25 Mar 2018 20:57:36 +0300
In-Reply-To: <CAF75rJBe8amfHP__gQMzAf6cBj933c2yCg4wx4nA2hw98tcVXQ@mail.gmail.com>
References: <1521919967.1921.32.camel@gmail.com>
 <CAF75rJBe8amfHP__gQMzAf6cBj933c2yCg4wx4nA2hw98tcVXQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, 2018-03-26 at 00:43 +0800, Wang Jian wrote:
> 2018-03-25 3:32 GMT+08:00 ST <smntov@gmail.com>:
> > Hello,
> >
> > I'm learning WireGuard and have a question regarding adding/removing a
> > peer.
> >
> > Is there something like:
> >
> > 1) wg add peer ABCDEF... allowed-ips 192.168.88.0/24 endpoint
> > 209.202.254.14:8172
> 
> 
> >
> > 2) similar for removing clients:
> >
> > wg rm peer ABCDEF...
> > or
> > wg rm peer allowed-ips 192.168.88.4/32
> >
> > Is this implemented already or should I file it as a feature request
> > somewhere? (if so - where?)
> >
> 
> You should already read man pages  (man wg).
> 
> for adding peer
> # wg set wg0 peer peer_pubkey allowed-ips 192.168.88.4/32 endpoint
> 209.202.254.14:8172

I want a WG (server) to assign an IP to a peer *automatically* if
allowed-ips is not provided when running `wg set wg0 peer`. And then
output it to STDOUT, so it can be passed to the peer (client). The same
can be done if peer's public key is not provided.
This would make addition of new peers(clients) much more easy - both for
sysadmins and for non-tech-savvy clients (the latter will get a ready
made wg0.conf file that they need to save to /etc/wireguard/ and all
they need to do is `wg-quick up wg0`. That's it.)

I don't think it is implemented...

Mr. Donenfeld - would this qualify as a feature request?

Thank you!
