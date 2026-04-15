Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC5BF433D9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Apr 2026 02:18:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c4eef6a2;
	Thu, 16 Apr 2026 02:18:35 +0000 (UTC)
Received: from mail-dl1-x1235.google.com (mail-dl1-x1235.google.com
 [2607:f8b0:4864:20::1235])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 731b2b13
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2026 12:52:12 +0000 (UTC)
Received: by mail-dl1-x1235.google.com with SMTP id
 a92af1059eb24-12c42a23c8eso5226703c88.1
 for <wireguard@lists.zx2c4.com>; Wed, 15 Apr 2026 05:52:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776257530; cv=none;
 d=google.com; s=arc-20240605;
 b=XVzg1I6LQ0lc0eDJtPRW4hXAFMeyg6lnsEXMPz8MBmmlXWCIM0zDtyCq3qLXahtc6+
 nPE676s1HmewikoBUSqI05aOgetKAl4P77B5myPl1Lfan/zE4kK3nn83kXLeSWKF05S9
 jJexlS1eNghFNXa6kJzBKqgZAxzU4TW0kc4ww6m9IoOY4Gmck4t1RAU877q6hlpO2RY4
 a0B2RXpQseH5b7nwBGol4JEVHjqCkSptuxk2cThBdijN0lJbpqtQ+C8KZqM/JhIpIzw0
 nOCTIKsS58vxEBS/CppcUJqoL0qgT50w0z8wG87DXL3SGJxZp3oqGXyVlcHSO0koJIpr
 aamw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=MGuTgalYWaN1DBCwDRYJmH73jaVps05FJtvsG5AuhlU=;
 fh=1CsOgAxkj0tSFTO0bRovl0wQS24+EZdEApJbdc/Xo54=;
 b=ZPZuH6AwAzG89rjZ4ZQvq+rvAbb+HCxxCu5AqVV/HR4xstzce/MRpg8QG+7UdXd4MY
 uj4665e5pqGE+bPmtRUtKLz04leL7hRnEIZIjc1Dqq1JSe23Sk2tiZoALliQ9/sGlwBF
 9RA/RoNjLHvSpgHARnwDw3cx//3twenRyoa0sqWzGkFzSgBOrZzWE9L5KhNW+gqV2DnL
 oGKrQhmPiY7Cr4ABGbsCK7Pr5OYANn0GiVDNG6uAF86OyyoBS+1VJy3BWuW/fKO6uJwe
 SVhQX0poJBRlrFtg3tDISncWkRmk1Ht/MAeTluwzxXq1KSR21S4OeXtDwgP49fNCue4S
 EVcQ==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776257530; x=1776862330; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MGuTgalYWaN1DBCwDRYJmH73jaVps05FJtvsG5AuhlU=;
 b=smM3xOEDa2XEohZeEb661K11eprsnMI26yuouwLEQc5DqgrrK2dbiJP4HVWKeRYejf
 YrUNL7I7Qzh8mrFghBAqzSwEDGbUdSDMKfz8NF0Ruta73cD9CynqA37QS5mtFAfKdTQM
 Hp7bZlo5iP3SmEyB8xpnrpoP4+2xW0E0ZqWj1cHi/9XouP0tZ3GShVse+UTJYQrV8IdR
 NXsnEAa8Xkcq38t7edVx47gt3Zv31HfJZsJpnugRONi4KIZt4Gznmau6UW1KcrtyBVNa
 U5UeDIz6FnUuRbCGrnYBHNoyp71p2EZ7UDybeQhV2OoaAJ7xO7ZD8hHwZDFfX98q32Dr
 SuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776257530; x=1776862330;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MGuTgalYWaN1DBCwDRYJmH73jaVps05FJtvsG5AuhlU=;
 b=ITlFCkiKxoVx6Ds+US6XEUA6M/gsgmjGea5aRZdd23GbEcGJQZXqqieqaVTcN2e1/P
 +GQFd0ihYS0dihJIzkWWMcRUrCnpvdhaxVPns40Ft+j656MJ8p0wyf+oeYGBnWaWhjF4
 6ap7zDzpVMEdUsCqmJz+/pF0aIlwOmgtvGZ+ddjtcoVCZHmJHgLlvKsmPJEW0fFjU5OX
 xy8HdFahSDQ9gur5RJUMmxWFbmGGT04rsytzXOIXGyGPm5owU88x8cnlRhkaDBDVoJr4
 JFF9wJaOtr0gVlgJw+jxZBDwskq063Bz5t+DmjHOYsEK0hQejK5I9RRRMSvfm1brcbEp
 gNGw==
X-Gm-Message-State: AOJu0YxoD7wL5KSQT0h2VrTqURsIU5ef2BwgDRrCgH7MvBGDui5sHkZl
 UZAHj6VVXQWrDRROKBXk8bg5S+TH7mPM5oPjZMh+CYSq3q7lGMarmqUpNli8vhUwcAFsEdRvLbH
 zAKGECmVu1RLO8isFbFLVJnnNKCvhmRtjd37mwgo=
X-Gm-Gg: AeBDievmceDdOSrY1A+j5tZRHn0nEdWcYRkuW+yoGQDz+dJE1oYQyT9pGxOw/iCqeDC
 cFD/MhP6nHLE2FIUeumjt+2YeI31UNa98A3EM/W8pI1BHg3IWuOB1XOl38/QrdUkQs5ygxWjH7K
 aiedviI3CPLj7Ap/gceM2CBHezp5IYGKbCrpTZaTGzdBNOMs00MTpRbkN3lgRQFoy83Y+91cYby
 pM6X3sZPIKIRN+qXr1f5GXVRDngl7Basi8z726o1yQm4qMU1TxsdzfXOlyYhcFJB4Zog/Z303ly
 nzpbDFndD/gePPYtOQ==
X-Received: by 2002:a05:7022:122:b0:128:d6c3:9b18 with SMTP id
 a92af1059eb24-12c34e8a1e2mr11135859c88.3.1776257529922; Wed, 15 Apr 2026
 05:52:09 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?7Jik7ZWc7JuF?= <oho790114@gmail.com>
Date: Wed, 15 Apr 2026 21:51:58 +0900
X-Gm-Features: AQROBzAzx7VZ80cRI627839i-Z6-EMcFnn8otFDNyCUJ5J2Klg9itCEH82aJDUU
Message-ID: <CABJHARC2Kx8vwB_ytq0PgKw2WUkY3GxfP3t+mgtQPC0oTAGF_A@mail.gmail.com>
Subject: WireGuard Windows 0.6.1 regression after recent update (tunnels lost
 & import failure)
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 16 Apr 2026 02:18:32 +0000
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

Hello,

I am reporting a critical issue with WireGuard on Windows (version 0.6.1).

We have observed that this issue started occurring consistently after
recent updates (approximately 1 days ago).

Before that, some systems updated to 0.6.1 without problems, but now
the issue occurs 100% of the time after updating.

Issues observed:

1) Existing tunnels are lost after update
- Previously configured tunnels disappear
- Configurations folder appears empty

2) Cannot import new tunnels
- ZIP and config files are not visible in the import dialog
- Even using "*.*" filter, files do not appear
- Files definitely exist in the selected folder

This is affecting multiple users in a production environment.

It seems that something may have changed recently in the update
package or behavior, even though the version number remains 0.6.1.

Please confirm if there has been any recent change or if this is a
known regression.

Thank you.
