Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 26cb4233
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 15:01:34 +0000 (UTC)
Date: Thu, 7 Jul 2016 10:00:59 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: Jan De Landtsheer <jan@incubaid.com>
Message-ID: <20160707150059.GA679@wolff.to>
References: <CAA5ikozfeQAFGx8Yi9d=1r5gkHNnq6e0yHFVLXHdVYD_V_Wwfg@mail.gmail.com>
 <CAHmME9oN9NU8fHTjfW6ougLf4u9ZfUHJ11MxDf3RhbC5n64g3g@mail.gmail.com>
 <CAA5ikozn+uj+FPG1eLAR9uS+Lxqiab4+dMUhmBmyg9oBiWFQEg@mail.gmail.com>
 <20160707131324.GA18014@lud.polynome.dn42>
 <CAA5ikoypGoMip+DS=Ud-dNRZOf-8m+MDtV5JobLr1MBmAdRS=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAA5ikoypGoMip+DS=Ud-dNRZOf-8m+MDtV5JobLr1MBmAdRS=A@mail.gmail.com>
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

On Thu, Jul 07, 2016 at 14:45:22 +0000,
  Jan De Landtsheer <jan@incubaid.com> wrote:
>
>nope, Start with basics, use pub ip to pub ip
>BTW, can a client run behind NAT ? (I assume not, as AFAICT both need to
>listen on a port)

The one behind nat can hold the tunnel open so the other end can always 
reach it.
