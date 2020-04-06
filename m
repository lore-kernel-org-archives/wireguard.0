Return-Path: <SRS0=i4ZG=5W=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0172C2BA18
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 06:28:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B2C3206C0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 06:28:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xb5IkjS2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B2C3206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c22aaa82;
	Mon, 6 Apr 2020 06:19:19 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 84c556e8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Apr 2020 06:19:18 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id g27so13289234ljn.10
 for <wireguard@lists.zx2c4.com>; Sun, 05 Apr 2020 23:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TA0i93ZfNpKT9RMZ9FjKL8eYJPNIRzw0+pmAGCNpW1w=;
 b=Xb5IkjS2VuiiIlnE0WxRt/HRFAtTS634u348TSYWaA3I1zA7qfL8XTTknSPSyak7PP
 vbDhQcsdRg1RKP5CeVJASn7ejN8r3+mtQHNtYg+T8CSH4hZrarY6TXo6Rtq3iFRZVfXv
 BFkGYremzlxzwxrEpgF3d4HfGOPzHSEHLuwVowOvjaHBu7wCTn/KAigMtF/vK0e7iZmB
 gWaBQd+wEsHYsJ93tGFWpzcBmNUj2bxIKoWYzZ78FV2kgTWJROIf28b6TdU0Vo0PUNtm
 rK2T12Z4n+YIin4OQuyf3Pn06o1fC1Jyzj3GFqcU8c27qI9ZU9TSiMYM1RavYBE1fWPb
 qGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TA0i93ZfNpKT9RMZ9FjKL8eYJPNIRzw0+pmAGCNpW1w=;
 b=MV2G0D5y9kxsqK3mJOGIdKKR8t+W6JEj3gMUP67Rhd6n89s5jGA2zRKlYNsU7bQ0Qo
 0U5JBmNNa3GceGUpVZSH1VeWCucY5f1z4O4LxceqiSRMKkPdeTYyCKuazF6ugrHJbmJg
 d7D5cT/9XOEq9F3pAXRPs9RBUpg510IptHfz5sWLx9d19VD6ixzhVf9KKjPf7NFlmYIv
 Lu/SNa4o+oYQMR8lNEljvbmiaGJYT+AThh1eJzUy2TRxinDKLJuoy3gCHETFCTVaeNVN
 TLclWkIxkgKAUE+HGZufy3QtsS+gf8hkbd/BWmVNfpQwaW8LaIQIiqi/r8y+XnOwDMgp
 eRXg==
X-Gm-Message-State: AGi0PubBonY+2mleI/xVuulaVE23qntNmkKoM40fDnc2QqNXn3c4taCo
 SoqNk1C4nYPNCistLzOR27UzOXyV/+nwbQ88Z0c=
X-Google-Smtp-Source: APiQypJQB5NX9XJNJLPScDLkfqVg5b9+gJbzJdOi09pIvi422sYelhGgqYedhGR6J3ku5fhEBZSQWmb/Gn0pik19/60=
X-Received: by 2002:a2e:6c05:: with SMTP id h5mr11093203ljc.217.1586154482418; 
 Sun, 05 Apr 2020 23:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <CABtXGiDykFrPtVPsn8QOfr2WayPOU_hn+_VpgmJy9Ap3+LOTfw@mail.gmail.com>
 <CAHmME9rWYZ1VHXgUw2Pku0oxKetNZHyuKHAreAVDgAOYXCdgtw@mail.gmail.com>
In-Reply-To: <CAHmME9rWYZ1VHXgUw2Pku0oxKetNZHyuKHAreAVDgAOYXCdgtw@mail.gmail.com>
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Mon, 6 Apr 2020 08:27:27 +0200
Message-ID: <CABtXGiB3V4tXZ5CzN764zj+A3Ro_yji2e_+mQauTJjYMRegf2Q@mail.gmail.com>
Subject: Re: Android app user (not test on iOS)
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

Thanks.

From encountering the bug, and me sending the email the app did indeed
get updated automatically on my phone.

Awesome. Thanks for your hard work.

On Mon, 6 Apr 2020 at 08:24, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Update the app. This was fixed, but you're still running an old
> version, most likely.



-- 
Use this contact page to send me encrypted messages and files

https://flowcrypt.com/me/phillipmcmahon

P.S. Drowning in email? Try SaneBox and take back control:
http://sanebox.com/t/old3m. I love it.
