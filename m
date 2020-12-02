Return-Path: <SRS0=K6Kf=FG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9403BC64E7B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Dec 2020 14:06:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E5220705
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Dec 2020 14:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E5220705
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d5b2ecb;
	Wed, 2 Dec 2020 13:58:59 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4a2f82a6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Dec 2020 13:58:57 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 691d2147
 for <wireguard@lists.zx2c4.com>; Wed, 2 Dec 2020 13:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type; s=mail; bh=Lty8xfsCVeVsWeRXjvHuHYuUWOU=; b=s2vF0+
 A27UweVQy/uvHXAsgFKs1ZUPO7CZcmCQF35JfkJ/dkdnrIm4ldyvkucHvqr0ZWBh
 lCbIQd4lJzEQbxUZ0LTs1YCFOW3hIBHu3l40kbjpDBDPGFChneNKk0xIBjMT0ZIN
 4vGRhO8R35GXKdMNMlSxU2k5VK3Effn9wONPoSjUJePr3A12JIol6gqYZ+6SaqM7
 PoQHlNqR+Nlfn3x6Djf3ZDsWbGsayB210XKNxQCMi0ADNREa/MjzLDaLVqErEHkF
 u8DxST525rnEQvYnSG0lph888MmVqkFpj5kgeJjXeklwqKhHhTw+vpZ/ZcVNSj6z
 3dWKvEexo/a9q0WQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7398e873
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Dec 2020 13:59:43 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 10so1692865ybx.9
 for <wireguard@lists.zx2c4.com>; Wed, 02 Dec 2020 06:05:31 -0800 (PST)
X-Gm-Message-State: AOAM5335asqPWYaW7Qu2r/wjvGujGHm9T4ebBvkb2UO9w8pmFtujLlp/
 r/WaNsZFdpVqHInQCwn7vlLyU3rDtB/IZqEVi4I=
X-Google-Smtp-Source: ABdhPJwEwRHJOOR/7fFsLoW2k3gbIyPj0DHEaWOEm3omtOfiwnk1N6HZaz2Hx1Eav/wLAwkMSMWww9q5v1QEb/lT09A=
X-Received: by 2002:a25:d215:: with SMTP id j21mr2992992ybg.279.1606917930117; 
 Wed, 02 Dec 2020 06:05:30 -0800 (PST)
MIME-Version: 1.0
References: <CAMy1ncKmBmWcnsyD0Mg9SGGMpYsHpbH+nGTMtx4Kkx0kF4V_VQ@mail.gmail.com>
 <CAHmME9rqKvkJn_=DJrvTOQhp8Q1pQobYBHivYXDerawF5UFdjg@mail.gmail.com>
 <CAMy1ncJtqYE6GQY4pQfq7=hw05SMRceC=unAQgGXcnLX=SAcQQ@mail.gmail.com>
In-Reply-To: <CAMy1ncJtqYE6GQY4pQfq7=hw05SMRceC=unAQgGXcnLX=SAcQQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 2 Dec 2020 15:05:19 +0100
X-Gmail-Original-Message-ID: <CAHmME9rtbJ6cMVheCmQqAeyvwtZU-_4xkTP2fdoffWWAZm7DwA@mail.gmail.com>
Message-ID: <CAHmME9rtbJ6cMVheCmQqAeyvwtZU-_4xkTP2fdoffWWAZm7DwA@mail.gmail.com>
Subject: Re: [PATCH] Use localtime in inf2cat
To: Stefan Rinkes <stefan.rinkes@gmail.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Wed, Dec 2, 2020 at 3:02 PM Stefan Rinkes <stefan.rinkes@gmail.com> wrote:
>
> Hey,
>
> Sure! Attached the patch including the signed-off line.
>
> Greetz
> Stefan

Thanks! Applied:

https://git.zx2c4.com/wintun/commit/?id=dd337577185f2d5cf76df2e14b833acf52923817
