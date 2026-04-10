Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D602F44874
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Apr 2026 14:21:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 08ce58d2;
	Fri, 10 Apr 2026 14:21:11 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f48e2909
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Apr 2026 14:21:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8BD144449C
 for <wireguard@lists.zx2c4.com>; Fri, 10 Apr 2026 14:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BEDC19421
 for <wireguard@lists.zx2c4.com>; Fri, 10 Apr 2026 14:21:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="UvHFJUaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1775830864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=qxaXQ6/uCOEUqk81AIVBHVf5Kn98Msg7OCAVjqsTtNk=;
 b=UvHFJUaDeb7zx7xJEKNku9RY3KqecO2/LtNLssNDWD7wNs3j9XYGLxZ0rah8LEitDjJuG5
 q0WVCjLISeFdigJAM52rsucZGDU3cUpAhEP/brL9oxSnY8NTK4gi80RKOjLT+xMuBVbbj+
 rGL18LF6Pf963xApI3aHnPal2ylKjJY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3c7c2421
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Apr 2026 14:21:04 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-89fc4147f2eso24168276d6.3
 for <wireguard@lists.zx2c4.com>; Fri, 10 Apr 2026 07:21:04 -0700 (PDT)
X-Gm-Message-State: AOJu0YyScSuKa152eo0YwsDwOxY8BUbRVsJbTrQTm8OIooNL1YH8w5bb
 7CpO3tnkX4/55VGhTYyU9EP+qLgRg5j6JSXwiYth6HOvvbVf92mHkuce61+JtRIn7+BjRRdhpC2
 omYM5pK1zOB4zWsnB3V4Lk9uBER3s1O8=
X-Received: by 2002:a0c:f118:0:b0:89a:f0b:60e9 with SMTP id
 6a1803df08f44-8ac861b005dmr35859606d6.13.1775830863414; Fri, 10 Apr 2026
 07:21:03 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 10 Apr 2026 16:20:51 +0200
X-Gmail-Original-Message-ID: <CAHmME9rTCt5V=4ULQ2XM1DkWMdG_b4VJJCGF4aMBnd6VVnFsXA@mail.gmail.com>
X-Gm-Features: AQROBzBS5P6zj05-3FbfAVFVk3yqkqFNL2oLuVOGrgSFvEL6UbR3-4rICQKWLFw
Message-ID: <CAHmME9rTCt5V=4ULQ2XM1DkWMdG_b4VJJCGF4aMBnd6VVnFsXA@mail.gmail.com>
Subject: [ANNOUNCE] WireGuardNT v0.11 and WireGuard for Windows v0.6 Released
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hey folks,

I generally don't send announcement emails for the Windows software,
because the built-in updater takes care of notifying the relevant
users. But because this hasn't been updated in so long, and because of
recent news articles, I thought it'd be a good idea to notify the
list.

After a lot of hardwork, we've released an updated Windows client,
both the low level kernel driver and api harness, called WireGuardNT,
and the higher level management software, command line utilities, and
UI, called WireGuard for Windows.

There are some new features -- such as support for removing individual
allowed IPs without dropping packets (as was added already to Linux
and FreeBSD) and setting very low MTUs on IPv4 connections -- but the
main improvement is lots of accumulated bug fixes, performance
improvements, and above all, immense code streamlining due to
ratcheting forward our minimum supported Windows version [1]. These
projects are now built in a much more solid foundation, without having
to maintain decades of compatibility hacks and alternative codepaths,
and bizarre logic, and dynamic dispatching, and all manner of crust.
There have also been large toolchain updates -- the EWDK version used
for the driver, the Clang/LLVM/MingW version used for the userspace
tooling, the Go version used for the main UI, the EV certificate and
signing infrastructure -- which all together should amount to better
performance and more modern code.

But, as it's our first Windows release in a long while, please test
and let me know how it goes. Hopefully there are no regressions, and
we've tested this quite a bit -- including on Windows 10 1507 Build
10240, the most ancient Windows that we support which Microsoft does
not anymore -- but you never know. So feel free to write me as needed.

As always, the built-in updater should be prompting users to click the
update button, which will check signatures and securely update the
software. Alternatively, if you're installing for the first time or
want to update immediately, our mini 80k fetcher will download and
verify the latest version:
- https://download.wireguard.com/windows-client/wireguard-installer.exe
- https://www.wireguard.com/install/

And to learn more about each of these two Windows projects:
- https://git.zx2c4.com/wireguard-windows/about/
- https://git.zx2c4.com/wireguard-nt/about/

Finally, I should comment on the aforementioned news articles. When we
tried to submit the new NT kernel driver to Microsoft for signing,
they had suspended our account, as I wrote about first in a random
comment [2] on Hacker News in a thread about this happening to another
project, and then later that day on Twitter [3]. The comments that
followed were a bit off the rails. There's no conspiracy here from
Microsoft. But the Internet discussion wound up catching the attention
of Microsoft, and a day later, the account was unblocked, and all was
well. I think this is just a case of bureaucratic processes getting a
bit out of hand, which Microsoft was able to easily remedy. I don't
think there's been any malice or conspiracy or anything weird. I think
most news articles currently circulating haven't been updated to show
that this was actually fixed pretty quickly. So, in case you were
wondering, "but how can there be a new WireGuard for Windows update
when the account is blocked?!", now you know that the answer is,
"because the account was unblocked."

Anyway, enjoy the new software, and let me know how it works for you.

Thanks,
Jason

[1] https://lists.zx2c4.com/pipermail/wireguard/2026-March/009541.html
[2] https://news.ycombinator.com/item?id=47687884
[3] https://x.com/EdgeSecurity/status/2041872931576299888
