Return-Path: <SRS0=xHST=JO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87806C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 17 Apr 2021 15:23:30 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A4B611C2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 17 Apr 2021 15:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07A4B611C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=harz.behrens.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06924524;
	Sat, 17 Apr 2021 15:23:27 +0000 (UTC)
Received: from post.behrens.de (post.behrens.de [2a01:170:1023::1:2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7f35a22c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Apr 2021 15:23:19 +0000 (UTC)
Received: from [IPv6:2a01:170:1023:0:8d20:ee4:c417:bc88]
 ([IPv6:2a01:170:1023:0:8d20:ee4:c417:bc88]) (authenticated bits=0)
 by post.behrens.de (8.16.1/8.16.1) with ESMTPSA(MSP) id 13HFNI2h065691
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO cn=);
 Sat, 17 Apr 2021 17:23:18 +0200 (CEST)
 (envelope-from frank@harz.behrens.de)
Subject: Re: [PATCH] freebsd: Implement selection of FIB (routing table) for
 tunneled packets
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <6aa0fd33-4c0d-557f-f7f5-5f5406b3a273@harz.behrens.de>
 <CAHmME9q6dO1X+Gt3hY4kQxsQ4DqeaJGxoT8qkaAe-0s_WCrVrA@mail.gmail.com>
 <ee43587f-8e17-add1-6b28-174639d126f8@harz.behrens.de>
 <CAHmME9qaMcd0R1zvFy+ZyW4a1vmX1bE_Rxf4WFgau4UTdEi7hQ@mail.gmail.com>
 <CAHmME9r13tPji0Guw3_Q8k4grh046RkSccPLbEVAasKQ=BNkVw@mail.gmail.com>
 <89952f1f-5296-7f87-9345-0f5c087ee3ae@harz.behrens.de>
 <a5cdf813-3cf6-b5e6-d497-78980c681958@harz.behrens.de>
 <CAHmME9rCzvFGv3=ZwurVMnax0RzKQr2mTCAgqT9EY8MEbJ24Ng@mail.gmail.com>
 <9a60aab2-788e-ba1d-96ac-cf6d08bf4bd1@harz.behrens.de>
 <CAHmME9r9_gykGRebWvw5mAaxqqo1i_ZncfQeR7AxhaR_C4S5vg@mail.gmail.com>
 <d5904ed8-ee49-690d-3bc6-b0afc2cb28fc@harz.behrens.de>
 <CAHmME9r=EDav2CmWLXSOcaUadzk-+N89GMCMA6xuqim5EcWDHA@mail.gmail.com>
From: Frank Behrens <frank@harz.behrens.de>
Message-ID: <3d610bc1-84c9-1ad5-a366-3c8b77efb858@harz.behrens.de>
Date: Sat, 17 Apr 2021 17:23:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9r=EDav2CmWLXSOcaUadzk-+N89GMCMA6xuqim5EcWDHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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


Am 17.04.2021 um 17:00 schrieb Jason A. Donenfeld:
> Does this actually fix or change anything? Don't new sockets have
> fib==0 right out of the gate already?

New sockets inherit the fib from the current process. If you create
the wg interface from a process with different fib, that fib will also 
be used for this socket. Probably the difference in code is not very
important for the case of a system default boot. But that may vary
for jails/vnets with different default fibs.

In my test case the sequence
 > setfib 1 ifconfig wg0 create ....
 > ifconfig wg0 tunnelfib 0
failed.

    Frank

-- 
Frank Behrens
Osterwieck, Germany
