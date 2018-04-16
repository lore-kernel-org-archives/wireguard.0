Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54377de3
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 00:59:10 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98dd61c4
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 00:59:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87e911b2
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 00:50:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 36ca2e88
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 00:50:18 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id h8-v6so4551778otj.7
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 18:13:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+bb15vcb+FVpg8cda9QxSDHED2ACjLiYp6nxBCi6BG9P0G4EA@mail.gmail.com>
References: <CA+bb15uz7jkD2GZhSQANkH9JPi5Sq2g20wrm0avTRFiOMJ55iA@mail.gmail.com>
 <20180415235801.411a50af@natsu>
 <CAHmME9o=N+Qhnst=ep6Cax+rPNhJLRmP-Ha7E=bfVoJhUq9gXA@mail.gmail.com>
 <CA+bb15vcb+FVpg8cda9QxSDHED2ACjLiYp6nxBCi6BG9P0G4EA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 16 Apr 2018 03:13:36 +0200
Message-ID: <CAHmME9qTwbd6pR1jLsXVmTKJF4319ARta50ELDmVvaQviMrAsw@mail.gmail.com>
Subject: Re: Why does 'allowed-ips' affect route selection behavior?
To: "Patrick O'Sullivan" <irish@insaneirish.com>
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

Hi Patrick,

> I suppose I was a victim of WireGuard's simplicity. I got it up and
> running so quickly that I didn't bother to dig into the individual
> components more than necessary at first. I ultimately may end up
> foregoing wg-quick, but either way I now understand the mechanics to
> accomplish what I want.

Since you know what you're doing, you're probably best served by
getting rid of wg-quick and doing things manually. I suspect in the
end the setup will be /simpler/ when done without wg-quick in the way.
(wg-quick itself is just a silly bash script.)

Jason
