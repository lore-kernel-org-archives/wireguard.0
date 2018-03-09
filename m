Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 229b7954
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 14:38:50 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c5ed5a3
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 14:38:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ec20921
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 14:29:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0a39800e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 14:29:57 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id c18so7115144oiy.9
 for <wireguard@lists.zx2c4.com>; Fri, 09 Mar 2018 06:48:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87efktjohg.fsf@toke.dk>
References: <87efku1vza.fsf@toke.dk>
 <CAHmME9qg=YXoKxEnikkJe1Li5Pq+yASPUhqN5PmGk6Fx=Y3-1Q@mail.gmail.com>
 <85FE1433-439D-439C-A61E-B17754707077@toke.dk>
 <CAHmME9p0aW2i-EcErua_Hkz-hZc12m47oLR9wvngu5ejVX=Q8A@mail.gmail.com>
 <87h8pqlbw4.fsf@toke.dk>
 <CAHmME9pgOGghWRv9bMtTvbxrQfNycK9EHEnBu=UQxOz6AQJ2qA@mail.gmail.com>
 <7088098E-63F5-4ECB-A298-24444987482E@toke.dk>
 <CAHmME9ojxMOoB5z4VJQbecTD+Y7VLK=K8=oTSDciofWLC6Q0fg@mail.gmail.com>
 <87efktzhmj.fsf@toke.dk> <87tvtpjp57.fsf@toke.dk> <87o9jxjotf.fsf@toke.dk>
 <CAHmME9qsdSg4JBGrBNLA+2Mmkh7Te+YKb5ixSOSwrMJpbn=XXw@mail.gmail.com>
 <87efktjohg.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 9 Mar 2018 15:48:32 +0100
Message-ID: <CAHmME9oDvfxVeWePt09dUwipjGyF4UrVy3Rd_O0TFnD-Nmbctw@mail.gmail.com>
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

Neat script, looks pretty easy to use. The wg repo has a kprobes
script too for extracting ephemeral keys from the kernel:

https://git.zx2c4.com/WireGuard/tree/contrib/examples/extract-handshakes
