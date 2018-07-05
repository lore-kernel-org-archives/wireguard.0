Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38c15b07
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jul 2018 13:17:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be711bbd
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jul 2018 13:17:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0493625
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jul 2018 13:15:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 55dda0b2
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jul 2018 13:15:54 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id k12-v6so16791544oiw.8
 for <wireguard@lists.zx2c4.com>; Thu, 05 Jul 2018 06:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAMj-8hS_bJado86_1V9hCyW=+-jO6BDnk1WnZE0EQoDembViEw@mail.gmail.com>
 <d939f3b9-ff51-4b94-fcdc-2e819a98459c@sholland.org>
 <CAMj-8hQFk_UPJO4-KEH8YvK5NOBH5vu23Vu5JM2Gt0srMD_kEg@mail.gmail.com>
 <CAHmME9qcXm65jFbGv24m-Pzx9c+nq2-D4y4kBkXk7W6u8HZLiw@mail.gmail.com>
 <CAMj-8hSnvCpY7sZ6xcH=2_Va33M1YsZ97H66PrDSo5=BV9vyOw@mail.gmail.com>
 <CAHmME9qQyw-GxJ-1mLNR_DaWspOO8Enc+gKWobvKUcLqZ-Phcg@mail.gmail.com>
 <72472182-2f17-ff6d-f76c-f0fa6c98d45e@sholland.org>
 <CAHmME9qAUveJi6of9TMb_Owffsy-SX+4pQyDMHaz=6COE2CYxQ@mail.gmail.com>
 <CAMj-8hSEgJv=TSfWBEhRTrbiQbtJauLed6miZcFtS03jDPOBZA@mail.gmail.com>
In-Reply-To: <CAMj-8hSEgJv=TSfWBEhRTrbiQbtJauLed6miZcFtS03jDPOBZA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 5 Jul 2018 15:23:38 +0200
Message-ID: <CAHmME9oa5khgLAYT_KnhcOjP7mwmdoZ8JC5tn49H_W+VuYKmEQ@mail.gmail.com>
Subject: Re: Android app whitelist/blacklist feature
To: Eric Kuck <eric@bluelinelabs.com>
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

Hey Eric,

On cursory glance, this looks really good; well done. It might be
desirable to have an easy toolbar icon for deselecting all apps. Great
that you managed to use RecyclerView. We'd like to use that on the
main tunnel list fragment, but haven't done so yet [1] (if you feel so
inclined and want to give it a spin.)

I'll let Samuel do a proper of the code.

Regards,
Jason

[1] https://docs.google.com/document/d/15i0Z750eL_OlUyrypUFLF7Hoi5eoF-dTFWj-Rs4RXGI/edit
