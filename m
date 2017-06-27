Return-Path: wireguard@wut.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14965437
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 07:09:05 +0000 (UTC)
Received: from opal.spod.org (opal.spod.org [217.135.32.99])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a970de33
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 07:09:05 +0000 (UTC)
Date: Tue, 27 Jun 2017 08:25:31 +0100 (BST)
From: wireguard@wut.to
To: Andrej Kacian <andrej@kacian.sk>
Subject: Re: making wireguard work on RHEL7/etc.
In-Reply-To: <20170627073521.22a725fc@penny>
Message-ID: <alpine.LRH.2.20.1706270821440.17486@bcny.fcbq.bet>
References: <alpine.LRH.2.20.1706241613350.14074@bcny.fcbq.bet>
 <87o9tbuq7a.fsf@correspondwith.me>
 <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
 <CAHmME9p++Q0v6Ypt2Y5AFZO36hHnTKv7KBnWNnSk84V8YK+oJw@mail.gmail.com>
 <alpine.LRH.2.20.1706261023540.14074@bcny.fcbq.bet>
 <CAHmME9oHG6a1==KzrrfuvmkKoVJHhTtToP00qYtcKXEGDCnm8Q@mail.gmail.com>
 <20170627073521.22a725fc@penny>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Andrej Kacian wrote:

> On Mon, 26 Jun 2017 11:57:56 +0200
> "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
> > Excellent!
> >
> > Indeed let's roll with that. Perhaps something quite specific, though,
> > like:
> >
> > #if RHEL_RELEASE_CODE <= RHEL_RELEASE_VERSION(7,3)
> >
> > If you want to reroll your patches around this, in a really clean way,
> > and submit them using git-send-email to the list, I can do a proper
> > review and we can get this merged.
>
> I wonder - is it a good idea to depend on
> nonstandard, distribution-specific defines like this? This kind of
> modification IMHO belongs in a local patch applied during a rpmbuild
> for a RHEL/Centos package.

I think that depends entirely on if you want it to be easy for users to
obtain and use your software. If it requires constant patching and
updates, most people won't bother and will use something else.

The issue for me was that I couldn't just install the software and use it,
I had to figure out how to access the RPM repo (RedHat 7 and the like do
not support dnf/Copr out of the box) I then had to figure out how DKMS was
working (you just get a RPM script error on install), spend time
commenting out random defines in a set of source I don't understand. As
soon as the RPM self-updates this will break and I'll have to do it all
again.

If you have no interest in support RedHat/CentoS/Sceintific Linux/etc.
then it might be worth not publishing RPMs that claim to work with it (and
don't). If you do have interest in it, I would strongly suggest making it
Actually Work.
