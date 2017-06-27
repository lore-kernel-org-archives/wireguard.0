Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63b16791
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 20:06:15 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 689d9072
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 20:06:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb171947
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 20:19:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3ff04bc2
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 20:19:49 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id i127so38314318wma.0
 for <wireguard@lists.zx2c4.com>; Tue, 27 Jun 2017 13:22:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170627195904.GA14889@zx2c4.com>
References: <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
 <CAHmME9p++Q0v6Ypt2Y5AFZO36hHnTKv7KBnWNnSk84V8YK+oJw@mail.gmail.com>
 <alpine.LRH.2.20.1706261023540.14074@bcny.fcbq.bet>
 <CAHmME9oHG6a1==KzrrfuvmkKoVJHhTtToP00qYtcKXEGDCnm8Q@mail.gmail.com>
 <CAHmME9ph1LQ0kufpf2RMDsMRpz7txWJGvr=d=Jr5Z1kxqqOWfQ@mail.gmail.com>
 <alpine.LRH.2.20.1706262144070.17486@bcny.fcbq.bet>
 <20170627110530.GC3026@zx2c4.com>
 <alpine.LRH.2.20.1706271237180.17486@bcny.fcbq.bet>
 <CAHmME9q8+Y_x8fDZ4n-EmU_NB6+vfBttFQ3S58h+B-j-j8e2Kg@mail.gmail.com>
 <alpine.LRH.2.20.1706272042170.17486@bcny.fcbq.bet>
 <20170627195904.GA14889@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 27 Jun 2017 22:22:45 +0200
Message-ID: <CAHmME9ocHgYQe1gXRrYjJP89Ko+bFs_pt6oZtse7TaL-0KCaJA@mail.gmail.com>
Subject: Re: making wireguard work on RHEL7/etc.
To: wireguard@wut.to
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

Okay, nicer solution found:
https://git.zx2c4.com/WireGuard/commit/?id=1af4fc16054aeab9ef4aac0f9cb42f0dd924bf40
