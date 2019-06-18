Return-Path: <SRS0=O0ly=UR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9098C31E5B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 16:24:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E9FA2054F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 16:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Xgo17r0v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E9FA2054F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42b07c68;
	Tue, 18 Jun 2019 16:24:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 514b9942
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2019 16:24:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb9a7acd
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2019 16:24:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90434b11
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2019 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=0EMPi9GpAA6PD4g4aH4Nis+FxgU=; b=Xgo17r
 0vPvMSJPCcGNKzqP/xjtIxPrQwysL5S1psrMxi90z+ezdLfa3Vt0w5ef8Tv2yMr6
 TBwxU2OhIsn+dqwVnbULj6iHY4IwSFSASLvdYwZMot3mO4jHNcDD5Mu4l/o6lJzR
 pIJ2WQJyz2rl+SvDDKjOS7vyjuminfTsX4dP27Foy3ru6mYw0MY0q9E38vR3bUco
 WJOpqyGa6PxDdJePywgj/u+yXFnn6R+gsCc/LmUG5edqp8JwNrZKFR9scceiXw3M
 JGGrGQhmjSPt8ebq39E3RUL3aAGzpP8gyWbD7El5aDND2GEpvaO1VQztokAvx7nv
 c2WJl53zw/eNuvuA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9143cbb8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2019 15:51:12 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id n5so15723310otk.1
 for <wireguard@lists.zx2c4.com>; Tue, 18 Jun 2019 09:24:14 -0700 (PDT)
X-Gm-Message-State: APjAAAUpo1Suw1HWpjx3D8tzsCSVArWLkA4iEaqqEV6CQPxVJYx0z+Qh
 Eq2xPRaybbWP51GCJM62gswq879fsJfRWGe3s0k=
X-Google-Smtp-Source: APXvYqwW6RLA6Bn1k4YJWbt+AatM+sK2kXTBihcOlHnvZzq2pkKTT4eep2RkxyJwTvkBmYhpZtx77R8NzW4S6visHyg=
X-Received: by 2002:a9d:3e87:: with SMTP id b7mr6533993otc.157.1560875053660; 
 Tue, 18 Jun 2019 09:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <CABwq4PiyPwjPL+RPVcWZYy66j4gaVRc3OHEA6Aqm_SbL=9VFAQ@mail.gmail.com>
In-Reply-To: <CABwq4PiyPwjPL+RPVcWZYy66j4gaVRc3OHEA6Aqm_SbL=9VFAQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 18 Jun 2019 18:24:02 +0200
X-Gmail-Original-Message-ID: <CAHmME9rkgyG8kVsikznv_fvdXn5N-FZaQZ3hhthos4=dzSMqSA@mail.gmail.com>
Message-ID: <CAHmME9rkgyG8kVsikznv_fvdXn5N-FZaQZ3hhthos4=dzSMqSA@mail.gmail.com>
Subject: Re: commit 99895f27f3d63d2e92a5c1c411205ae70f2a5ca breaks build on
 arm64
To: Andriy Perev Ortkin <irherder@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Thanks. I'll fix this.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
