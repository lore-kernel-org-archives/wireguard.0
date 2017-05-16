Return-Path: jonathan@titanous.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5224e1d
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2017 15:50:01 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78ce505f
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2017 15:50:01 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Text-based IPC for Userspace Implementations
From: Jonathan Rudenberg <jonathan@titanous.com>
In-Reply-To: <87vap1gd2w.fsf@alrua-kau>
Date: Tue, 16 May 2017 12:01:17 -0400
Message-Id: <358B5193-8D9F-472F-8202-B81BAA022FDD@titanous.com>
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
 <87vap1gd2w.fsf@alrua-kau>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


> On May 16, 2017, at 09:12, Toke H=C3=B8iland-J=C3=B8rgensen =
<toke@toke.dk> wrote:
>=20
> So why not avoid any possible confusion and just emit JSON? Or another
> well-established serialisation format where the nesting can be made
> explicit... :)

+1 to this, requiring implementors to also implement a custom =
serialization format will lead to avoidable bugs.

I took a quick look and there is a bit of precedent for the use of JSON =
in the kernel tree: =
https://github.com/torvalds/linux/tree/3401e8d1e1300742ed41910b9338b9da526=
89a16/tools/perf/pmu-events

Jonathan
