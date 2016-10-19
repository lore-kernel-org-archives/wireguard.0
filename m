Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0687ebf1
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Oct 2016 22:34:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1308e9d
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Oct 2016 22:34:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c9452816
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Oct 2016 22:34:13 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id l131so44497348lfl.2
 for <wireguard@lists.zx2c4.com>; Wed, 19 Oct 2016 15:35:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87zim0wcdy.fsf@toke.dk>
References: <87mvi0jxsb.fsf@toke.dk> <87a8e0jucl.fsf@toke.dk>
 <87zim0wcdy.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 20 Oct 2016 07:35:04 +0900
Message-ID: <CAHmME9rSDy91q6iToHiQxrrTVtV_xEB2VSb9gF26=Z6=j94aAA@mail.gmail.com>
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Error building against grsec-enabled kernel
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Toke,

Good to see you in this neck of the woods!

Yes -- the __read_mostly annotation needs to go away for grsec. I had
this building and running a few months ago on there. I'll revive that
work. I'm at a conference right now (codeblue.jp) giving a talk on
WireGuard, but I'll dig up my grsec build system ASAP and get back to
you. In the mean time, if you can muster a backtrace, this of course
would be excellent.

Talk soon,
Jason
