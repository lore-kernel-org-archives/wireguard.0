Return-Path: samuel@sholland.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0036911
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jul 2018 21:37:46 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 819543ba
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jul 2018 21:37:46 +0000 (UTC)
Subject: Re: Android app whitelist/blacklist feature
To: Eric Kuck <eric@bluelinelabs.com>, wireguard@lists.zx2c4.com
References: <CAMj-8hS_bJado86_1V9hCyW=+-jO6BDnk1WnZE0EQoDembViEw@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <d939f3b9-ff51-4b94-fcdc-2e819a98459c@sholland.org>
Date: Mon, 2 Jul 2018 16:43:49 -0500
MIME-Version: 1.0
In-Reply-To: <CAMj-8hS_bJado86_1V9hCyW=+-jO6BDnk1WnZE0EQoDembViEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello Eric,

On 07/02/18 15:35, Eric Kuck wrote:
> I’d like to make a contribution to the Android app, but would like to know if
> this is something that would actually get merged before I go through all the
> effort. What I’d like to do is add an exceptions list (apps that will not be
> routed through the Wireguard interface). The rationale for this being that 
> some apps simply don’t work with Wireguard. For example, the use of a 
> Wireguard VPN with custom DNS breaks WearOS watches due to Google hardcoding 
> the use of the 8.8.8.8 DNS server. Another example is that Netflix doesn’t 
> work when routed through my VPN server since they know it’s a DigitalOcean 
> instance, but works fine without the VPN enabled. Another example is that 
> there’s often no reason to route data-heavy video apps through your VPN 
> server. Rather than turning the VPN on my phone off to use my wearable or to 
> watch something on my phone, I’d like to be able to opt those apps out of 
> using the VPN at all. I’m sure there are many more examples of apps that 
> simply don’t need to go through a VPN, as no confidential information is 
> passed through them.

This sounds like a generally useful feature.

> My proposal is to add another Fragment that’s just a list of all apps 
> installed on the phone with check boxes next to them. If the checkbox is 
> checked, that app will be routed through Wireguard. If not, it will be free 
> to bypass the VPN. Naturally, all apps will be default to being checked.

If you base the UI on DialogPreference or MultiSelectListPreference, Android
will take care of persisting the setting for you, and it would be easy to add to
the settings page.

> This is an easy change to make for the GoBackend implementation using 
> VpnService.Builder.addDisallowedApplication(<packageName>), but would likely 
> be pretty complicated to add to WgQuickBackend. Perhaps this is something 
> that would only be possible for GoBackend users.

For WgQuickBackend, we'd need to modify the set_users function[1] in the
wg-quick "script" to take a dynamic list of user IDs instead of hard coding it.
PackageManager should provide us the UIDs of other applications. I'm not sure
the best way to communicate the ID list from the app to the script. Jason, thoughts?

> Any thoughts on this? I have everything working locally by simply adding 
> these two hardcoded lines to GoBackend.java:
> 
> builder.addDisallowedApplication("com.netflix.mediaclient"); 
> builder.addDisallowedApplication("com.google.android.wearable.app”);
> 
> but I would like to make this more configurable and available to the rest of
>  Wireguard users if you’re agreeable to it. Thanks.

Thank you,
Samuel

[1]:
https://git.zx2c4.com/WireGuard/tree/src/tools/wg-quick/android.c?id=dfd9827d5b08c506522bb3762cd3b0dbac640bbc#n291
