Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5dfbfcd5
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 16:38:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64362215
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 16:38:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3cfaf772
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 16:38:34 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id q132so15057824lfe.3
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jul 2016 09:38:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160707150059.GA679@wolff.to>
References: <CAA5ikozfeQAFGx8Yi9d=1r5gkHNnq6e0yHFVLXHdVYD_V_Wwfg@mail.gmail.com>
 <CAHmME9oN9NU8fHTjfW6ougLf4u9ZfUHJ11MxDf3RhbC5n64g3g@mail.gmail.com>
 <CAA5ikozn+uj+FPG1eLAR9uS+Lxqiab4+dMUhmBmyg9oBiWFQEg@mail.gmail.com>
 <20160707131324.GA18014@lud.polynome.dn42>
 <CAA5ikoypGoMip+DS=Ud-dNRZOf-8m+MDtV5JobLr1MBmAdRS=A@mail.gmail.com>
 <20160707150059.GA679@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 7 Jul 2016 18:38:45 +0200
Message-ID: <CAHmME9pcKkjmYgdgH6i3vGbd8iFxOaJDUsbczCU068sZk_pTuQ@mail.gmail.com>
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: text/plain; charset=UTF-8
Cc: Jan De Landtsheer <jan@incubaid.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Client changes endpoint port, why?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Jul 7, 2016 at 5:00 PM, Bruno Wolff III <bruno@wolff.to> wrote:
> On Thu, Jul 07, 2016 at 14:45:22 +0000,
>  Jan De Landtsheer <jan@incubaid.com> wrote:
>>
>>
>> nope, Start with basics, use pub ip to pub ip
>> BTW, can a client run behind NAT ? (I assume not, as AFAICT both need to
>> listen on a port)
>
>
> The one behind nat can hold the tunnel open so the other end can always
> reach it.

This is the thrust of the issue -- holding the tunnel open when
there's no traffic. This needs to be addressed. Started new thread to
discuss this.
