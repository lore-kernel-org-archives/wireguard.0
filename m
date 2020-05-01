Return-Path: <SRS0=vxWX=6P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C2BC47254
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 May 2020 21:59:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 701802166E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 May 2020 21:59:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="BrLlkR5y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 701802166E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84706ac9;
	Fri, 1 May 2020 21:47:02 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3a1eaf8e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 May 2020 21:46:58 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd6df253
 for <wireguard@lists.zx2c4.com>; Fri, 1 May 2020 21:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ggVa6VyVaU5wp6auM0vljZiTPeM=; b=BrLlkR
 5yBks1cT2W+KIi/R9YkPkYbJIaSUlBHJwhKuhrMohSQIhkaMvhVzQERbUXnt2QsA
 epRDc2t0bRSi/R58l4/RfjMlGKOB8U43te8BzQUHhC6sO/VaT53V58TEAIpYapLD
 Bs8Ub0E2P+OCGue1tI4ZDKgzVTGomE5V4RAZi2o3FrE2hKyO0/myVs6Q0dEmfh2Q
 VA6oBeE0Tpd+kUs8LDGI2nkdPc8KWLNCsoV8zwZ1gJA9Gq+XsV8Ebv1Q/kjgulNQ
 PXoORaZkDDxlwH+LlV75Z9A5vk3Qibd1M88H3Br+0/hI/kFUfgy4rF5BGEUtxFi3
 R5cMNZKiGibs9IWw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 590068dc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 May 2020 21:46:58 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id k18so6254865ion.0
 for <wireguard@lists.zx2c4.com>; Fri, 01 May 2020 14:59:02 -0700 (PDT)
X-Gm-Message-State: AGi0Pubk42Qi5lFQt/76laVNX2i70pmhDcwEPNGAS72EezTHyBy7dluE
 AxG5hla95wgWgrZPw4M7cSxYp2FnHvbFtA9jS4E=
X-Google-Smtp-Source: APiQypLhPqPljTqcedaL4e/FQltgNFMAmUaIkVUf+suMFAiRme9bqNHnvMFxOdWQ3cH8dWwAUmfXBs94egnfmndmhpc=
X-Received: by 2002:a05:6602:21d3:: with SMTP id
 c19mr5747249ioc.29.1588370341878; 
 Fri, 01 May 2020 14:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200501215555.9775-1-mardnh@gmx.de>
In-Reply-To: <20200501215555.9775-1-mardnh@gmx.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 1 May 2020 15:58:51 -0600
X-Gmail-Original-Message-ID: <CAHmME9oXXhUvpugBKtG67s8dUeSRn3HN4NCh7S-7GiHt=GSsbA@mail.gmail.com>
Message-ID: <CAHmME9oXXhUvpugBKtG67s8dUeSRn3HN4NCh7S-7GiHt=GSsbA@mail.gmail.com>
Subject: Re: [PATCH] systemd: add file wg-quick.target
To: Martin Hauke <mardnh@gmx.de>
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

Applied, thanks.

https://git.zx2c4.com/wireguard-tools/commit/?id=a671cac9bd01e38ab96f7ca761990cc774869a8d
