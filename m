Return-Path: wireguard@wut.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 538c7296
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 11:22:10 +0000 (UTC)
Received: from opal.spod.org (opal.spod.org [217.135.32.99])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8552ff9c
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 11:22:10 +0000 (UTC)
Date: Tue, 27 Jun 2017 12:38:34 +0100 (BST)
From: wireguard@wut.to
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: making wireguard work on RHEL7/etc.
In-Reply-To: <20170627110530.GC3026@zx2c4.com>
Message-ID: <alpine.LRH.2.20.1706271237180.17486@bcny.fcbq.bet>
References: <alpine.LRH.2.20.1706241613350.14074@bcny.fcbq.bet>
 <87o9tbuq7a.fsf@correspondwith.me>
 <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
 <CAHmME9p++Q0v6Ypt2Y5AFZO36hHnTKv7KBnWNnSk84V8YK+oJw@mail.gmail.com>
 <alpine.LRH.2.20.1706261023540.14074@bcny.fcbq.bet>
 <CAHmME9oHG6a1==KzrrfuvmkKoVJHhTtToP00qYtcKXEGDCnm8Q@mail.gmail.com>
 <CAHmME9ph1LQ0kufpf2RMDsMRpz7txWJGvr=d=Jr5Z1kxqqOWfQ@mail.gmail.com>
 <alpine.LRH.2.20.1706262144070.17486@bcny.fcbq.bet>
 <20170627110530.GC3026@zx2c4.com>
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

> On Mon, Jun 26, 2017 at 09:45:14PM +0100, wireguard@wut.to wrote:
> > another fix for RHEL7/etc., the version of bash included doesn't support
> > 'local -n' (neither does Amazon AMI Linux either)
> >
> > diff --git a/src/tools/wg-quick.bash b/src/tools/wg-quick.bash
> > index 6edcd3a..afec996 100755
> > --- a/src/tools/wg-quick.bash
> > +++ b/src/tools/wg-quick.bash
> > @@ -54,7 +54,7 @@ parse_options() {
> >  }
> >
> >  read_bool() {
> > -       local -n out="$1"
> > +       local out="$1"
> >         case "$2" in
> >         true) out=1 ;;
> >         false) out=0 ;;
> >
>
> Before removing `-n`, did you even read the bash man page to learn what
> it did? Things are most certainly broken with this patch, and the config
> option that uses this will no longer do anything. Nack.

I don't have a system that has that option in it, so no. As it stands
wg-quick does not work on a RHEL/Amazon AMI instance. Feel free to ignore
the patch of course if it breaks it the logic.

wg-quick up/down worked for me after this, but it wasn't an extensive test
case.
