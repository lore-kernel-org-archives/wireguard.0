Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f4a8ee2
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jul 2016 15:40:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a350370
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jul 2016 15:40:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5d87b560
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jul 2016 15:40:08 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id f93so25484554lfi.2
 for <wireguard@lists.zx2c4.com>; Mon, 11 Jul 2016 08:40:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA5ikowje2HMCXz6dTR4RohHUJOszXbO9Efiinw9bXRaUOq=TA@mail.gmail.com>
References: <CAA5ikozfeQAFGx8Yi9d=1r5gkHNnq6e0yHFVLXHdVYD_V_Wwfg@mail.gmail.com>
 <CAHmME9oN9NU8fHTjfW6ougLf4u9ZfUHJ11MxDf3RhbC5n64g3g@mail.gmail.com>
 <CAA5ikozn+uj+FPG1eLAR9uS+Lxqiab4+dMUhmBmyg9oBiWFQEg@mail.gmail.com>
 <20160707131324.GA18014@lud.polynome.dn42>
 <CAA5ikoypGoMip+DS=Ud-dNRZOf-8m+MDtV5JobLr1MBmAdRS=A@mail.gmail.com>
 <20160707150059.GA679@wolff.to>
 <CAHmME9pcKkjmYgdgH6i3vGbd8iFxOaJDUsbczCU068sZk_pTuQ@mail.gmail.com>
 <CAA5ikozCC91ZtVPyh5Z7tEc6pZ+AktguYc9qTn6bnZPSqEpK0A@mail.gmail.com>
 <CAHmME9oy5OqRFF4b2uRtTf3JLTD-3Y6pG7hTKDpouSyVdJDfzw@mail.gmail.com>
 <CAA5ikoya6SSKbzncBf4_uHP17Rt-D=d-B5opBxniFX_MupoHRQ@mail.gmail.com>
 <CAHmME9omS1O=oTpm8Pq9D_i0XUj+sW+VU8jLur78tREYzBk__A@mail.gmail.com>
 <CAA5ikowje2HMCXz6dTR4RohHUJOszXbO9Efiinw9bXRaUOq=TA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 Jul 2016 17:40:46 +0200
Message-ID: <CAHmME9q7-0+gwPOgy3f+JcBOsgXshhKsmj9Nu61y0NXa=zuCOg@mail.gmail.com>
To: Jan De Landtsheer <jan@incubaid.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Client changes endpoint port, why?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Jul 11, 2016 at 2:16 PM, Jan De Landtsheer <jan@incubaid.com> wrote:
> \o/ A LOT better now :-)
> Great!

Good to hear. I assume you tested with the snapshot I published this morning?


>
> I'll dig in deeper... Is there a way that the kernel module logs
> connection/disconnection/ip migration ?

You can get lots of junk in your dmesg if you compile with `make debug`.
