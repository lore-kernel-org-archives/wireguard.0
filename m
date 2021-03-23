Return-Path: <SRS0=PPOQ=IV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57414C433C1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Mar 2021 14:44:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B40D6619AE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Mar 2021 14:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B40D6619AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=harz.behrens.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51416b9a;
	Tue, 23 Mar 2021 14:44:18 +0000 (UTC)
Received: from post.behrens.de (post.behrens.de [2a01:170:1023::1:2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b980dd9c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Mar 2021 05:51:22 +0000 (UTC)
Received: from [IPv6:2a01:170:1023:0:bc17:3748:aece:f0af]
 ([IPv6:2a01:170:1023:0:bc17:3748:aece:f0af]) (authenticated bits=0)
 by post.behrens.de (8.16.1/8.16.1) with ESMTPSA(MSP) id 12N5pKwZ042519
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO cn=)
 for <wireguard@lists.zx2c4.com>; Tue, 23 Mar 2021 06:51:21 +0100 (CET)
 (envelope-from frank@harz.behrens.de)
Subject: Re: [PATCH] freebsd: Implement selection of FIB (routing table) for
 tunneled packets
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <6aa0fd33-4c0d-557f-f7f5-5f5406b3a273@harz.behrens.de>
 <CAHmME9q6dO1X+Gt3hY4kQxsQ4DqeaJGxoT8qkaAe-0s_WCrVrA@mail.gmail.com>
 <ee43587f-8e17-add1-6b28-174639d126f8@harz.behrens.de>
 <CAHmME9qaMcd0R1zvFy+ZyW4a1vmX1bE_Rxf4WFgau4UTdEi7hQ@mail.gmail.com>
 <CAHmME9r13tPji0Guw3_Q8k4grh046RkSccPLbEVAasKQ=BNkVw@mail.gmail.com>
From: Frank Behrens <frank@harz.behrens.de>
Message-ID: <89952f1f-5296-7f87-9345-0f5c087ee3ae@harz.behrens.de>
Date: Tue, 23 Mar 2021 06:51:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9r13tPji0Guw3_Q8k4grh046RkSccPLbEVAasKQ=BNkVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
X-Mailman-Approved-At: Tue, 23 Mar 2021 14:44:17 +0000
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

Hi Jason!

Am 22.03.2021 um 19:14 schrieb Jason A. Donenfeld:
> Applied to git with some small modifications:
>
> https://git.zx2c4.com/wireguard-freebsd/commit/?id=0a5c6abdfaa1f4f09269a222c1720e2ff3b8aa02
Thanky you! That looks very good.

-- 
Frank Behrens
Osterwieck, Germany

