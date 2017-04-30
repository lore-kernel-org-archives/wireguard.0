Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2d70261
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Apr 2017 14:45:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afb783d2
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Apr 2017 14:45:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 205c686a
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Apr 2017 14:45:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 53902c51
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Apr 2017 14:44:59 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id x184so68318756oia.1
 for <wireguard@lists.zx2c4.com>; Sun, 30 Apr 2017 07:54:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKJBWRei3fx6Sd9ooTL5-DJOsf8QPwZAZoeBkn1bspRcq-ENwA@mail.gmail.com>
References: <CAKJBWRfDRi9KGM_OJwgN2ZaQ9a56Gxshh=apnj5j9ish-WOOcg@mail.gmail.com>
 <CAHmME9obiOSUAxaOEFk64VDH=8KRGOrA957RZVdAjHYDGsm0AQ@mail.gmail.com>
 <CAKJBWRckpjWWKcUZDAtvFoG87hGG9wcKBbvY_JVeHXoptZUYaw@mail.gmail.com>
 <CAHmME9qx9P4dwgkaiODQVdoh8X+c_Lyvp+QL95Gqntn+SPvTcA@mail.gmail.com>
 <CAKJBWRei3fx6Sd9ooTL5-DJOsf8QPwZAZoeBkn1bspRcq-ENwA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 30 Apr 2017 16:54:15 +0200
Message-ID: <CAHmME9pMWCEQOJA1QmqhSz5HVH4LcOxwOu=+UgNCDCFABBB-PA@mail.gmail.com>
Subject: Re: do a client behind NAT needs to define listening port?
To: Rostislav Belotserkovski <rost.bel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Yes.

If you're behind NAT, and want a server to be able to establish a
connection to you, enable PersistentKeepalive.
