Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0795b6b
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 02:26:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f108ce0
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 02:26:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0a1dc69
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 02:26:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0ad08af2
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 02:26:00 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id v21so8127018oth.6
 for <wireguard@lists.zx2c4.com>; Thu, 07 Dec 2017 18:33:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1463e6b8-2aff-b5f6-4375-dbce686f66c2@solidadmin.com>
References: <CAHmME9qmjgDJ3bXhWaZ86=iuLi+kDVmLqC0iZnU=3QHA0wBDMg@mail.gmail.com>
 <1463e6b8-2aff-b5f6-4375-dbce686f66c2@solidadmin.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Dec 2017 03:33:05 +0100
Message-ID: <CAHmME9r4tqFcVXQMaH-sfiNZZEjHjR2PyYbomWOCBObJ6E2+uw@mail.gmail.com>
Subject: Re: Dealing with list volume
To: Joe Doss <joe@solidadmin.com>
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

Hi Joe,

On Thu, Dec 7, 2017 at 5:34 PM, Joe Doss <joe@solidadmin.com> wrote:
> We do need a place for users to communicate that isn't going to collide with
> devel chatter. https://www.discourse.org/ is pretty great for users, easy to
> use and not terrible to self host. I think it would be good to give users a
> non mailing list place to self help on their problems.

That's what IRC is for, I think. #wireguard is where people should go
to chat usually.

> I would be willing to donate the server needed to run one for WireGuard and
> the time/energy to set it up and keep it running.

Thanks for your offer to host something, but I've got more than enough
stable infrastructure for hosting new gadgets, as they occur to us.
I'm also very hesitant toward introducing a new platform, when IRC
should cut it.

> If you want to keep things
> in email, set up a wg-users list and call it a day.

I've recently been vortexing people who need super basic help toward
#wireguard, in order to leave this list for discussion of all sorts,
whether it's discussion of interesting user related things ("how do I
do this new and interesting thing I couldn't find any documentation
about?") or development things or bikeshedding or whatever else.

I wish we had some better documentation for getting people acquainted
with the basics. I don't like having to tell people, "did you read
these 6 webpages and the man pages and piece it together yet
yourself?", since the response is invariably, "ugh."

Jason
