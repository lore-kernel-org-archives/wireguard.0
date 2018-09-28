Return-Path: <SRS0=l6+B=MO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7765C64EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 03:06:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A01F2083F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 03:06:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBBY9c6u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A01F2083F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3af719e4;
	Tue, 2 Oct 2018 03:06:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a4d58bb
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Sep 2018 15:00:05 +0000 (UTC)
Received: from mail-it1-x136.google.com (mail-it1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29ade310
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Sep 2018 15:00:05 +0000 (UTC)
Received: by mail-it1-x136.google.com with SMTP id p129-v6so2933890ite.3
 for <wireguard@lists.zx2c4.com>; Fri, 28 Sep 2018 08:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jOC8ZI1v2V4PF1ojqqIYOjifRS1yYxslhdhmQiFxDcU=;
 b=iBBY9c6uL/IOWUvP0MqlSnJTnHtpDfLzjubALJCiu5qXrLV6fPLQYGjSDa8K3rwIT4
 O4iqRQpXk510h4tHOLW6WrF/YNxIdx1Z6NqrhRAY3ycJM/OmfbXzezy4vNHy3wlL6z7y
 ZolyBFaXmGmXDNCw3IWhVKdPUTaKd52KK0iPE+gl7ysdFYTiWvIiSEkcq6sRVA0Mf2T1
 GMexwm1/Z+w102GvV5FMCdxNExj/eFDJt7kVwv0GJdOjLo/6mJY0gj9JcQPrEq1dCoht
 kKfSKMDzBZyycDtvXpWudjHltKEG0v4qA7HgYQQDmvKPiiZWl6gkkjFtU3d+2otTpB1/
 4QJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jOC8ZI1v2V4PF1ojqqIYOjifRS1yYxslhdhmQiFxDcU=;
 b=fKj4Xby9fbikQ8+ZqF3kmMATfP1gsXhTOWEwj4pJAkxP1BJvJ3Y8gL9LDHqha902Kx
 hN2QvgPMnJp/4zHJdL+BJuMh7FqJo1tls7wq8Algi6phSA5bB9pZbo/n7hyz5DAtyqRO
 ogTy8Vy7AJVjaakiQ8ih4giwDnP8+1EwrdbZO8iItN0ZtpEZJ8fcMLaNnaBIg7eKNNKL
 hG16zgJEMzdEo/oLy9+ux9KidOs+KCD4J397hpqVTTJM6D/PWV3uAoONHaQhDu1bHJrH
 ZzSCtGujSeg8kdSGbvAtdJwSR37kGtKJTyzApKGm9rEUo5Jl+rM/ZYtbFlhlGKhF8TUU
 odKg==
X-Gm-Message-State: ABuFfojjTxy0jYZG+LBBfSS9BiNhacW9oYmMY8qDE87B0gaE2SikmaVs
 89u+mgi3YsWAqd4qLaAPngcziioDD2zVVZzFpJnDWzmL
X-Google-Smtp-Source: ACcGV63m1l63QN1UfnNWngWOGa3VQZ3Lgy2YphpqhmLKJkhFu0hoqhKsOX50wehw6AB5S0iG6brduD+B/OfhA4XnqJw=
X-Received: by 2002:a24:c8c3:: with SMTP id
 w186-v6mr1736189itf.115.1538146983357; 
 Fri, 28 Sep 2018 08:03:03 -0700 (PDT)
MIME-Version: 1.0
From: Heath Borders <heath.borders@gmail.com>
Date: Fri, 28 Sep 2018 10:02:52 -0500
Message-ID: <CAEy7hVPn++92XRedQg2OSwK0OAoqds6b15U2iHjePrWie1qrKw@mail.gmail.com>
Subject: bash_completion errors when installed with homebrew
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Tue, 02 Oct 2018 05:06:16 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I installed wireguard with homebrew thusly:
```
brew install wireguard-tools
```

I'm also using brew's bash completion in my `.bash_profile` and `.bashrc`:
```
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
```

After installing wireguard, when I open a new terminal, I see the
following errors:
```
-bash: complete: nosort: invalid option name
-bash: complete: nosort: invalid option name
```

I've traced these errors back to the following commands using `set -x`:
```
++++ complete -o nosort -F _wg_completion wg
-bash: complete: nosort: invalid option name
++++ complete -o filenames -o nosort -F _wg_quick_completion wg-quick
-bash: complete: nosort: invalid option name
```

I'm running macOS High Sierra, which runs bash version
`3.2.57(1)-release`, which doesn't support the `nosort` option. I'd
rather not upgrade my entire terminal to bash `4.4.23(1)-release` that
wireguard installs as a dependency.

I filed an issue with homebrew as well:
https://github.com/Homebrew/homebrew-core/issues/32535

Thanks!

-Heath Borders
heath.borders@gmail.com
Twitter: heathborders
http://heath-tech.blogspot.com
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
