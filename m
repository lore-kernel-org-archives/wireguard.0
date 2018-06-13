Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e0345a4
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 01:54:47 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ba0d787
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 01:54:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e99ad68
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 01:53:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dd2fe4bc
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 01:53:34 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id p95-v6so1163736ota.5
 for <wireguard@lists.zx2c4.com>; Tue, 12 Jun 2018 18:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <46bd903565f6b1114b1d9f6bafa7db77bf3b5090.camel@mjr.org>
 <CAHmME9rtHVwfSdy4DDFYmgw06zVerbN8oP88ZZ5ahoJB3PPTFw@mail.gmail.com>
 <CAHmME9qqBFU44wBQ2r3bWk8e7BpGQhY_U6oBg14SJA3Y05aC=A@mail.gmail.com>
In-Reply-To: <CAHmME9qqBFU44wBQ2r3bWk8e7BpGQhY_U6oBg14SJA3Y05aC=A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Jun 2018 03:58:25 +0200
Message-ID: <CAHmME9qW8udKYrcdwgFK6qcabAJ8vDqijek0UcRmFTGTcUdznw@mail.gmail.com>
Subject: Re: Kernel lockup with (debian) 4.16.0-2-rt-amd64
To: paul@mjr.org
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

Hi Paul,

The current patch I'm now considering is here:
https://git.zx2c4.com/WireGuard/patch/?id=17fb4ff6064e10bb91bf2ccf6534bfdf767a9b90

If this works for you, I'll put out a new snapshot.

Regards,
Jason
