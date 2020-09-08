Return-Path: <SRS0=5dvq=C3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF490C43464
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Sep 2020 15:58:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F01CD23787
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Sep 2020 15:58:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n09uiOHQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F01CD23787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c914ab84;
	Fri, 18 Sep 2020 15:27:34 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2bf77c56
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Sep 2020 23:42:49 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id a15so17870970ljk.2
 for <wireguard@lists.zx2c4.com>; Mon, 07 Sep 2020 17:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=to/E5dqvk+e5zoarizq22MHV+RPJcvHxcw7VwqBwUX8=;
 b=n09uiOHQho2IBRmML3VevlOaQGLsjexn52ssUsDAKQnvcB51wSVEtPbKt3NXDi2V5R
 WqF8rHXOZRpOePbP8wlo4jKl6lWM4zfem23xXn39IP2yQ1iDxXdMu0TLHcZij2z9KJel
 GkDSwZBlQUvAt/IiDRnnfUMBzOgBSR2xJ83BbcpQVNJa1JCtxT4gl9jcdrcayzQuJ90H
 5813I3KViTYuUeOkeSiJZs5epXJdMw1Hq79VDrVPsnFBZgyYqD6zmjYF2OqfR5E9WmUT
 zwohH8cFmpMLi2FDOz9qrxwZN0S98zRR4MZ4E9gQW1eV23K2m2+6GiDyCQbFh2Ei9AL+
 5qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=to/E5dqvk+e5zoarizq22MHV+RPJcvHxcw7VwqBwUX8=;
 b=kx6kd/m0mSXnVxoGFRn+NaNpoXGuaSQO5ZdCSIV1RfaoUfej8e9keNZ2lLEJ3LhUcf
 QqySLIvGlVcjSMGRFthQhe+eaCZTZUlsgk2tV8fUlFh0HRyX4VJYWeidSarnrgZ4O7oO
 IC5UvoMzEWZ3PgJ0DPEI4x1vZaD4D7iQN9oM4gexWPEoRVXOaDUrSiK2bOOcJo3tOLcU
 v0NI2k94JIUWHaC9Ym/tbX6BkA7RtexIB0v8ae3Em3JyqTBf+AkaC5DxOyg69vNGqlHB
 8swAyRMh5+2gqaRAMonZc7xQsV+p+5t7hXw5AwE1BGwm1LY8PTAvZkAHMXDPwJrQW6E2
 ApJg==
X-Gm-Message-State: AOAM53238Ehrqs86baSXY3Tv0xXkCBcmxgmRpKIAnZrBjSj2wA08EX3w
 xG5eVJVMf6AlXN5kyG9gDo+X40NCRQlj9niZSfji99oCD+Q=
X-Google-Smtp-Source: ABdhPJw0pryMfT7xRErHPxDMn5L+h1oNkcO9PNKC+awbHW6eou2YLobYDCGVbE1843MVBZ5FDCRc/ERrJ8YCSqzVPMc=
X-Received: by 2002:a2e:9cc3:: with SMTP id g3mr5883669ljj.146.1599523896738; 
 Mon, 07 Sep 2020 17:11:36 -0700 (PDT)
MIME-Version: 1.0
From: John Smith <dingrite@gmail.com>
Date: Mon, 7 Sep 2020 20:11:26 -0400
Message-ID: <CA+5JoNpJJkVML70Rm=S0iD1hAaJGwYqVPrpeLOAfptDzZGE9ug@mail.gmail.com>
Subject: wg flush conf?
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 18 Sep 2020 17:27:32 +0200
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

There doesn't appear to be a wg command to flush the config (leave the
wg interface alone)

If this is incorrect please let me know. Otherwise this is a feature request.

For now I'm resorting to having a 'dummy' flush.conf with a random
privkey and no peers and setconf'ing it to devices I want flushed.
