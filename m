Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa2e3c77
 for <wireguard@lists.zx2c4.com>; Sat, 9 Jul 2016 14:46:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee1b672c
 for <wireguard@lists.zx2c4.com>; Sat, 9 Jul 2016 14:46:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 814f1c0e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 9 Jul 2016 14:46:44 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id f6so44457271lfg.0
 for <wireguard@lists.zx2c4.com>; Sat, 09 Jul 2016 07:47:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA5ikoya6SSKbzncBf4_uHP17Rt-D=d-B5opBxniFX_MupoHRQ@mail.gmail.com>
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
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 9 Jul 2016 16:46:58 +0200
Message-ID: <CAHmME9omS1O=oTpm8Pq9D_i0XUj+sW+VU8jLur78tREYzBk__A@mail.gmail.com>
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

On Sat, Jul 9, 2016 at 4:36 PM, Jan De Landtsheer <jan@incubaid.com> wrote:
> I'll check it out. I'm traveling now, will check tomorrow.
> Jan

No problem. There are further improvements to that right now in the
authenticated-persistent-keepalive branch. If you wait til next week,
I'll have an even better snapshot then.
