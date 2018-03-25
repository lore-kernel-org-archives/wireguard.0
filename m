Return-Path: larkwang@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 469eaf36
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 16:32:01 +0000 (UTC)
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
 [209.85.217.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ad56f78
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 16:32:01 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id u4so1313669uaf.10
 for <wireguard@lists.zx2c4.com>; Sun, 25 Mar 2018 09:43:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1521919967.1921.32.camel@gmail.com>
References: <1521919967.1921.32.camel@gmail.com>
From: Wang Jian <larkwang@gmail.com>
Date: Mon, 26 Mar 2018 00:43:46 +0800
Message-ID: <CAF75rJBe8amfHP__gQMzAf6cBj933c2yCg4wx4nA2hw98tcVXQ@mail.gmail.com>
Subject: Re: add/remove a peer
To: ST <smntov@gmail.com>
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

2018-03-25 3:32 GMT+08:00 ST <smntov@gmail.com>:
> Hello,
>
> I'm learning WireGuard and have a question regarding adding/removing a
> peer.
>
> Is there something like:
>
> 1) wg add peer ABCDEF... allowed-ips 192.168.88.0/24 endpoint
> 209.202.254.14:8172


>
> 2) similar for removing clients:
>
> wg rm peer ABCDEF...
> or
> wg rm peer allowed-ips 192.168.88.4/32
>
> Is this implemented already or should I file it as a feature request
> somewhere? (if so - where?)
>

You should already read man pages  (man wg).

for adding peer
# wg set wg0 peer peer_pubkey allowed-ips 192.168.88.4/32 endpoint
209.202.254.14:8172

for removing peer
# wg set wg0 peer peer_pubkey remove
