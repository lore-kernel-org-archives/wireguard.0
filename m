Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da440009
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 05:22:02 +0000 (UTC)
Received: from smtp21.bhosted.nl (smtp21.bhosted.nl [94.124.121.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c613886
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 05:22:02 +0000 (UTC)
Date: Thu, 21 Sep 2017 05:49:18 +0000
Message-ID: <20170921054918.Horde.1_230K0CRegHDpAhjlGk8u3@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Last pingtest always fails with netns.sh script on ARM device
 with F25.
References: <20170919151533.Horde.MQvI7jMPhVKrVNqOVodg-dg@www.vdorst.com>
 <CAHmME9p17p2Hq6c1rw4QB=PztStywoR-r1r-L6bGiNZ2WU=62g@mail.gmail.com>
 <20170919183438.Horde.O_l7lFVqHiv6-cvQ2uGXuyk@www.vdorst.com>
 <CAHmME9qS6p6nhkV-3_kNiyGU3Mi56tgwcgKa+ng2P+tQ14h3pA@mail.gmail.com>
 <20170920170055.Horde.VMh86cFTXHMnql4s7ycIl7z@www.vdorst.com>
 <CAHmME9osiU+rgWyep6=Zku1+amB7-9bqfG0PZbeUXDf69oWvXg@mail.gmail.com>
In-Reply-To: <CAHmME9osiU+rgWyep6=Zku1+amB7-9bqfG0PZbeUXDf69oWvXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Cc: WireGuard list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Quoting "Jason A. Donenfeld" <Jason@zx2c4.com>:

> Hey René,
>
> I figured it out; it was a bug in the test suite, relying on default
> Linux values, instead of explicitly setting them. It was introduced
> here:
>
> https://git.zx2c4.com/WireGuard/diff/src/tests/netns.sh?id=af2435d180ebb5a3d89b21eb9118d1c643f03f95
>
> And I've fixed it here:
>
> https://git.zx2c4.com/WireGuard/commit/?id=9bd0558427d7eb7dc36b7f720d83ef835056fae6
>
> Thanks for sending all the info!
>
> Regards,
> Jason

Hi Jason,

It is working here too.
Thanks for fixing it.

Greats,

René
