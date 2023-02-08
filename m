Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9D0C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 Feb 2023 16:51:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26e96ec8;
	Wed, 8 Feb 2023 16:49:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 69bc57e5
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Feb 2023 16:49:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 635FB615EA
 for <wireguard@lists.zx2c4.com>; Wed,  8 Feb 2023 16:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E45C4339C
 for <wireguard@lists.zx2c4.com>; Wed,  8 Feb 2023 16:49:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="pJrIOtV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675874944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JePphrJAKPBkcu8aXXxL+x3o/hCJ5kbZP5VSzbs0D+Q=;
 b=pJrIOtV4JKIwqddqQzAtDTGVMehpdm+uI98rJvRuapSL7JaZ/3yXSxbHxFfZw+1/pApujG
 +ehtWLiLOJFqGfLJYG4ZtESFL97LjtS/dBWIP9BhzGtsQc0j+spzfrhGfcX/ttNKL6x1x0
 4tBq2lAfx3FeRio92bcMw4wjkzJabPk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7ff65f78
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Feb 2023 16:49:04 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id g2so22775187ybk.8
 for <wireguard@lists.zx2c4.com>; Wed, 08 Feb 2023 08:49:04 -0800 (PST)
X-Gm-Message-State: AO0yUKW2+yJ3mkfnL0cNqvHKlJmncumQROQCH8jf/cK/VhbEbadIqGnW
 qYvsBdDqmDKmsF4V63/jwFTZjtU5f/URYIqDXgI=
X-Google-Smtp-Source: AK7set9WkAJDhUz5BWTBPk1yDjqHTEIN2dH4YydAgVyyZOG1gYP7sE4F7f1AF4dN5VcuvINUmraz/gJ58T7WVzessVw=
X-Received: by 2002:a05:6902:1c2:b0:89c:b633:73a6 with SMTP id
 u2-20020a05690201c200b0089cb63373a6mr817868ybh.365.1675874943899; Wed, 08 Feb
 2023 08:49:03 -0800 (PST)
MIME-Version: 1.0
References: <11c3d877-2d92-8593-0a9f-e2c918a791c3@gmail.com>
 <CAHmME9o-TTYatnRfPGOviU4++T-yxLzNN+tytTs+oZBT7qF_nQ@mail.gmail.com>
 <2166b145-1508-b407-da27-93393989d209@gmail.com>
In-Reply-To: <2166b145-1508-b407-da27-93393989d209@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 8 Feb 2023 13:48:51 -0300
X-Gmail-Original-Message-ID: <CAHmME9o_UJta9KO+nO1ber+j+M=NMRvWEAxC4FUF05_Zd25-rw@mail.gmail.com>
Message-ID: <CAHmME9o_UJta9KO+nO1ber+j+M=NMRvWEAxC4FUF05_Zd25-rw@mail.gmail.com>
Subject: Re: [PATCH] wg: Fix show all endpoints output
To: Dmitry Selivanov <dseliv@gmail.com>
Cc: wireguard@lists.zx2c4.com
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

https://git.zx2c4.com/wireguard-tools/commit/?id=b4f6b4f229d291daf7c35c6f1e7f4841cc6d69bc
