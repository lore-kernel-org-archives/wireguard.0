Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c522353f
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 18:10:56 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08cb48cc
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 18:10:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46ad714f
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 18:09:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ff8319b1
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 18:09:42 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id k12-v6so5684523oiw.8
 for <wireguard@lists.zx2c4.com>; Tue, 03 Jul 2018 11:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAMj-8hS_bJado86_1V9hCyW=+-jO6BDnk1WnZE0EQoDembViEw@mail.gmail.com>
 <d939f3b9-ff51-4b94-fcdc-2e819a98459c@sholland.org>
 <CAMj-8hQFk_UPJO4-KEH8YvK5NOBH5vu23Vu5JM2Gt0srMD_kEg@mail.gmail.com>
 <CAHmME9qcXm65jFbGv24m-Pzx9c+nq2-D4y4kBkXk7W6u8HZLiw@mail.gmail.com>
 <CAMj-8hSnvCpY7sZ6xcH=2_Va33M1YsZ97H66PrDSo5=BV9vyOw@mail.gmail.com>
 <CAHmME9qQyw-GxJ-1mLNR_DaWspOO8Enc+gKWobvKUcLqZ-Phcg@mail.gmail.com>
 <72472182-2f17-ff6d-f76c-f0fa6c98d45e@sholland.org>
In-Reply-To: <72472182-2f17-ff6d-f76c-f0fa6c98d45e@sholland.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 3 Jul 2018 20:17:11 +0200
Message-ID: <CAHmME9qAUveJi6of9TMb_Owffsy-SX+4pQyDMHaz=6COE2CYxQ@mail.gmail.com>
Subject: Re: Android app whitelist/blacklist feature
To: Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Eric Kuck <eric@bluelinelabs.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Jul 3, 2018 at 8:12 PM Samuel Holland <samuel@sholland.org> wrote:
> Right, trying to make it a global setting requires either some sort of
> out-of-band way to pass the information to wg-quick, or rewriting the
> configuration file every time the tunnel is brought up.
>
> Since from netd's point of view, this is a per-network setting anyway, I agree
> it makes sense to configure it per-tunnel. ExemptedApplications works as a
> configuration key, though I prefer ExcludedApplications--the application isn't
> just not required to use the tunnel, it's not allowed to use the tunnel.
>
> In that case, here are my UI suggestions:
> - Add a button in the editor that switches to a fragment or pops up a Dialog
> similar to a MultiSelectListPreference.
> - For consistency, checked means excluded -- everything defaults to unchecked.
> - The package names of excluded apps are put in the
> com.wireguard.config.Interface, and wg-quick handles package name to uid
> translation.
>
> How does that sound?

All of that sounds right-on to me, and I think you're right that
ExcludedApplications is the better key.

(This also provides a good basis for later adding a
"ExcludeLocalNetwork" option.)

 Eric's git access should be all setup now, so we can watch the
commits coming on in.
