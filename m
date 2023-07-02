Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2895AEB64DD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 Jul 2023 13:50:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84cf5409;
	Sun, 2 Jul 2023 13:47:12 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 29294677
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 Jul 2023 03:32:09 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1b82bf265b2so14534895ad.0
 for <wireguard@lists.zx2c4.com>; Sat, 01 Jul 2023 20:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688268728; x=1690860728;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZhN94lMUNnHFPAhVfo+rHKI0yY7VxURxglHWp96Srwg=;
 b=H1lg1nuWSIDnWqY4UVAXcXDJAvhU1YHPpPrusiQohNNE5GvwsK4w5d69Q7qkFYlCoQ
 84Fxd+lbFB7/3yFhjBHEutcwet2ZEWFcyPyx9Aiuz2AvTnO0DuUHAzVoq6G1FspI2tte
 n9rLvN+0COGioC0U1u981OUG9XFc6lhXnN8I/qBfkElWhYTtUu6u3S2CF4dAMVi4KAnv
 LtzVHkclYvagZB1hY7ZPMEONvED3cxV5uNqWv41hLLykZAZsPnIFRZfMy+hSSgBmAHwi
 gi3FnH1A2+JRvnqN3YD4PpzxbfUlw6fwQtvaX5GDyVPDSLN608urxpB41kGVdFjezpSy
 yjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688268728; x=1690860728;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZhN94lMUNnHFPAhVfo+rHKI0yY7VxURxglHWp96Srwg=;
 b=iKc0iNIib/INKd3Va8/uSdEHuu7mAWiGLLIAh0uGnBvIqakzYiX6czonlxSnJtiHn/
 +Vd8Wcsvcxdim4hrqFUFYqmOt/rYXUeDSoQcIOlSVFhmbV9hKmlIUKmdt0iSpOghmhc0
 9KFcqNXGqNlLWcOjy0queZubsZPt6b+NIvMl7zMnNyVgk2UvTSw8tQySCD4OeorQ3fke
 UVY6yR0wCWp7LORc2L6nmL7cFHnW77nf+9tKlHvIu2YlOaJXVT5al9OWmpd0/ymnQfar
 YH4N4mG6rKpAdV6QwEHQ2/V7bZdT76u38TbCHJt2JwF5nYQS8VFY/n/tqzf/OKIxak7e
 8BHw==
X-Gm-Message-State: ABy/qLbpHjGF7Y3tAMr4desb0gNbyy8BxZADIIitdGnIPr4fmjDBtKiZ
 3wUr2MVZLodNX2Y3lXKkPMQ=
X-Google-Smtp-Source: APBJJlHZiamPWt4nUWriHFvnZ613G5ox0ZTDJ3hV30nK4Q6VIh6/Ew5xaB6xL5oCJQI9wAnlyBBErA==
X-Received: by 2002:a17:903:244a:b0:1b7:cee1:60c4 with SMTP id
 l10-20020a170903244a00b001b7cee160c4mr5800588pls.59.1688268727745; 
 Sat, 01 Jul 2023 20:32:07 -0700 (PDT)
Received: from [192.168.0.103] ([103.131.18.64])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a1709029a8a00b001b567bb970esm12931622plp.84.2023.07.01.20.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jul 2023 20:32:07 -0700 (PDT)
Message-ID: <e5b76a4f-81ae-5b09-535f-114149be5069@gmail.com>
Date: Sun, 2 Jul 2023 10:31:56 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Eric DeVolder <eric.devolder@oracle.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, David R <david@unsolicited.net>,
 Boris Ostrovsky <boris.ovstrosky@oracle.com>,
 Miguel Luis <miguel.luis@oracle.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Jay Vosburgh <j.vosburgh@gmail.com>, Andy Gospodarek <andy@greyhouse.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux RCU <rcu@vger.kernel.org>,
 Wireguard Mailing List <wireguard@lists.zx2c4.com>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: RCU stalls with wireguard over bonding over igb on Linux 6.3.0+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 02 Jul 2023 13:47:11 +0000
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

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> I've spent the last week on debugging a problem with my attempt to upgrade my kernel from 6.2.8 to 6.3.8 (now also with 6.4.0 too).
> 
> The lenghty and detailed bug reports with all aspects of git bisect are at
> https://bugs.gentoo.org/909066
> 
> A summary:
> - if I do not configure wg0, the kernel does not hang
> - if I use a kernel older than commit fed8d8773b8ea68ad99d9eee8c8343bef9da2c2c, it does not hang
> 
> The commit refers to code that seems unrelated to the problem for my naiive eye.
> 
> The hardware is a Dell PowerEdge R620 running Gentoo ~amd64.
> 
> I have so far excluded:
> - dracut for generating the initramfs is the same version over all kernels
> - linux-firmware has been the same
> - CPU microcode has been the same
> 
> It's been a long time since I seriously involved with software development and I have been even less involved with kernel development.
> 
> Gentoo maintainers recommended me to open a bug with upstream, so here I am.
> 
> I currently have no idea how to make progress, but I'm willing to try things.

See Bugzilla for the full thread.

Anyway, I'm adding it to regzbot to make sure it doesn't fall through cracks
unnoticed:

#regzbot introduced: fed8d8773b8ea6 https://bugzilla.kernel.org/show_bug.cgi?id=217620
#regzbot title: correcting acpi_is_processor_usable() check causes RCU stalls with wireguard over bonding+igb
#regzbot link: https://bugs.gentoo.org/909066

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217620

-- 
An old man doll... just what I always wanted! - Clara
