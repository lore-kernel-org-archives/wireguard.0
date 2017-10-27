Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66d1203d
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 14:49:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c6f7bec
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 14:49:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f70c7144
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 14:49:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b43f26dc
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 14:49:25 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id j126so11225622oib.8
 for <wireguard@lists.zx2c4.com>; Fri, 27 Oct 2017 07:51:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <44ac12fe-685b-730e-8afd-e4081daf038d@solidadmin.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
 <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
 <44ac12fe-685b-730e-8afd-e4081daf038d@solidadmin.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 27 Oct 2017 16:51:15 +0200
Message-ID: <CAHmME9oSNNG7-CrC5Emuvi33JD=PBD4rXkwoJABnUcn6-oh6yg@mail.gmail.com>
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

On Fri, Oct 27, 2017 at 4:47 PM, Joe Doss <joe@solidadmin.com> wrote:
> I feel this is OK since any WG users at this point are going to accept their
> fate that not all features are going to work correctly. I would like to
> accept the networkmanagersystemdresolveddhclientscript physical challenge
> and try and see if there is some better way to integrate things in Fedora
> before having to ship patches in the RPM to shoehorn things in place.

So on one hand, you're fine with me shipping the hatchet, but you
aren't [yet?] okay with the RPM-itself shipping the hatchet, because
you'd like to find a more proper solution. This indicates to me that I
shouldn't ship the hatchet myself then.

You wrote, "WG users at this point are going to accept their fate that
not all features are going to work correctly." Actually, no. Firstly,
I'm not up for shipping broken software, and it's not okay with me to
have distros ship things broken, because they think that's somehow
fine and users will put up with it. Secondly, I've received enormous
quantities of hate email from Fedora users, which is what's prompted
this whole thread in the first place. So, no -- for the next snapshot
packaging, I'd like for there to be a solution to make things work. If
you can solve the physical challenge, great. If not, hatchet?
