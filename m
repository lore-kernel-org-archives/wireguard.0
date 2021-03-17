Return-Path: <SRS0=bERg=IP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F04C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 19:55:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C5D164F65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 19:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C5D164F65
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=harz.behrens.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bd0b24f;
	Wed, 17 Mar 2021 19:55:48 +0000 (UTC)
Received: from post.behrens.de (post.behrens.de [2a01:170:1023::1:2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bfea059e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Mar 2021 19:29:14 +0000 (UTC)
Received: from [IPv6:2a01:170:1023:0:4d11:ef77:adf9:d62d]
 ([IPv6:2a01:170:1023:0:4d11:ef77:adf9:d62d]) (authenticated bits=0)
 by post.behrens.de (8.16.1/8.16.1) with ESMTPSA(MSP) id 12HJTD4F030533
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO cn=);
 Wed, 17 Mar 2021 20:29:13 +0100 (CET)
 (envelope-from frank@harz.behrens.de)
Subject: Wireguard for FreeBSD without iflib
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
 <YFH7yIJ9OImHUwYO@lion.0xfce3.net>
 <CAHmME9pqVfzWVsuTrC2eovbWTVeTSX086ZM6DSOK1ejPjkV3uQ@mail.gmail.com>
From: Frank Behrens <frank@harz.behrens.de>
Message-ID: <4621c1df-1fd0-489a-8a7d-b1731ae6626c@harz.behrens.de>
Date: Wed, 17 Mar 2021 20:29:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9pqVfzWVsuTrC2eovbWTVeTSX086ZM6DSOK1ejPjkV3uQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
X-Mailman-Approved-At: Wed, 17 Mar 2021 19:55:47 +0000
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

Hello Jason,

I read your messages from the last days in the freebsd lists.
In the version before removal from freebsd and in your current 
repository at https://git.zx2c4.com/wireguard-freebsd/ I see a problem.
I can't load the module, because I get the error:
Mar 17 20:07:53 <kern.crit> moon kernel: link_elf_obj: symbol 
qgroup_if_io_tqg undefined
Mar 17 20:07:53 <kern.crit> moon kernel: linker_load_file: 
/usr/local/src/wg/src/if_wg.ko - unsupported file type

I guess that is caused my the fact, that I do not have iflib in the 
kernel and you have only a TASKQGROUP_DECLARE(if_io_tqg) in the source 
and not TASKQGROUP_DEFINE(..).

Kind regards,
    Frank
-- 

Frank Behrens
Osterwieck, Germany

