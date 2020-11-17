Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95417C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 22:46:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 982E320782
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 22:46:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=scjalliance.com header.i=@scjalliance.com header.b="KqgY6Rkt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 982E320782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=scjalliance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da96feb5;
	Tue, 17 Nov 2020 22:41:45 +0000 (UTC)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a4edca08
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 22:41:42 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id js21so16pjb.0
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 14:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scjalliance.com; s=g5;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RE4aQdChcNLyZIy768PMmvHTDtsbz0JnVlAUfpXlHd4=;
 b=KqgY6RktwVvXmte6zQ6pmH0Ehw06FmyB2rm1O9mTFpWUPv4SmD0ZhW02Ba6XyEj84E
 gRf3AX1vr1fRtFJGor16IgSsjknu/mLDAGdR9CorqvSLhqQOC6He8lLuZpywgjsJrXnN
 KhwuOHD1pp0cU+92yM9wjw18dUCmrVAh87k34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RE4aQdChcNLyZIy768PMmvHTDtsbz0JnVlAUfpXlHd4=;
 b=F/PVXqp/eTHBl6YaVIxk4wZfnM6b9labCh49NYz+w1/BIvw+Ye/XlGUkE4/PrerAqh
 O4i6+sSKaq4fA3WXT858n+mdSvF0FYsPe3mBAXg9fYMaZLqWfhWkPn9XCVXlwvTF7phU
 K6EkAkODJ/42LHm25zVDj3rJubUFSxtIDnINlx1xU/SrMPVmoV6azjBAsUR4k2aoZjRM
 B5OXPV6WFvrhYuubT0ecve9CR7E81S49ZACi/vgcNz8ldT16OqxPsy3z7n0wvij8dhMe
 zilrCqk/1xsAfh0bG0y9CFX2sLvEBj/VBuChEF/wL1M2xlqYhrAUHThcZtNBH1aUqFk0
 +nwQ==
X-Gm-Message-State: AOAM532hBAtIP5nLxktCEf1K0IlRwtH8XMQTUmaCIWH8R+WmM39Kb5Ws
 n1qYbpI44I7g0slVqhNDBoikueFtmdjq+Vxhhuoz2fTi0BHGKism
X-Google-Smtp-Source: ABdhPJwXS5Qyz0o6fKqogPDv4K58tyWXvKBVEvimYOW9Zx5h6ewh+fpSmzPs4os5vVYRpFlU4Zsi9NnY7t/uBC7teyA=
X-Received: by 2002:a17:902:e788:b029:d6:dc69:80a8 with SMTP id
 cp8-20020a170902e788b02900d6dc6980a8mr1328667plb.59.1605653180301; Tue, 17
 Nov 2020 14:46:20 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuvDgxsr99R2qiOrXM20btnvnaiyAx7197jfcTauOt5CTA@mail.gmail.com>
 <CAHmME9oeZc7cruN2fayu+F+8BO0RiwGuA+dqzQRr5spnvhY6GA@mail.gmail.com>
 <CALaUSuuzQhTcDE_b6PPf=fXuOjbmVf7Tgzdz9DbWMxCJ8-2WUQ@mail.gmail.com>
 <CAHmME9oZvNQjCoShdMTQ2n0soTA0wNVVm9rPFcma0fP-6_9tsw@mail.gmail.com>
In-Reply-To: <CAHmME9oZvNQjCoShdMTQ2n0soTA0wNVVm9rPFcma0fP-6_9tsw@mail.gmail.com>
From: Joshua Sjoding <joshua.sjoding@scjalliance.com>
Date: Tue, 17 Nov 2020 14:46:09 -0800
Message-ID: <CALaUSuupA5bzEMb-NLRXVGy0n_nDWLoVVaDnU11e2iWmOO1RMw@mail.gmail.com>
Subject: Re: WireGuard for Windows failed to start after update to v0.2.1
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Here's a more complete view of what happened:

1. I heard reports of two of our users having issues updating
WireGuard this morning. Their issue was a firewall warning (now
hopefully resolved in a separate thread).
2. I decided to try updating WireGuard on my own laptop to see if I
got the same behavior.
3. I opened the WireGuard UI through the icon in the system
notification area and saw that WireGuard was offering me an update.
4. I told Wireguard to update and it started to go through the usual
update process.
5. The WireGuard UI closed and the icon in the system notification
area disappeared, which is typical as it does an update.
6. The WireGuard UI never came back and the tunnel never came back up.
There were no error messages, just silent failure.
7. I checked the Windows application log and saw the error messages
listed earlier. In particular this message seemed pertinent: "Product:
WireGuard -- Wintun error: Unable to remove existing driver: The
system cannot find the file specified. (Code 0x00000002)"
8. I compared my experience with the other two cases and determined
that mine was different. I started this thread and another on the
WireGuard mailing list to address the issues.
9. I had some tea. I love tea. Tea is wonderful.
10. I manually started the WireGuard desktop app. It immediately
prompted for elevated privileges, which is atypical. I provided it
with administrative credentials.
11. The WireGuard UI opened and the icon appeared in the system
notification area.
12. I saw that WireGuard was missing my configured tunnel. It was also
still prompting me to update it, which was very surprising.
13. I told WireGuard to run the update again.
14. The UI closed as the update took effect, but this time it opened
back up on its own after the update finished, which is what usually
happens. I saw that the icon was present in the system notification
area as well.
15. I saw that my tunnel configuration was back, but the tunnel was deactivated.
16. I activated the tunnel and everything was happy again.

