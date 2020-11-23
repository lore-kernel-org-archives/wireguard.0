Return-Path: <SRS0=uuIP=E5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A513AC2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 14:25:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8726820758
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 14:25:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="x9dmqYMH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8726820758
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ddad7059;
	Mon, 23 Nov 2020 14:19:38 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fd4d0698
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 14:19:35 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f9c34a0
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 14:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :subject:message-id:mime-version:content-type; s=mail; bh=2LJfRL
 IUvTMxGN3l8KWeQn4SzAU=; b=x9dmqYMHyE/tXc9SHGZn8pxHdgld1jCCaZ3fsa
 nedZPuwOm70OxtVcyu+cZKF612LvhquQBDczPErlm/GKsg0upuq8bMJitb6H8LbA
 +ZEEVoMDb53sbRAh2e46A3ZNJwPnGpGepIEDL0s7Dt8v2n7IVcPUsezRBYQckWoe
 ohcwil6b+0P5GWKnUiAc9eR9G5LtdL8OLoj1KPACzVLHXyv3Mi0tWaJZkLnB1gqR
 /6LjWlphPncl61tl9xpHe4n18BqbKAGajydYVmaLYu+NejMdMD4YjVjG+jD39uiz
 GWNHZRf1YvT7lfpaiec8LIZWL3/mwoRcF5Zy+YnS2l2Yv1lQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6fa2946b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 14:20:21 +0000 (UTC)
Date: Mon, 23 Nov 2020 15:24:57 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Subject: [ANNOUNCE] WireGuard for Windows 0.3: ARM support, enterprise
 features, & more
Message-ID: <X7vGOb0o6SHIvfDc@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi folks,

If you're using WireGuard on Windows, you've undoubtedly noticed the
flurry of updates and changes over the last two weeks, with 0.2 last
week and now 0.3 today. Simon and I have been quite eager to put some of
these recent changes in your hands, and I'm glad we've done so, but I do
apologize if the pace of updates was a bit much for some. We'll try to
calm down soon, maybe, I hope. So, what have we been up to?

1) Documentation on non-obvious parts

I figure I'll mention the most boring part up front: we've documented
lots of things about Windows networking, administrator tips, security,
and more, linked to from the main README:

    https://git.zx2c4.com/wireguard-windows/about/

If you're interested in learning more about the architecture or
deployment particulars of the program, I would strongly encourage
reading these documents in full. And as always, advanced topics or
things you might be fuzzy about can always be freely discussed and
elucidated here on the mailing list.

2) ARM and ARM64 support

A few weeks ago we released Wintun 0.9 [1], which was a massive release
and real technical accomplishment for us. This paved the way for us to
add ARM and ARM64 to WireGuard for Windows, but required quite a bit of
work, both to our own code and to the Go runtime, which we've improved
substantially. As part of the process, we also moved to using the LLVM,
since binutils/gcc is still lacking proper Windows ARM support. Now
users of Windows on the Microsoft Surface devices or even the Raspberry
Pi can run WireGuard there natively.

3) More robust installer infrastructure

We now support 4 architectures -- x86, amd64, arm, and arm64 -- which
means we have four MSI installers per release. Rather than burden the
user with selecting the right one, or with making sure their Downloads
folder always has the latest one when they get around to installing it,
we've built a tiny 72k installer executable that figures out the best
MSI for the architecture, validates a list of the latest versions from
the download server using Ed25519 code signing (with signatures made on
a YubiHSM [2]), downloads the right one, and installs it seamlessly. Our
new installer is available at [3] and MSIs remain directly available to
sysadmins using GPO at [4]. I tweeted a little recording of how fast
this process is last week:

    https://twitter.com/EdgeSecurity/status/1328727122425352192

This should also serve as a "trust anchor", if you'd like to have all
downloads authenticated following the initial download of that
installer. On top of that, we've made installs, upgrades, and
uninstallations much more robust, as well as providing detection and
links for KB2921916 for Windows 7 users who require that hotfix.

4) Translations

WireGuard now ships with translations for 17 languages, and we're
accepting translations for even more on [5].

5) Configuration files moved to %ProgramFiles%\WireGuard\Data\Configurations

We previously kept configuration files in the Local System user's
profile, but this is discouraged by Microsoft to the point of actually
refusing to migrate it when users upgraded between Windows 10 builds,
requiring us to attempt to migrate from Windows.old in an error-prone
manner. This is no more. Following Microsoft SQL Server's example, we're
storing configuration in this new location. As explained in [6], this
acts as a "hot folder" for automatically encrypting added
configurations. Configuration files in the old location are
automatically moved to the new location.

6) Limited UI for Network Configuration Operator group

This is one of the most requested features. Enabled with a registry flag
(see [7]), members of the builtin Network Configuration Operator group
now can use the UI in a limited manner, which allows starting and
stopping tunnels, viewing the current stats, but not much else, with all
key material redacted.  I tweeted a screenshot of this recently:

    https://twitter.com/EdgeSecurity/status/1330836060721582080

Hopefully this will go a long way in allowing enterprise admins to
provision laptops for users who don't generally have administrator
access. We'll see what the reception to this is like, and if the feature
needs further refinement, but hopefully we've struck an acceptable
balance of security and usability.

7) Support for split DNS tunneling

Not really. But we now are doing the "normal" thing with DNS in most
cases, so that Windows can handle multiple DNS servers using its
ordinary configurable policy for this, which should allow, in theory,
for folks to set up split DNS tunneling as needed. This, and other
quirks, is described in detail in our new networking documentation [8].

8) "PreUp", "PostUp", "PreDown", and "PostDown" script execution

Gated behind a frighteningly named registry flag (see [7]), the Windows
client finally supports handling these wg-quick(8) directives, which
should be a boon to enterprise admins when combined with item (6) above.

9) Multiple tunnels at the same time

We've always supported this when using the tunnel service without the
manager (see [6]), but now the UI can do this via the manager too. At
the moment it's gated behind a flag (see [7]), but we hope to make the
logic for this automatic down the road.

10) Performance and stability improvements

We've fixed innumerable bugs and made improvements to almost every part
of the app, so things in general should run a lot smoother. Of
particular note is support for higher resolution timers on recent builds
of Windows 10.


So, please try this out, and don't hesitate to report feedback here.
Hopefully this latest 0.3 release marks the transition of WireGuard for
Windows from being a scrappy poweruser application to being a serious
piece of enterprise- ready software, without sacrificing our overall
design philosophy.

And if you're new to WireGuard on Windows, you can head on over to the
install page to grab the latest:

    https://www.wireguard.com/install/

Finally, it should go without saying, but say it I will: everything
we're doing here is released as open source software, with development
being done in the open on public git repositories, as a community
project. If you've got a thirst for Windows programming and want to get
involved, this program is a fun one to hack on [9].

Enjoy!
Jason


[1] https://lists.zx2c4.com/pipermail/wireguard/2020-November/005921.html
[2] https://marc.info/?l=openbsd-misc&m=155723329924761&w=2
[3] https://download.wireguard.com/windows-client/wireguard-installer.exe
[4] https://download.wireguard.com/windows-client/
[5] https://crowdin.com/translate/WireGuard
[6] https://git.zx2c4.com/wireguard-windows/about/docs/enterprise.md
[7] https://git.zx2c4.com/wireguard-windows/about/docs/adminregistry.md
[8] https://git.zx2c4.com/wireguard-windows/about/docs/netquirk.md
[9] https://git.zx2c4.com/wireguard-windows/about/docs/buildrun.md
