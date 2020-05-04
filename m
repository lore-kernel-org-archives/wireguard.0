Return-Path: <SRS0=IpBN=6S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDB7C3A5A9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 05:27:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3DD1206E6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 05:27:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="LrUWi/q6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3DD1206E6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ee2483f;
	Mon, 4 May 2020 05:14:19 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a5fa7442
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 05:14:17 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a276d352
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 05:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=JCUJAD1Ss9PN8F8st1bc9w0rhvU=; b=LrUWi/
 q6xZ09DUs7dWZoMNWvLchu4uajp7odOQod6KCcyXE7kWPKoBlzcRdsAFnd+Iy9R0
 1RPKykUz1kJ9AozAv10l3M8SZ8umE+qeu1Rc3YhNETGFt3fsXlDa7R8V2sCW2ZvF
 AHuJqLGSyKjy6O7HwjFNLH9Wm6M3FtN4sBeaHuqLDgze85Fo5U4CiCN/NF9B1eZG
 z6UhkDz/hXqiXaODdkiKFC0/m7ZMKwQUnV6kUjK5JvjGYwsBs4qLxgF5KiYPdZDQ
 nY5Fyhi7wXhOF7MPP7ZlpWz8Gl3vPbujN4jYSm54k75mHBA1WPKBoPuwKhGjAIlM
 pR2Afvove4F4XvLA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6cd5d395
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 05:14:16 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id 19so10965653ioz.10
 for <wireguard@lists.zx2c4.com>; Sun, 03 May 2020 22:26:39 -0700 (PDT)
X-Gm-Message-State: AGi0PuaNhAD4dLuJTI71vtRlmSP4un5/TSn7MtmwN2+mypgAABUJNVN6
 ppqNHPqKrdqmii06OZZn7fUkdiZjc42pKSQhV+k=
X-Google-Smtp-Source: APiQypLhGdVbaaYDrR89UuqBxvWdxAo4nCxU3E8nqE2p1r5v3xetR7BFKC4tKfGViO3Kzt8HvnsEjs3hxG0QZOzjoBM=
X-Received: by 2002:a02:b88e:: with SMTP id p14mr13095246jam.36.1588569998519; 
 Sun, 03 May 2020 22:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAF75rJBKTbaK6CEQcmto=YcgA5NGrG85jSvSrYZpQV-L1xFMww@mail.gmail.com>
In-Reply-To: <CAF75rJBKTbaK6CEQcmto=YcgA5NGrG85jSvSrYZpQV-L1xFMww@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 3 May 2020 23:26:27 -0600
X-Gmail-Original-Message-ID: <CAHmME9oNus499EVFHVfLNjbOhU+vOV4P7R7USCm1ycNH2e0apA@mail.gmail.com>
Message-ID: <CAHmME9oNus499EVFHVfLNjbOhU+vOV4P7R7USCm1ycNH2e0apA@mail.gmail.com>
Subject: Re: soft lockup - may be related to wireguard (backported)
To: Wang Jian <larkwang@gmail.com>
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

Are you routing wireguard over wireguard, or something interesting like that?

Is ipsec being used?
