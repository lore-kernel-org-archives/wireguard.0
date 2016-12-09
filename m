Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e742245d
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 13:21:38 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ca266db
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 13:21:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e900d46
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 13:21:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9c31b57c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 13:21:38 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id a197so27047958wmd.0
 for <wireguard@lists.zx2c4.com>; Fri, 09 Dec 2016 05:27:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9oQ5HJb937HOwJJbAhaORuFpz5cRp=fhLV=u8rEUST5PA@mail.gmail.com>
References: <e15d1fea-8761-fde9-6802-cb483340ebb4@sholland.org>
 <CAHmME9qBAt84jOvJhnSOybekbOFQb1RH+7mmfGK=bc2i9bxADg@mail.gmail.com>
 <CAHmME9q+oEAo+HuSRf8WJoGv+jbsA46c3GHXCUT4QvX8a+k23w@mail.gmail.com>
 <58475B7C.14182.19D586@pageexec.freemail.hu>
 <CAHmME9rHB20Ywi_ZkFGq5WioqeDApUvaTwaOP1HB1WBpYRVCag@mail.gmail.com>
 <CAHmME9pVCDu88c6n+LV9Mtd5Ohu8o-7RSQB4kRjsHGRQ3jF8zw@mail.gmail.com>
 <20161208231626.GA5230@grsecurity.net>
 <CAHmME9oY+Q7mWkpNejKnPg=DpbtGaXkthCCkPLusMv1uBANLTQ@mail.gmail.com>
 <20161209121144.GA31448@grsecurity.net>
 <CAHmME9oQ5HJb937HOwJJbAhaORuFpz5cRp=fhLV=u8rEUST5PA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 9 Dec 2016 14:27:16 +0100
Message-ID: <CAHmME9osYp=qUbHDVtjiijV+o9L+YAXyc8u_wiK84=Fmkp8ZVg@mail.gmail.com>
Subject: Re: Kernel Panic
To: Brad Spengler <spender@grsecurity.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Oh, hah, looks like we're a bit late to the party:

https://git.zx2c4.com/linux/commit/?id=c8467f7a3620698bf3c22f0e199b550fb611a8ae

It's already gone!
