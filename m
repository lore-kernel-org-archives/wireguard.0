Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A873CF433DA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Apr 2026 02:18:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d3da6a4d;
	Thu, 16 Apr 2026 02:18:36 +0000 (UTC)
Received: from mail-dl1-x1229.google.com (mail-dl1-x1229.google.com
 [2607:f8b0:4864:20::1229])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 63937830
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Apr 2026 00:23:44 +0000 (UTC)
Received: by mail-dl1-x1229.google.com with SMTP id
 a92af1059eb24-1279eced0b9so10812627c88.0
 for <wireguard@lists.zx2c4.com>; Wed, 15 Apr 2026 17:23:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776299023; cv=none;
 d=google.com; s=arc-20240605;
 b=IgO9B2esDsG+0uTdgR/MIGVXWqCSj3PYyNrjAZdZclHW9EqvbJ45OyUhoKe7dQzthb
 UwdbhOUY9CrZxzvITZT+s2TjlTBQjkxGpInzJ1p2E5yQDRVt1K1jKZ09nYTyQs4pVPk2
 o4mXVWedDzB+LwTe6vb1Web+uszkV/MQXaeOHOcffzkPtV4x6ev9NyYysA2tcbn4zjB3
 vQgBb5ZpHXTO86E6jwrf+Eo3n0B/jnFfSrOHJRkVcPke6E/3npwpS4B8ZDKkk3J1+j+5
 1+gRieiMGBXbvewLU0EI9v38HzqCpTc76BOEpmycH0ZeShj7UpXE6RhKRr63DxhbomdH
 KBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=qqNrGscvN7ldg2mHFRuX580qch8xW1YAnlaGNpccqwQ=;
 fh=1CsOgAxkj0tSFTO0bRovl0wQS24+EZdEApJbdc/Xo54=;
 b=RGDFeQcnhJVCiombybnvphDY6fMMiIVyPp5kqKRyH1nIFgYDaqsDm9PUGWgz/lSv5U
 VSLcH7A/afCBxkE/C8XFlUPIVLy5A796wrXUBJtfJd+MkRG2kf4Br1oOYYaHy+HxwLY8
 R6UkkqbHRXeWw5WjcbL/bWQq1evuIn34AyIwpJ9NrgmA1dVX26YSqcQMw9NOEa/vpKxe
 c8pS8NucWEFTgYlhnb7GikBOcJLJ71pkCLHf0O/AYjeveYjQY97s2nsJDpdPJzSr37RT
 B5H0NtcoqPqYM4ABP7BFlp8gCFkCOXf4wxLEY3ClTiUv3f1YrAh0VMVx8uL+srrbH3V1
 azeQ==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776299023; x=1776903823; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qqNrGscvN7ldg2mHFRuX580qch8xW1YAnlaGNpccqwQ=;
 b=Zwj9+xkWbec49n4diXVK+0WpjMmyU/hToFs5X0oV0Wnd7+zmzNY19qHAj79fNfnkdP
 0zZ14e+yUmNnwMHsmorLc+oCEn2XIsDWqrcYT3LJOxJ6kkjBmp3nNze5rsllQg/DcDoE
 DVpp/5xIFKo7eqdDuDXhjojFj/1ham0izeCxcKQbPmx1PShpsEuNz+x1oINyhoWQr2RG
 +76J58iqGD787wJFyXD2mj0QzFwQkTMTIyaB39VpwJHVXeDBZW+v9B0Yc7pGtSDVOtgY
 lFV7YDz1C5VvyUEER9VroZ0Qsbnv14EZE+y8503TNFWeab21n2RA7agTagOqNwzEC7O/
 ULPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776299023; x=1776903823;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qqNrGscvN7ldg2mHFRuX580qch8xW1YAnlaGNpccqwQ=;
 b=LtySFz10b4Ie2IVl9SocCXmQ8B7CZL7PnwsRJkK9j8kA0sC8XiMrljcy9UMallIRAX
 dK/yLDVr3Ej+Xj0ERXpXb/rGBoNIE8eKjaplJBQPSBXEVyu5Aoxuy01F/WwncSCtMJfH
 htZ3NdRw8ib3lfF/QSHGzGBAS5M2AjXmaEZwyy/P9wvGGXKoJGKKlR40X0z5edYPaLus
 1OJOzaDiLfqBvpTuP+ry6IgS6wwcdbpeIB14+qBrgtMdtdAss7dA51QvttPQGAe3l5jS
 t/XP+O9HANfcEmaIXycdgb0CprMPQ1+ekHqjtOGFKWdGSSF7iHlCzScUrV7lApyWuhFT
 M6cA==
X-Gm-Message-State: AOJu0YydmUoJOgXHcXmWzZmY+I+B4EGy2OR0VPTzUUUNbbbdZn34m7pf
 2WxRduMXKMoYaqwaMKYNU2hWQwsIntrype9c4auaXBu8ne0ODw9m/iSijNCRCt9cxuQezS79/Rb
 XDx98thBAjZQKmf7HwjZX+P2LfdN39S4WDodcAaA=
X-Gm-Gg: AeBDievCgh60jfWuF8EcAmujHBYqG3SmTziHo8I/UwP5nDf1/j70+Uq7GL10fcHg5d1
 FZNfqRD/tQVkjujmksawZM6h5GDgKU3/Cowh5/SPM1PZhOiZMTQMRQxtU6G7VKz9lzX8weMEUMj
 Gq/+1JLZUqVJOQvdc7S1xGmPoy90p3nqwsuCnb12TnRfAfoWLtSKXWUOU8dPDaW9S33opf3ADg6
 igioLxepApbNEfNVB+NF0I8PQpzW4h5TAlguZgqvtKLT62+RrCNuroyfPRrZHiVdAuAYb0DGHm4
 C7ohOI4=
X-Received: by 2002:a05:7022:323:b0:12a:8ea4:252 with SMTP id
 a92af1059eb24-12c34e712a7mr12820028c88.4.1776299022459; Wed, 15 Apr 2026
 17:23:42 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?7Jik7ZWc7JuF?= <oho790114@gmail.com>
Date: Thu, 16 Apr 2026 09:23:30 +0900
X-Gm-Features: AQROBzDiPIoydJZ8-aWdG0rJeQhEai8vunMklSc5kAW5TIharJJqLVp80OFky8k
Message-ID: <CABJHARAB_44eZs46bYabn7AiN28zkOvXLRUKqQpqREdAQ0b_+g@mail.gmail.com>
Subject: WireGuard Windows 0.6.1 - Partial fix but ZIP import still broken
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

I am reporting an update regarding the issue with WireGuard for
Windows (version 0.6.1).

It seems that today's update partially improved the previous problem:

- Existing tunnels are no longer disappearing after update (this
appears to be fixed)

However, there is still a critical issue remaining:

1) Importing tunnels is broken, especially ZIP files
- ZIP files are not visible in the import dialog
- Even when using "*.*" filter, the files do not appear
- Drag and drop does not work at all

This issue is consistently reproducible.

As a result, users cannot add new tunnels after installation or update.

This is still a serious problem for production use.

Please check:
- Why ZIP import is not working
- Whether this is a known issue
- When this will be fixed

Thank you.
