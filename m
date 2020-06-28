Return-Path: <SRS0=3w+q=AJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D00C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 28 Jun 2020 10:15:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B514A206F2
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 28 Jun 2020 10:15:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAYOwxOP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B514A206F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdd25609;
	Sun, 28 Jun 2020 09:55:52 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c72614c6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 28 Jun 2020 09:55:48 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id h22so7544759lji.9
 for <wireguard@lists.zx2c4.com>; Sun, 28 Jun 2020 03:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=LrFT8G00gUhTIR/AlbD/AOjkwHPK2c+zEZf62wtVkH4=;
 b=FAYOwxOPEBkVw8FzJotdWn5h4Cza35Qums3fB6Cat2rV1QrPM86j2MRQ4L5Lh57n8c
 d2ugHsstn2foRbBRragvg4Nf4zCQugTGQn8eD71/rQw6SHOoI0BjzPFzBxCkp6+lU1TK
 CqKXn4A5mduxhSh9pn/RoWCcgtAME/xKeZGchxWFVUxHV/zZmipK3VeuU8wbpsoxQ7El
 Kl7Dd7m5baKEYEVyHxkWZpshgS4ZnWXF/As37YgkGpBVDiu8WqgUkGi95yc6RiS42VOh
 ufLVMgyyCa0CbApSjqZeHu4ko+tpEsGQjyhTWjeBsGNXpQcO7kkq7dRymlMfvInGIMA9
 1p0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=LrFT8G00gUhTIR/AlbD/AOjkwHPK2c+zEZf62wtVkH4=;
 b=OvIQA8LZcL4CLmeu5cI3y75FOd6VNgH3Neu/a+uriHfsFAe6aYNWcrOYaiGjl9ckQB
 dbadd/iWrGMWuMZrGUwJBs2ss/eHIKvNlOwyI1v/iAtfmPpdXuawkUiEJTbT1JC7peEp
 on/CCfgGUXs6N3eDNpJ4Vs97/yaL0Yn1qf1D/VNXxsrntXKcvNd8o4+W19CAiLblFv2P
 rVOFTE3FNB+oI8ZOcylhRuFG86SAV3+HKM60xIIGe42Te8uCnzKVUugEMqByNqGD4s0b
 odglE/61Bh2PCq/WvjVYAON2KfNlrIothv4NfhZKwi8byRWL5ylvNdLrkiYr7bUQ+N4I
 +OCA==
X-Gm-Message-State: AOAM533dhfQLFK/VgshT/EVNbfMGMlE9a7+6chGXWc1HJXxJmvyiIGej
 fx4pgWSfyFPG5L2wXDRBUvo=
X-Google-Smtp-Source: ABdhPJwFfraNWuXKjBXg84cLFiiNYEVR/ISZceIDtB4wJE9WSftGThgDtvHNmk537TywwwRN+UIO7A==
X-Received: by 2002:a2e:96cd:: with SMTP id d13mr5292660ljj.251.1593339316433; 
 Sun, 28 Jun 2020 03:15:16 -0700 (PDT)
Received: from mammut (8637-c174-83c6-02de-fe80-8327-07d0-2001.dyn.estpak.ee.
 [2001:7d0:8327:fe80:2de:83c6:c174:8637])
 by smtp.gmail.com with ESMTPSA id d3sm7919472lfe.93.2020.06.28.03.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 03:15:15 -0700 (PDT)
Message-ID: <0675d275c3b540e0bc9553e85ab00a833f1f7e44.camel@gmail.com>
Subject: Re: Standardized IPv6 ULA from PublicKey
From: Arti Zirk <arti.zirk@gmail.com>
To: Reid Rankin <reidrankin@gmail.com>, ch@ntrv.dk
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Sun, 28 Jun 2020 13:15:14 +0300
In-Reply-To: <CAMaqUZ0nTL9mbYEifHP-sc8kQ6ehAOOWfmEb7ARNfZWWDkv4eA@mail.gmail.com>
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
 <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
 <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
 <CAMaqUZ0nTL9mbYEifHP-sc8kQ6ehAOOWfmEb7ARNfZWWDkv4eA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On L, 2020-06-27 at 17:43 -0400, Reid Rankin wrote:
> Luckily, Blake2s is a simple and elegant algorithm, and in an effort
> to get some working code out there I've [implemented][1] it in ~100
> lines of Bash script.
It turns out that Python includes blake2s implementation that seems to
work with default arguments. So it's possible to implement this IPv6
address calculation algorithm in 7 lines. 

https://gist.github.com/artizirk/c91e4f8c237dec07e3ad1b286f1855a7

