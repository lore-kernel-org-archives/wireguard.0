Return-Path: Jason@zx2c4.com
MIME-Version: 1.0
In-Reply-To: <045201d1d2b3$3eaa6b70$bbff4250$@tiernanotoole.net>
References: <34EBEFA02A9AAB1F.1117239f-f3e4-4320-907d-9a9edbb083c6@mail.outlook.com>
 <CAHmME9rL4jdWQV66hGOSbY5yymVXatq67bMjEJwVBFTxNRB-uA@mail.gmail.com>
 <045201d1d2b3$3eaa6b70$bbff4250$@tiernanotoole.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Jun 2016 12:51:06 +0200
Message-ID: <CAHmME9oa+k0h9s62ts5DpqqWiSnf6zQRfCZyeOCXNsObOHyVDA@mail.gmail.com>
To: Tiernan OToole <tiernan@tiernanotoole.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard@lists.zx2c4.com
Subject: Re: [WireGuard] Single client connecting to server multiple times
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Tiernan,

That seems.... not right. Could you send your /proc/cpuinfo,
/proc/config or /proc/config.gz, and /proc/version, and then send
directly to me (not to the list), your wireguard.ko and bzImage? That
way I can take a look at what's happening and why this might be. Also,
any other configuration details you used for settings things might
help illuminate the bug.

Thanks,
Jason
