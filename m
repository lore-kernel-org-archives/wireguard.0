Return-Path: Jason@zx2c4.com
MIME-Version: 1.0
In-Reply-To: <0bb801d1d3da$bf361960$3da24c20$@tiernanotoole.net>
References: <34EBEFA02A9AAB1F.1117239f-f3e4-4320-907d-9a9edbb083c6@mail.outlook.com>
 <CAHmME9rL4jdWQV66hGOSbY5yymVXatq67bMjEJwVBFTxNRB-uA@mail.gmail.com>
 <045201d1d2b3$3eaa6b70$bbff4250$@tiernanotoole.net>
 <CAHmME9oa+k0h9s62ts5DpqqWiSnf6zQRfCZyeOCXNsObOHyVDA@mail.gmail.com>
 <FE551DD9-28B0-4B3D-89F3-EB0F142AB48B@tiernanotoole.net>
 <20160701093751.GA28109@lud.polynome.dn42>
 <CAHmME9oAU2GBjTw8Aschv=-ey1nvCbcoof5C+Hdchx+cvJitQw@mail.gmail.com>
 <0bb801d1d3da$bf361960$3da24c20$@tiernanotoole.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 1 Jul 2016 23:14:21 +0200
Message-ID: <CAHmME9rzfr38ek74v4Giz1HaBPOAS=qMTwkHoOr3cQKV-jgncw@mail.gmail.com>
To: Tiernan OToole <tiernan@tiernanotoole.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <WireGuard@lists.zx2c4.com>
Subject: Re: [WireGuard] Single client connecting to server multiple times
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

So do you mean to say that:

Kernel 3.16.
ECMP: works well
ECMP + wireguard: not tested

Kernel 4.6:
ECMP: does not work
ECMP + wireguard: does not work

Is this the case?