If the MSI system was supposed to rollback in the case of failure, it
failed to do so. Perhaps the MSI system thought the update succeeded
when it didn't? I found it odd that the MSI reported that it had
installed the product immediately after it reported that it had
failed.

Here are the events from the Windows Application event log again for
convenience, taken at step 7, in order of occurrence:

----

Error, Event 1013, MsiInstaller, 11/17/2020 8:41:49 AM

Product: WireGuard -- Wintun error: Unable to remove existing driver:
The system cannot find the file specified. (Code 0x00000002)

----

Error, Event 1013, MsiInstaller, 11/17/2020 8:41:49 AM

Product: WireGuard -- Wintun error: Failed to uninstall driver: The
operation completed successfully. (Code 0x00000000)

----

Info, Event 11708, MsiInstaller, 11/17/2020 8:41:49 AM

Product: WireGuard -- Installation failed.

----

Info, Event 1033, MsiInstaller, 11/17/2020 8:41:49 AM

Windows Installer installed the product. Product Name: WireGuard.
Product Version: 0.2.1. Product Language: 1033. Manufacturer:
WireGuard LLC. Installation success or error status: 1603.

----

On Tue, Nov 17, 2020 at 1:56 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Joshua,
>
> On Tue, Nov 17, 2020 at 10:20 PM Joshua Sjoding
> <joshua.sjoding@scjalliance.com> wrote:
> >
> > I think they're separate issues both related to the new version, which
> > is why I opted to send in separate emails. The other email is about an
> > issue first encountered on two other computers within the company.
> >
> > In my case I was able to get WireGuard working again. Here's what happened:
> >
> > 1. I manually started the WireGuard desktop app. It immediately
> > prompted for elevated privileges, which is atypical. I provided it
> > with administrative credentials.
> > 2. The WireGuard desktop app launched, but lacked any of my configured
> > tunnels and still was prompting me to upgrade. I see that there's a
> > config data migration recorded in the log, so my guess is that
> > WireGuard was still running the old executable and didn't know to look
> > for the configuration data in the new location yet.
> > 3. I told WireGuard to run the updater again and this time it went through fine.
> > 4. When WireGuard came back up it had the tunnel configuration again.
> > The tunnel was left in a shut off state, even though it was on prior
> > to the first upgrade attempt. I switched the tunnel back on and it
> > seems to be working fine now.
>
> It's unclear to me where the timeline begins in this one. Here's my
> present understanding:
>
> 1. It's a normal Tuesday at SCJ, the coffee is roasting, the pens are
> clicking, when WireGuard innocently informs you that there's an update
> available.
>
> 2. You click update, it downloads the installer, and runs it. After
> hanging for a bit, the installer seems to run in reverse, and you're
> kicked back to the WireGuard app, not-updated, except all your config
> files are gone, which is weird.
>
> 3. You click update again. It succeeds, and the new WireGuard version
> comes up, and your configs are all there.
>
> 4. The tunnels aren't started, so you press start, and everything
> works, but there are these messages in your log, which you sent me in
> the other thread.
>
> Is that an accurate story?
>
> If so, my current best guess is that:
> - MSI stops manager, stops tunnel, installs new version, starts new
> manager (thereby initiating the config migration), starts new tunnel.
> - New tunnel fails to start [a]. We flipped on the MSI rollback switch
> in v0.2, so that tunnel bug now causes the installer to move in
> reverse [b].
> - New manager stopped, old version installed, old manager started, old
> tunnel started, but config has been migrated already [c], so the
> tunnel doesn't come up and you can't see it.
> - You press update again, stops manager, new version installed, starts manager.
> - You start the tunnel service manually.
>
> Current status based on the above is:
> - [a] and [c] were fixed by
> https://git.zx2c4.com/wireguard-windows/commit/?id=2edb9007c820656514a0e9b07c9f83ad86593866
> and https://go-review.googlesource.com/c/sys/+/270897 .
> - [c] is fixed by
> https://git.zx2c4.com/wireguard-windows/commit/?id=2edb9007c820656514a0e9b07c9f83ad86593866
> .
> - [b] we can either fix by getting rid of rollback again, or keeping
> it, and arguing that [c] is the more proper fix.
>
> Can you confirm this corresponds?
>
> Jason
