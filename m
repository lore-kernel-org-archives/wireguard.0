Return-Path: samuel@sholland.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1da52b8d
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 18:05:45 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5627a95a
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 18:05:45 +0000 (UTC)
Subject: Re: Android app whitelist/blacklist feature
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, eric@bluelinelabs.com
References: <CAMj-8hS_bJado86_1V9hCyW=+-jO6BDnk1WnZE0EQoDembViEw@mail.gmail.com>
 <d939f3b9-ff51-4b94-fcdc-2e819a98459c@sholland.org>
 <CAMj-8hQFk_UPJO4-KEH8YvK5NOBH5vu23Vu5JM2Gt0srMD_kEg@mail.gmail.com>
 <CAHmME9qcXm65jFbGv24m-Pzx9c+nq2-D4y4kBkXk7W6u8HZLiw@mail.gmail.com>
 <CAMj-8hSnvCpY7sZ6xcH=2_Va33M1YsZ97H66PrDSo5=BV9vyOw@mail.gmail.com>
 <CAHmME9qQyw-GxJ-1mLNR_DaWspOO8Enc+gKWobvKUcLqZ-Phcg@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <72472182-2f17-ff6d-f76c-f0fa6c98d45e@sholland.org>
Date: Tue, 3 Jul 2018 13:12:10 -0500
MIME-Version: 1.0
In-Reply-To: <CAHmME9qQyw-GxJ-1mLNR_DaWspOO8Enc+gKWobvKUcLqZ-Phcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 07/02/18 21:31, Jason A. Donenfeld wrote:
> On Tue, Jul 3, 2018 at 4:27 AM Eric Kuck <eric@bluelinelabs.com> wrote:
>> 
>> I was originally thinking the new fragment would be a per-tunnel thing
>> (set when you create the tunnel or edit it), but you’re right - making it
>> a general setting likely makes a whole lot more sense. I can’t think of
>> any use-cases for different tunnels handling different apps.
> 
> It might actually make most sense to make it a per-tunnel thing. We'd then 
> have to introduce conf key called, "ExemptedApplications=" or something. 
> Samuel - any thoughts on this?

Right, trying to make it a global setting requires either some sort of
out-of-band way to pass the information to wg-quick, or rewriting the
configuration file every time the tunnel is brought up.

Since from netd's point of view, this is a per-network setting anyway, I agree
it makes sense to configure it per-tunnel. ExemptedApplications works as a
configuration key, though I prefer ExcludedApplications--the application isn't
just not required to use the tunnel, it's not allowed to use the tunnel.

In that case, here are my UI suggestions:
- Add a button in the editor that switches to a fragment or pops up a Dialog
similar to a MultiSelectListPreference.
- For consistency, checked means excluded -- everything defaults to unchecked.
- The package names of excluded apps are put in the
com.wireguard.config.Interface, and wg-quick handles package name to uid
translation.

How does that sound?

Samuel
