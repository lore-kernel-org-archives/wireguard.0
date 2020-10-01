Return-Path: <SRS0=Zpbp=DI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C633C4727C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 11:18:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B5ED208B6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 11:18:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="hYDimoVe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B5ED208B6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8cdda4cd;
	Thu, 1 Oct 2020 10:45:42 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ed239124
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2020 10:45:40 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b05639e
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2020 10:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=BZ+EfE7AqBnWDj6kLa8sBQsM/v8=; b=hYDimo
 Vem/yox36MROpWA2WaCmZLcNlSTUkZ2lvJT2RHCCqGBQiW6gd3mPZj/jruWbL3Zx
 TOi6lg1pfTEFik5DTlkNUge/2oMBdxzx1n5QTodaPSyQ6x4uuMyClQ3gpR/ZDA4+
 nbXrsaPFAzWqYS1bHUMtojW/QFyluRTydHdOHgkC4xRi21nh+3Fana6O/UGrQWf5
 S6jeFmH0hiFAT0cSjE1PtlL9UivHEB+m0LslgPfZ2BVLdHGHSOpFVUP2fg7nYrYm
 BQZSk6TTQU7K3z0c+7PZozoHbfXayh/w5doZbM/1aq8MOv03pZJ3WiCjI8CNBeEy
 RilW4wrtO40wLceA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f0f4eb87
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2020 10:45:40 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id k25so1615479ioh.7
 for <wireguard@lists.zx2c4.com>; Thu, 01 Oct 2020 04:17:30 -0700 (PDT)
X-Gm-Message-State: AOAM530mz+ET7db99Tgac8ZrIyPANv+2i2w+bEaWrB9XOb9dk2J+m66H
 VyQD9SQLQ+1QDrN42Gb8gFQi4PJUFi8T8kjX9FE=
X-Google-Smtp-Source: ABdhPJwGMjy+e4FQDE108hgRKEfmvMsWW7J5qjUZJYzdLrtud6nmFNsQO/FixocBpqO2GQZ29DpZA0j90xFUbcezeN4=
X-Received: by 2002:a6b:d603:: with SMTP id w3mr4923560ioa.29.1601551049920;
 Thu, 01 Oct 2020 04:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <6650E7F9-7985-4DFC-9620-60FFE690C4F8@alexburke.ca>
 <010101747ab4aca3-491864e4-b0b7-474e-903e-035cd3fd9884-000000@us-west-2.amazonses.com>
 <_6C1kLqz08ZzDSlyJFksWGJkEabvSXjImi0ZpRw7s5bjUcMYcUlzSTUg1aUVzhnmAyYvGtMpSYff1DvoDw_vbLxel15gdVmkxtAjZWDp-w8=@protonmail.ch>
In-Reply-To: <_6C1kLqz08ZzDSlyJFksWGJkEabvSXjImi0ZpRw7s5bjUcMYcUlzSTUg1aUVzhnmAyYvGtMpSYff1DvoDw_vbLxel15gdVmkxtAjZWDp-w8=@protonmail.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 1 Oct 2020 13:17:19 +0200
X-Gmail-Original-Message-ID: <CAHmME9qZcWfVGaJ210e3XLW60NhZY403CEve7YK+E7nfcJEyXQ@mail.gmail.com>
Message-ID: <CAHmME9qZcWfVGaJ210e3XLW60NhZY403CEve7YK+E7nfcJEyXQ@mail.gmail.com>
Subject: Re: Two small Wireguard frustrations on Mac & Apple iOS
To: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

On Mon, Sep 28, 2020 at 3:00 PM Laura Smith
<n5d9xq3ti233xiyif2vp@protonmail.ch> wrote:
>
> I am starting to seriously consider switching back to OpenVPN.
>
> Wireguard is great and all that, but frankly if there's not going to be any effort by the developers to fix these Mac and iOS problems then I'm not going to stick around any longer.

You're free to do that, and I'd generally prefer that instead of
having this mailing list turning into a place for you to vent your
frustration. These bugs are non-trivial. If you want to put some
development hours on it, we'd love to have your contributions.
Otherwise you'll have to wait for one of us. That's just how it goes,
and venting probably won't make it happen faster.

Anyway, we just finished a pretty intense cycle reworking some Android
things, so circling back to iOS probably isn't far off now.

Jason
