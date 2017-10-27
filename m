Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5515ff00
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 17:13:21 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3f26bf6
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 17:13:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d0841e2
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 17:13:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id de00267a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 17:13:18 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id f66so11896940oib.2
 for <wireguard@lists.zx2c4.com>; Fri, 27 Oct 2017 10:15:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <92b6b9c5-b07c-52fa-a72a-0fc2dcc253bc@solidadmin.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
 <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
 <44ac12fe-685b-730e-8afd-e4081daf038d@solidadmin.com>
 <CAHmME9oSNNG7-CrC5Emuvi33JD=PBD4rXkwoJABnUcn6-oh6yg@mail.gmail.com>
 <92b6b9c5-b07c-52fa-a72a-0fc2dcc253bc@solidadmin.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 27 Oct 2017 19:15:08 +0200
Message-ID: <CAHmME9pn977yhsu-rVdR-Mz+ZnsrUaxjQYxc2SveYL9zKNXB4w@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
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

On Fri, Oct 27, 2017 at 5:38 PM, Joe Doss <joe@solidadmin.com> wrote:
>
> Don't let small amount of WG users that are rude and ignorant push the
> project around. It's not the project's fault that they don't understand how
> to install resolvconf or manage their own DNS if wg-quick doesn't work. This
> isn't me saying that we shouldn't make it better. We should and we will. It
> is just going to take time.

Actually, the problem is that there's no resolvconf of any kind on
Fedora, and this is what wg-quick uses. Thus wg-quick doesn't work
with Fedora, yet we ship packages for Fedora with wg-quick. So:
there's a problem that we need to work out. I take responsibility for
it and I don't blame the users.

> If you feel this is super important and you want to ship a hacky solution to
> fix then do it.
> It's a temp solution for a problem that needs a lot more packaging and dev
> time to fix correctly for every distro.

Alright. So in that case, I guess ship the hatchet as a patch in the
RPM, and later when you have time, you can investigate if there's
actually a proper Fedora way of doing things. Likewise Martin can do
the same with OpenSUSE.

(Daniel and Egbert seem mostly okay with the butchered resolvconf in
their distros; at least they don't see any reason to change things,
since it mostly works, and users there at least have the choice of
somehow installing openresolv need be.)

> I
> manage my own DNS because I don't have a fancy NetworkManager drop down in
> GNOME to do it for me... at least not yet. ;)

Sounds like a fun project coming up...

> With that all said, I don't think the hatchet solution is great.
> have this issue fixed because users are super frustrated then do it for
> now and we can fix it later with the right way to do things in Fedora.

I suppose that's the plan then!
