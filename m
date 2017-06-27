Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6227de8
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 10:46:30 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91776f6b
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 10:46:30 +0000 (UTC)
Date: Tue, 27 Jun 2017 13:02:57 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@wut.to
Subject: Re: making wireguard work on RHEL7/etc.
Message-ID: <20170627110256.GB3026@zx2c4.com>
References: <alpine.LRH.2.20.1706241613350.14074@bcny.fcbq.bet>
 <87o9tbuq7a.fsf@correspondwith.me>
 <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
 <CAHmME9p++Q0v6Ypt2Y5AFZO36hHnTKv7KBnWNnSk84V8YK+oJw@mail.gmail.com>
 <alpine.LRH.2.20.1706261023540.14074@bcny.fcbq.bet>
 <CAHmME9oHG6a1==KzrrfuvmkKoVJHhTtToP00qYtcKXEGDCnm8Q@mail.gmail.com>
 <CAHmME9ph1LQ0kufpf2RMDsMRpz7txWJGvr=d=Jr5Z1kxqqOWfQ@mail.gmail.com>
 <alpine.LRH.2.20.1706262050540.17486@bcny.fcbq.bet>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <alpine.LRH.2.20.1706262050540.17486@bcny.fcbq.bet>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Jun 26, 2017 at 08:55:02PM +0100, wireguard@wut.to wrote:
> I think this might work ...
> 
> I was still able to compile on Amazon AMI/4.9.32 Kernel

Thanks! This isn't the proper way to submit a patch, but I'll examine
the diff and roll something satisfactory myself. Thanks a bunch for
doing all the hard work with this. Hopefully the next wireguard snapshot
will have out-of-the-box RHEL support.
