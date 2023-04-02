Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2846FC761AF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 Apr 2023 01:17:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 415f2224;
	Sun, 2 Apr 2023 01:14:42 +0000 (UTC)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2e64bc60
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 Apr 2023 01:14:41 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso29264119pjb.3
 for <wireguard@lists.zx2c4.com>; Sat, 01 Apr 2023 18:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680398079;
 h=in-reply-to:references:message-id:to:from:subject:cc:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3EFW307Q1a9NE2VnugeWPScnJzPzCa3UGr8h5iI6ixs=;
 b=pYQAYvSp5VidtLn6DvumO2FxtxJJXjXVAfY3qkyGcDJlvOsJFFl/g2NGceEidR9Zzu
 X31NXEi/GgZZ6ibiLi+tz3oKsdOmsWHeifdBC1GeBsjVj6jZSc4HBrdoObfS/A3MTOA2
 /WWD66AaJ3CX07fBeEIMSVWU6siU2/v7RCQHyUbouVpPdkfFN339tDTf1PLp6xY43+3/
 fOn1mLhX89Ib9pUm4F+uXyhfUWhfyfL0NDHyEN916nm2FJpc08DCqhpE15tpsb0r573U
 XHuiLJWc/2ZNvS7FrFXwuYOZ21uUghhbHJN4zp59Wgx01OB42b7dXQWcOtVpKp1SyJFY
 6PFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680398079;
 h=in-reply-to:references:message-id:to:from:subject:cc:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3EFW307Q1a9NE2VnugeWPScnJzPzCa3UGr8h5iI6ixs=;
 b=pGIi3HFgEkOY82Dky2Jt7MIMIfSPvLKoEEbUsqSEid/pydQ8M6vbXeBjR3Vb7huJ1Z
 aaErh7EJ9KQbVEUAYnWE88qJP5Nq1SItnfcNTDotuYVwgxgxnE9f/PTCTi9Xy7OtzxDA
 +EYZuT2/mIdtjaFhsLFdnHFbYEgUFYr6rV4LVMjzhCX1OMIu+cL7l6MoHVP93U+129/7
 C4q2K6JHKPnOj2r/WK4YHrmxMJscCbLfjzmPATO94m5wStim3TXwN8/ZiI54466AShT9
 jiqTdcUYtsiW3qMEyiLVQQJCkgkn+FYSUKCS4/m26ohwCGEFBwfPlhbCDgS0pbrd9c+D
 hr8w==
X-Gm-Message-State: AAQBX9f8WFFdeHJlRZ65GI3atn/I0WUs14K6WTfY86zdNmh5wtGG1Z5x
 ygA9qdaMEqmL5E7JdFvArXo=
X-Google-Smtp-Source: AKy350beiZvjFbsp2uNoUfafp6FgprAll6esTjn9YkkQ7/VWQedOb5SJpIsU6dEpxZMIIGdsrRi+kQ==
X-Received: by 2002:a17:902:f0cb:b0:19d:b02:cca5 with SMTP id
 v11-20020a170902f0cb00b0019d0b02cca5mr27537058pla.12.1680398079418; 
 Sat, 01 Apr 2023 18:14:39 -0700 (PDT)
Received: from localhost (110-175-169-212.tpgi.com.au. [110.175.169.212])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a170902eac500b0019928ce257dsm3967493pld.99.2023.04.01.18.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 18:14:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 02 Apr 2023 11:14:45 +1000
Cc: <wireguard@lists.zx2c4.com>, "Linux regressions mailing list"
 <regressions@lists.linux.dev>, "Thorsten Leemhuis"
 <regressions@leemhuis.info>
Subject: Re: Possible regression between 5.18.2 and 6.2.1
From: "Dan Crawford" <dnlcrwfrd@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-Id: <CRLVEG5VRA7S.2XBZXJENZM4HK@crawfs>
X-Mailer: aerc 0.14.0
References: <CQZ7HWJCK18F.1AUR9FMHKPOXB@crawfs>
 <CAHmME9qi=26zP-A14pLVxtL86Zj1P-+i93t=_BnSd0t1Dj_U8A@mail.gmail.com>
In-Reply-To: <CAHmME9qi=26zP-A14pLVxtL86Zj1P-+i93t=_BnSd0t1Dj_U8A@mail.gmail.com>
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

Thanks for the suggestions. I've done some bisecting and I've found
that the issue appears due to wg-quick, which means I can easily work
around it. First, apologies but there's a typo in my original
email, I upgraded from 5.12.8, not 5.18.2.

On versions prior to 5.14.0, wg-quick correctly adds routes for the
appropriate addresses (line 341 and then line 177). However, on versions
after 5.14.0, the condition doesn't work quite right and the ip route
add command does not run (line 177).

To investigate this I print ip -4 route show dev wg1 match 192.168.1.3,
on both 5.13.0 and 5.14.0, at line 177.

On 5.13.0 I get no output, and the ip route add command runs.
However, on 5.14.0 the output is

192.168.1.0/24 proto kernel scope link src 192.168.1.0=20

and so the ip route add command does not run.

Obviously I can easily work around the issue by patching the conditional
out of wg-quick. But I don't have any clue why the output of ip varies
between 5.13 and 5.14. I'm also surprised no-one has encountered
this issue either (unless I missed something while searching).

Possibly one way to resolve the issue is to replace the conditional with

[[ -n $(ip $proto route show dev "$INTERFACE" match "$1" proto boot 2>/dev/=
null) ]]


Thanks
Dan


On Fri Mar 31, 2023 at 1:39 AM AEDT, Jason A. Donenfeld wrote:
> Hi Dan,
>
> Hard to imagine that this is a WireGuard bug, but more likely
> something having to do with SNAT or something.
>
> What is the unallowed src IP when you get that error? Can you debug
> further? Maybe bisect a bit? Otherwise, not much I can do.
>
> The diff between those versions you listed is pretty minimal, so I
> suspect your bug is elsewhere.
>
> Jason

