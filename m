Return-Path: wireguard@wut.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9aea4b4
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 19:27:04 +0000 (UTC)
Received: from opal.spod.org (opal.spod.org [217.135.32.99])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1df0e766
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 19:27:04 +0000 (UTC)
Date: Tue, 27 Jun 2017 20:43:30 +0100 (BST)
From: wireguard@wut.to
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: making wireguard work on RHEL7/etc.
In-Reply-To: <CAHmME9q8+Y_x8fDZ4n-EmU_NB6+vfBttFQ3S58h+B-j-j8e2Kg@mail.gmail.com>
Message-ID: <alpine.LRH.2.20.1706272042170.17486@bcny.fcbq.bet>
References: <alpine.LRH.2.20.1706241613350.14074@bcny.fcbq.bet>
 <87o9tbuq7a.fsf@correspondwith.me>
 <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
 <CAHmME9p++Q0v6Ypt2Y5AFZO36hHnTKv7KBnWNnSk84V8YK+oJw@mail.gmail.com>
 <alpine.LRH.2.20.1706261023540.14074@bcny.fcbq.bet>
 <CAHmME9oHG6a1==KzrrfuvmkKoVJHhTtToP00qYtcKXEGDCnm8Q@mail.gmail.com>
 <CAHmME9ph1LQ0kufpf2RMDsMRpz7txWJGvr=d=Jr5Z1kxqqOWfQ@mail.gmail.com>
 <alpine.LRH.2.20.1706262144070.17486@bcny.fcbq.bet>
 <20170627110530.GC3026@zx2c4.com>
 <alpine.LRH.2.20.1706271237180.17486@bcny.fcbq.bet>
 <CAHmME9q8+Y_x8fDZ4n-EmU_NB6+vfBttFQ3S58h+B-j-j8e2Kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Jason A. Donenfeld wrote:

> On Tue, Jun 27, 2017 at 1:38 PM,  <wireguard@wut.to> wrote:
> > I don't have a system that has that option in it, so no. As it stands
> > wg-quick does not work on a RHEL/Amazon AMI instance.
>
> Alright. Would you mind reporting the value of `bash --version` on
> there? I don't really like to support bash 3, but maybe I'd be more
> open to supporting earlier version of bash 4.

GNU bash, version 4.2.46(1)-release (x86_64-redhat-linux-gnu)
