Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2cfd548
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 14:31:31 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7490203
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 14:31:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3054389d
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 14:22:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9613b57a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 14:22:40 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id c18so7098060oiy.9
 for <wireguard@lists.zx2c4.com>; Fri, 09 Mar 2018 06:41:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87o9jxjotf.fsf@toke.dk>
References: <87efku1vza.fsf@toke.dk>
 <CAHmME9qg=YXoKxEnikkJe1Li5Pq+yASPUhqN5PmGk6Fx=Y3-1Q@mail.gmail.com>
 <85FE1433-439D-439C-A61E-B17754707077@toke.dk>
 <CAHmME9p0aW2i-EcErua_Hkz-hZc12m47oLR9wvngu5ejVX=Q8A@mail.gmail.com>
 <87h8pqlbw4.fsf@toke.dk>
 <CAHmME9pgOGghWRv9bMtTvbxrQfNycK9EHEnBu=UQxOz6AQJ2qA@mail.gmail.com>
 <7088098E-63F5-4ECB-A298-24444987482E@toke.dk>
 <CAHmME9ojxMOoB5z4VJQbecTD+Y7VLK=K8=oTSDciofWLC6Q0fg@mail.gmail.com>
 <87efktzhmj.fsf@toke.dk> <87tvtpjp57.fsf@toke.dk> <87o9jxjotf.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 9 Mar 2018 15:41:15 +0100
Message-ID: <CAHmME9qsdSg4JBGrBNLA+2Mmkh7Te+YKb5ixSOSwrMJpbn=XXw@mail.gmail.com>
Subject: Re: Another roaming problem
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
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

On Fri, Mar 9, 2018 at 3:39 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
> And leaving it running a bit more, there is also a call from
> expired_retransmit_handshake:

Yep! These are the two calls in timers.c.
